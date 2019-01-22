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
