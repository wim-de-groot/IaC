variable "cloudinit_template" {
  type        = string
  sensitive   = false
  nullable    = false
  description = "The cloudinit template that will be used to instantiate the virtual machines."
}

variable "pm_api_url" {
  type        = string
  sensitive   = true
  nullable    = false
  description = "The api of the proxmox server which terraform will be talking to."
}

variable "pm_api_token_id" {
  type        = string
  sensitive   = true
  nullable    = false
  description = "The id of the token with which terraform will be authenticating."
}

variable "pm_api_token_secret" {
  type        = string
  sensitive   = true
  nullable    = false
  description = "The actual token with which terraform will authenticate to proxmox."
}

variable "target_node" {
  type        = string
  sensitive   = false
  nullable    = false
  description = "The proxmox node to deploy the virtual machines to."
}

variable "ssh_key" {
  type         = string
  sensitive = true
  nullable     = false
  description  = "The ssh key that is used to connect to the virtual machine."
}
