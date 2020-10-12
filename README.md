# Terraform Components: AWS VPC Flow Logs IAM Role

To add VPC Flow Logs to a VPC requires a new IAM Role and Policy. This module provides that role
at a "Global" level, rather than the regional level.

## Role: Create IAM Role and Policy.

This role creates:

1. An IAM Policy permitting the creation of a Log Group, Log Stream, and the ability to create
log events in that stream.
1. An IAM Role to assign to the VPC Flow Log attachment.

## Variables

* Defined in `Role.tf`.
  * `IAM_VPC_Flow_Logs_Prefix`: This is the name associated to all resources created. Default:
  `VPC_Flow_Logs`.
  * `Role_Suffix`: The suffix to add to all IAM Roles created by this module. Default: `role`.
  * `Policy_Suffix`: The suffix to add to all IAM Policies created by this module Default:
  `policy`.

## Outputs

* Defined in `Role.tf`
  * `aws_iam_role_defined`: The IAM Role which permits VPC Flow Log creation.
  * `aws_iam_role_defined_arn`: The ARN of the IAM Role created by this module.
