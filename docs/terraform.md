
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| availability_zones | List of availability zones in which to provision the cluster (should be an odd number to avoid split-brain). | list | `<list>` | no |
| cluster_name | Kops cluster name (e.g. `us-east-1.cloudposse.co` or `cluster-1.cloudposse.co`) | string | - | yes |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| masters_name | Kops masters subdomain name in the cluster DNS zone | string | `masters` | no |
| name | Name (e.g. `efs-provider`) | string | `efs-provider` | no |
| namespace | Namespace (e.g. `eg` or `cp`) | string | - | yes |
| nodes_name | Kops nodes subdomain name in the cluster DNS zone | string | `nodes` | no |
| policy_arn | IAM policy to grant for the efs-provider | string | `arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess` | no |
| region | AWS region | string | `us-west-2` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`Cluster`,`us-east-1.cloudposse.co`) | map | `<map>` | no |
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

