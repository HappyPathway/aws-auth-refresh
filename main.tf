provider "tfe" {
  hostname = "${var.tfe_hostname}"
  token    = "${var.tfe_token}"
}

data "vault_aws_access_credentials" "creds" {
    backend = "aws"
    role    = "${var.vault_aws_role}"
}

resource "tfe_variable" "AWS_ACCESS_KEY_ID" {
  key = "AWS_ACCESS_KEY_ID"
  value = "${data.vault_aws_access_credentials.creds.access_key}"
  category = "env"
  workspace_id = "${var.workspace_id}"
}

resource "tfe_variable" "AWS_SECRET_ACCESS_KEY" {
  key = "AWS_SECRET_ACCESS_KEY"
  value = "${data.vault_aws_access_credentials.creds.secret_key}"
  category = "env"
  workspace_id = "${var.workspace_id}"
  sensitive = true
}

# testng confg in tfe
