# Examples

So this module is a bit strange. What we are doing here is creating resources using Terraform that are generally a requirement before you can run Terraform at all. Due to this, you cannot use a backend when executing this module. What we recommend to circumvent this issue is to use a non-standard pipeline that can be ran idempotently without the need of a backend. This is done by running an import for the two S3 buckets in this module before executing the module itself.

## example.tf

Basic Terraform example of how to consume this module.

## bitbucket.pipeline.yml

Example pipeline showing how to execute this module in an idempotent manner without a pre-existing backend
