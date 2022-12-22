# locals {
#   users = {
#     "john" = {
#       name  = "John"
#       email = "john.doe@example.com"
#     }
#   }
# }

# resource "aws_iam_user" "user" {
#   for_each = local.users

#   name          = each.key
#   force_destroy = false
# }



# resource "pgp_key" "user_login_key" {
#   for_each = local.users

#   name    = each.value.name
#   email   = each.value.email
#   comment = "PGP Key for ${each.value.name}"
# }

# resource "aws_iam_user_login_profile" "user_login" {
#   for_each = local.users

#   user                    = each.key
#   pgp_key                 = pgp_key.user_login_key[each.key].public_key_base64
#   password_reset_required = true

#   depends_on = [aws_iam_user.user, pgp_key.user_login_key]
# }

# data "pgp_decrypt" "user_password_decrypt" {
#   for_each = local.users

#   ciphertext          = aws_iam_user_login_profile.user_login[each.key].encrypted_password
#   ciphertext_encoding = "base64"
#   private_key         = pgp_key.user_login_key[each.key].private_key
# }

# resource "aws_secretsmanager_secret" "m_elect_dev_secret_key" {
#   name        = "m_elect_dev_secret_key_4"
#   description = "My m_elect_dev  glass break user credentials"
# }

# resource "aws_secretsmanager_secret_version" "sandbox_mpass_version" {
#   for_each      = local.users
#   secret_id     = aws_secretsmanager_secret.m_elect_dev_secret_key.id
#   secret_string = jsonencode({ "name" = each.value.name, "password" = pgp_key.user_login_key.comment })
# }

# resource "aws_iam_user_policy_attachment" "test-attach" {
#   for_each   = local.users
#   user       = each.value.name
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
#   depends_on = [
#     aws_iam_user.user
#   ]
# }

# output "credentials" {
#   value = {
#     for k, v in local.users : k => {
#       "password" = data.pgp_decrypt.user_password_decrypt[k].private_key
#       "password1" = aws_iam_user_login_profile.user_login[k]
#     }
#   }
#   sensitive = true
# }
