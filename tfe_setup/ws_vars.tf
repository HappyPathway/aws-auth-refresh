variable "workspace_id" {
    type="string"
}
resource "tfe_variable" "workspace_id" {
    key = "workspace_id"
    value = "${var.workspace_id}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "tfe_token" {
    type="string"
}


resource "tfe_variable" "tfe_token" {
    key	= "tfe_token"
    value	= "${var.tfe_token}"
    category	= "terraform"
    workspace_id	= "${module.workspace.workspace_id}"
    sensitive	= true
}