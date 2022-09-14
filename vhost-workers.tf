locals {
  vhost_workers_filter = coalesce(
    var.vhost_workers_filter_override,
    var.filter_str
  )
}

module "vhost_workers" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "Apache - workers"
  query            = "max(${var.vhost_workers_evaluation_period}):min:apache.performance.idle_workers{${local.vhost_workers_filter}} by {service,host} < ${var.vhost_workers_critical}"
  alert_message    = "Available Apache workers ({{value}}) for ${var.service} is low < {{threshold}} "
  recovery_message = "Apache workers for ${var.service} has recovered"

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix

  # monitor level vars
  enabled            = var.vhost_workers_enabled
  alerting_enabled   = var.vhost_workers_alerting_enabled
  warning_threshold  = var.vhost_workers_warning
  critical_threshold = var.vhost_workers_critical
  priority           = var.vhost_workers_priority
  docs               = var.vhost_workers_docs
  note               = var.vhost_workers_note
}
