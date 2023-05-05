# Mastodon Terraform - Fastly Service for Mastodon Application File Hosting

Terraform module for creating a service in Fastly for directing traffic towards an external S3-style bucket for hosting mastodon media files (for example, files.mastodon.social).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_fastly"></a> [fastly](#requirement\_fastly) | >= 4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_fastly"></a> [fastly](#provider\_fastly) | >= 4.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [fastly_service_vcl.files_service](https://registry.terraform.io/providers/fastly/fastly/latest/docs/resources/service_vcl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_hostname"></a> [app\_hostname](#input\_app\_hostname) | Hostname of the mastodon app that this service belongs to. | `string` | n/a | yes |
| <a name="input_backend_address"></a> [backend\_address](#input\_backend\_address) | Address to use for connecting to the backend. Can be a hostname or an IP address. | `string` | n/a | yes |
| <a name="input_backend_name"></a> [backend\_name](#input\_backend\_name) | Optional name for the backend. | `string` | `""` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname the service points to. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the fastly service (defaults to hostname). | `string` | `""` | no |
| <a name="input_shield_region"></a> [shield\_region](#input\_shield\_region) | Which Fastly shield region to use. Should correspond with the shield code. | `string` | n/a | yes |
| <a name="input_ssl_hostname"></a> [ssl\_hostname](#input\_ssl\_hostname) | Hostname to use for SSL verification (if different from 'hostname'). | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_active_version"></a> [active\_version](#output\_active\_version) | The currently active version of the Fastly Service |
| <a name="output_cloned_version"></a> [cloned\_version](#output\_cloned\_version) | The latest cloned version by the provider |
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource |
