output "role_name" {
  value       = "${aws_iam_role.default.name}"
  description = "IAM role name"
}

output "role_unique_id" {
  value       = "${aws_iam_role.default.unique_id}"
  description = "IAM role unique ID"
}

output "role_arn" {
  value       = "${aws_iam_role.default.arn}"
  description = "IAM role ARN"
}

output "efs_arn" {
  value       = "${module.efs.arn}"
  description = "EFS ARN"
}

output "efs_id" {
  value       = "${module.efs.id}"
  description = "EFS ID"
}

output "efs_host" {
  value       = "${module.efs.host}"
  description = "EFS host"
}

output "efs_dns_name" {
  value       = "${module.efs.dns_name}"
  description = "EFS DNS name"
}

output "efs_mount_target_dns_names" {
  value       = "${module.efs.mount_target_dns_names}"
  description = "EFS mount target DNS name"
}

output "efs_mount_target_ids" {
  value       = "${module.efs.mount_target_ids}"
  description = "EFS mount target IDs"
}

output "efs_mount_target_ips" {
  value       = "${module.efs.mount_target_ips}"
  description = "EFS mount target IPs"
}

output "efs_network_interface_ids" {
  value       = "${module.efs.network_interface_ids}"
  description = "EFS network interface IDs"
}
