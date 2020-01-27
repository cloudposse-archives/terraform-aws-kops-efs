variable "enabled" {
  type        = "string"
  description = "Set to false to prevent the module from creating any resources"
  default     = "true"
}

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

variable "region" {
  type        = "string"
  default     = "us-west-2"
  description = "AWS region"
}

variable "availability_zones" {
  type        = "list"
  description = "List of availability zones in which to provision the cluster (should be an odd number to avoid split-brain)."
  default     = []
}

variable "zone_id" {
  type        = "string"
  default     = ""
  description = "Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the DB master and replicas"
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

variable "vpc_id" {
  default     = ""
  description = "The kops VPC ID"
}

variable "policy_arn" {
  type        = "string"
  default     = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
  description = "IAM policy to grant for the efs-provider"
}

variable "encrypted" {
  type        = "string"
  description = "If true, the disk will be encrypted"
  default     = "false"
}

variable "performance_mode" {
  type        = "string"
  description = "The file system performance mode. Can be either `generalPurpose` or `maxIO`"
  default     = "generalPurpose"
}

variable "provisioned_throughput_in_mibps" {
  default     = 0
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput_mode set to provisioned"
}

variable "throughput_mode" {
  type        = "string"
  description = "Throughput mode for the file system. Defaults to bursting. Valid values: bursting, provisioned. When using provisioned, also set provisioned_throughput_in_mibps"
  default     = "bursting"
}

variable "iam_role_max_session_duration" {
  default     = 3600
  description = "The maximum session duration (in seconds) for the role. Can have a value from 1 hour to 12 hours"
}
