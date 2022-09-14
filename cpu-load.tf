locals {
  cpu_usage_filter = coalesce(
    var.cpu_usage_filter_override,
    var.filter_str
  )
}

module "cpu_usage" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "Apache - CPU Load"
  query            = "avg(${var.cpu_usage_evaluation_period}):avg:apache.performance.cpu_load{${local.cpu_usage_filter}} by {service,host} > ${var.cpu_usage_critical}"
  alert_message    = "Apache CPU Load ({{value}}) for ${var.service} > {{threshold}} "
  recovery_message = "Apache CPU Load for ${var.service} has recovered"

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
  enabled            = var.cpu_usage_enabled
  alerting_enabled   = var.cpu_usage_alerting_enabled
  warning_threshold  = var.cpu_usage_warning
  critical_threshold = var.cpu_usage_critical
  priority           = var.cpu_usage_priority
  docs               = var.cpu_usage_docs
  note               = var.cpu_usage_note
}
