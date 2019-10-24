## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| availability_zones | List of availability zones in which to provision the cluster (should be an odd number to avoid split-brain). | list | `<list>` | no |
| cluster_name | Kops cluster name (e.g. `us-east-1.cloudposse.co` or `cluster-1.cloudposse.co`) | string | - | yes |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| enabled | Set to false to prevent the module from creating any resources | string | `true` | no |
| encrypted | If true, the disk will be encrypted | string | `false` | no |
| name | Name (e.g. `efs-provider`) | string | `efs-provider` | no |
| namespace | Namespace (e.g. `eg` or `cp`) | string | - | yes |
| performance_mode | The file system performance mode. Can be either `generalPurpose` or `maxIO` | string | `generalPurpose` | no |
| policy_arn | IAM policy to grant for the efs-provider | string | `arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess` | no |
| provisioned_throughput_in_mibps | The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput_mode set to provisioned | string | `0` | no |
| region | AWS region | string | `us-west-2` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`Cluster`,`us-east-1.cloudposse.co`) | map | `<map>` | no |
| throughput_mode | Throughput mode for the file system. Defaults to bursting. Valid values: bursting, provisioned. When using provisioned, also set provisioned_throughput_in_mibps | string | `bursting` | no |
| vpc_id | The kops VPC ID | string | `` | no |
| zone_id | Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the DB master and replicas | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| efs_arn | EFS ARN |
| efs_dns_name | EFS DNS name |
| efs_host | EFS host |
| efs_id | EFS ID |
| efs_mount_target_dns_names | EFS mount target DNS name |
| efs_mount_target_ids | EFS mount target IDs |
| efs_mount_target_ips | EFS mount target IPs |
| efs_network_interface_ids | EFS network interface IDs |
| role_arn | IAM role ARN |
| role_name | IAM role name |
| role_unique_id | IAM role unique ID |

