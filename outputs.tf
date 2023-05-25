output "id" {
  description = "The ID of this resource"
  value       = fastly_service_vcl.files_service.id
}

output "active_version" {
  description = "The currently active version of the Fastly Service"
  value       = fastly_service_vcl.files_service.active_version
}

output "cloned_version" {
  description = "The latest cloned version by the provider"
  value       = fastly_service_vcl.files_service.cloned_version
}
