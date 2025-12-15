# Mastodon Terraform - Fastly Service for Mastodon Application File Hosting

Terraform module for creating a service in Fastly for directing traffic towards an external S3-style bucket for hosting mastodon media files (for example, files.mastodon.social).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_fastly"></a> [fastly](#requirement\_fastly) | >= 5.7.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_fastly"></a> [fastly](#provider\_fastly) | >= 5.7.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [fastly_service_vcl.files_service](https://registry.terraform.io/providers/fastly/fastly/latest/docs/resources/service_vcl) | resource |
| [fastly_tls_subscription.tls](https://registry.terraform.io/providers/fastly/fastly/latest/docs/resources/tls_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_hostname"></a> [app\_hostname](#input\_app\_hostname) | Hostname of the mastodon app that this service belongs to. | `string` | n/a | yes |
| <a name="input_backend_address"></a> [backend\_address](#input\_backend\_address) | Address to use for connecting to the backend. Can be a hostname or an IP address. | `string` | n/a | yes |
| <a name="input_backend_name"></a> [backend\_name](#input\_backend\_name) | Optional name for the backend. | `string` | `""` | no |
| <a name="input_backend_ssl_check"></a> [backend\_ssl\_check](#input\_backend\_ssl\_check) | Be strict about checking SSL certs when connecting to the backend. | `bool` | `true` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the exoscale bucket this service will point to. Default is 'app\_hostname' with dashes instead of periods. | `string` | `""` | no |
| <a name="input_datadog"></a> [datadog](#input\_datadog) | Whether to send logging info to Datadog | `bool` | `false` | no |
| <a name="input_datadog_region"></a> [datadog\_region](#input\_datadog\_region) | The region that log data will be sent to. | `string` | `"EU"` | no |
| <a name="input_datadog_service"></a> [datadog\_service](#input\_datadog\_service) | Datadog service name to use for logs | `string` | `"fastly"` | no |
| <a name="input_datadog_token"></a> [datadog\_token](#input\_datadog\_token) | API key from Datadog. | `string` | `""` | no |
| <a name="input_force_tls_hsts"></a> [force\_tls\_hsts](#input\_force\_tls\_hsts) | Force TLS and HTTP Strict Transport Security (HSTS) to ensure that every request is secure. | `bool` | `true` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname the service points to. | `string` | n/a | yes |
| <a name="input_hsts_duration"></a> [hsts\_duration](#input\_hsts\_duration) | Number of seconds for the client to remember only to use HTTPS. | `number` | `31557600` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the fastly service (defaults to hostname). | `string` | `""` | no |
| <a name="input_product_enablement"></a> [product\_enablement](#input\_product\_enablement) | Which additional Fastly products to enable for this service. | <pre>object({<br>    brotli_compression = optional(bool, false)<br>    domain_inspector   = optional(bool, false)<br>    image_optimizer    = optional(bool, false)<br>    origin_inspector   = optional(bool, false)<br>    websockets         = optional(bool, false)<br>  })</pre> | <pre>{<br>  "brotli_compression": false,<br>  "domain_inspector": false,<br>  "image_optimizer": false,<br>  "origin_inspector": false,<br>  "websockets": false<br>}</pre> | no |
| <a name="input_shield_region"></a> [shield\_region](#input\_shield\_region) | Which Fastly shield region to use. Should correspond with the shield code. | `string` | n/a | yes |
| <a name="input_ssl_hostname"></a> [ssl\_hostname](#input\_ssl\_hostname) | Hostname to use for SSL verification (if different from 'hostname'). | `string` | `""` | no |
| <a name="input_tls_authority"></a> [tls\_authority](#input\_tls\_authority) | Which certificate authority to use for the certificates | `string` | `"certainly"` | no |
| <a name="input_tls_domains"></a> [tls\_domains](#input\_tls\_domains) | Custom domains to use for a TLS subscription. Defaults to a combination of 'hostname' and 'domains' | `list(string)` | `[]` | no |
| <a name="input_tls_enable"></a> [tls\_enable](#input\_tls\_enable) | Whether to create a TLS subscription in Fastly for the domain(s) | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_active_version"></a> [active\_version](#output\_active\_version) | The currently active version of the Fastly Service |
| <a name="output_cloned_version"></a> [cloned\_version](#output\_cloned\_version) | The latest cloned version by the provider |
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource |
