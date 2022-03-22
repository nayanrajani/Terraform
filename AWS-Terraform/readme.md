# Deploying Infrastructure with Terraform

- https://registry.terraform.io/providers/hashicorp/aws/latest/docs

- Basically to create any resource we need to create authentication method:
    - static auth
        - Access key and secret key
        - go to IAM, then users -> select yours
        - security credentials -> or use last credentials
        - save it

- Now you have to be careful about the providers and the resources we are using, it may change for others.

- Now crete a .tf file in folder and start writing down the code.

- After all the configuration, run terraform init to initialise the terraform inside this folder.

- now run terraform plan, to see the changes going to be take place in actual env.

- check if everything is good, then terraform apply
- okay