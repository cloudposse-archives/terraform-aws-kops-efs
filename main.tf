module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  enabled    = "${var.enabled}"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"
  tags       = "${var.tags}"
}

module "kops_metadata" {
  source       = "git::https://github.com/cloudposse/terraform-aws-kops-data-network.git?ref=tags/0.1.1"
  enabled      = "${var.enabled}"
  cluster_name = "${var.cluster_name}"
  vpc_id       = "${var.vpc_id}"
}

module "kops_iam_metadata" {
  source       = "git::https://github.com/cloudposse/terraform-aws-kops-data-iam.git?ref=tags/0.1.0"
  enabled      = "${var.enabled}"
  cluster_name = "${var.cluster_name}"
}

resource "aws_iam_role" "default" {
  count       = "${var.enabled == "true" ? 1 : 0}"
  name        = "${module.label.id}"
  description = "Role that can be assumed by efs-provider"

  max_session_duration = "${var.iam_role_max_session_duration}"

  lifecycle {
    create_before_destroy = true
  }

  assume_role_policy = "${data.aws_iam_policy_document.assume_role.json}"
}

module "efs" {
  source             = "git::https://github.com/cloudposse/terraform-aws-efs.git?ref=tags/0.9.0"
  enabled            = "${var.enabled}"
  namespace          = "${var.namespace}"
  stage              = "${var.stage}"
  name               = "${var.name}"
  aws_region         = "${var.region}"
  vpc_id             = "${module.kops_metadata.vpc_id}"
  subnets            = ["${module.kops_metadata.private_subnet_ids}"]
  availability_zones = ["${var.availability_zones}"]
  security_groups    = ["${module.kops_metadata.nodes_security_group_id}"]
  zone_id            = "${var.zone_id}"
  encrypted          = "${var.encrypted}"
  performance_mode   = "${var.performance_mode}"

  throughput_mode                 = "${var.throughput_mode}"
  provisioned_throughput_in_mibps = "${var.provisioned_throughput_in_mibps}"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    principals {
      type = "AWS"

      identifiers = [
        "${module.kops_iam_metadata.masters_role_arn}",
        "${module.kops_iam_metadata.nodes_role_arn}",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role_policy_attachment" "default" {
  count      = "${var.enabled == "true" ? 1 : 0}"
  role       = "${aws_iam_role.default.name}"
  policy_arn = "${var.policy_arn}"

  lifecycle {
    create_before_destroy = true
  }
}
