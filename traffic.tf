locals {
  traffic_filter = coalesce(
    var.traffic_filter_override,
    var.filter_str
  )
}

module "traffic" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "Apache - traffic"
  query = "avg(${var.traffic_evaluation_period}):avg:apache.net.bytes_per_s{${local.traffic_filter}} by {service,host} > ${var.traffic_critical}"

  alert_message    = "Apache traffic ({{value}}) for ${var.service} > {{threshold}} "
  recovery_message = "Apache traffic for ${var.service} has recovered"

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
  enabled            = var.traffic_enabled
  alerting_enabled   = var.traffic_alerting_enabled
  warning_threshold  = var.traffic_warning
  critical_threshold = var.traffic_critical
  priority           = var.traffic_priority
  docs               = var.traffic_docs
  note               = var.traffic_note
}
