variable "name" {
  description = "Name of the fastly service (defaults to hostname)."
  type        = string
  default     = ""
}

variable "hostname" {
  description = "Hostname the service points to."
  type        = string
}

variable "app_hostname" {
  description = "Hostname of the mastodon app that this service belongs to."
  type        = string
}

variable "ssl_hostname" {
  description = "Hostname to use for SSL verification (if different from 'hostname')."
  type        = string
  default     = ""
}

variable "backend_name" {
  description = "Optional name for the backend."
  type        = string
  default     = ""
}

variable "backend_address" {
  description = "Address to use for connecting to the backend. Can be a hostname or an IP address."
  type        = string
}

variable "backend_ssl_check" {
  description = "Be strict about checking SSL certs when connecting to the backend."
  type        = bool
  default     = true
}

variable "shield_region" {
  description = "Which Fastly shield region to use. Should correspond with the shield code."
  type        = string
}

variable "force_tls_hsts" {
  description = "Force TLS and HTTP Strict Transport Security (HSTS) to ensure that every request is secure."
  type        = bool
  default     = true
}

variable "hsts_duration" {
  description = "Number of seconds for the client to remember only to use HTTPS."
  type        = number
  default     = 31557600
}

variable "product_enablement" {
  description = "Which additional Fastly products to enable for this service."
  type = object({
    brotli_compression = optional(bool, false)
    domain_inspector   = optional(bool, false)
    image_optimizer    = optional(bool, false)
    origin_inspector   = optional(bool, false)
    websockets         = optional(bool, false)
  })
  default = {
    brotli_compression = false
    domain_inspector   = false
    image_optimizer    = false
    origin_inspector   = false
    websockets         = false
  }
}

variable "datadog" {
  description = "Whether to send logging info to Datadog"
  type        = bool
  default     = false
}

variable "datadog_token" {
  description = "API key from Datadog."
  type        = string
  default     = ""
  sensitive   = true
}

variable "datadog_service" {
  description = "Datadog service name to use for logs"
  type        = string
  default     = "fastly"
}

variable "datadog_region" {
  description = "The region that log data will be sent to."
  type        = string
  default     = "EU"

  validation {
    condition     = contains(["US", "EU"], var.datadog_region)
    error_message = "Datadog region must be either US or EU."
  }
}

# TLS

variable "tls_enable" {
  description = "Whether to create a TLS subscription in Fastly for the domain(s)"
  type        = bool
  default     = false
}

variable "tls_domains" {
  description = "Custom domains to use for a TLS subscription. Defaults to a combination of 'hostname' and 'domains'"
  type        = list(string)
  default     = []
}

variable "tls_authority" {
  description = "Which certificate authority to use for the certificates"
  type        = string
  default     = "certainly"

  validation {
    condition     = contains(["lets-encrypt", "globalsign", "certainly"], var.tls_authority)
    error_message = "Must be one of: lets-encrypt, globalsign or certainly"
  }
}
