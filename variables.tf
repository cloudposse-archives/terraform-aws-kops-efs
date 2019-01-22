variable "namespace" {
  type        = "string"
  description = "Namespace (e.g. `eg` or `cp`)"
}

variable "stage" {
  type        = "string"
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = "string"
  default     = "efs-provider"
  description = "Name (e.g. `efs-provider`)"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map(`Cluster`,`us-east-1.cloudposse.co`)"
}

variable "cluster_name" {
  type        = "string"
  description = "Kops cluster name (e.g. `us-east-1.cloudposse.co` or `cluster-1.cloudposse.co`)"
}

variable "masters_name" {
  type        = "string"
  default     = "masters"
  description = "Kops masters subdomain name in the cluster DNS zone"
}

variable "nodes_name" {
  type        = "string"
  default     = "nodes"
  description = "Kops nodes subdomain name in the cluster DNS zone"
}

variable "policy_arn" {
  type        = "string"
  default     = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
  description = "IAM policy to grant for the efs-provider"
}
