data "template_file" "backup_policy_template" {
  template = file("templates/backup_policy.json.tpl")
}

resource "aws_iam_role" "backup_role" {
  name               = "backup_role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "backup_role_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.backup_role.name
}

resource "aws_iam_policy" "backup_role_policy" {
  policy = data.template_file.backup_policy_template.rendered
}
resource "aws_iam_role_policy_attachment" "backup_role_policy_ec2_rds" {
  policy_arn = aws_iam_policy.backup_role_policy.arn
  role       = aws_iam_role.backup_role.name
}


locals {
  backups = {
    schedule  = "cron(0 18 * * ? *)" /* UTC Time */
    retention = 7 // days
  }
}

resource "aws_backup_vault" "example-backup-vault" {
  name = "example-backup-vault"
  tags = {
    #Project = var.project
    Role    = "backup-vault"
  }
}

resource "aws_backup_plan" "example-backup-plan" {
  name = "example-backup-plan"

  rule {
    rule_name         = "everyday-at-6-${local.backups.retention}-day-retention"
    target_vault_name = aws_backup_vault.example-backup-vault.name
    schedule          = local.backups.schedule
    start_window      = 60
    completion_window = 300

    lifecycle {
      delete_after = local.backups.retention
    }

    recovery_point_tags = {
      #Project = var.project
      Role    = "backup"
      Creator = "aws-backups"
    }
  }

  tags = {
    #Project = var.project
    Role    = "backup"
  }
}

resource "aws_backup_selection" "example-server-backup-selection" {
  iam_role_arn = aws_iam_role.backup_role.arn
  name         = "example-server-resources"
  plan_id      = aws_backup_plan.example-backup-plan.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "true"
  }
}

