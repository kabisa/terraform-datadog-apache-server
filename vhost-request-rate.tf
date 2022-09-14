locals {
  vhost_request_rate_filter = coalesce(
    var.vhost_request_rate_filter_override,
    var.filter_str
  )
}

module "vhost_request_rate" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "Apache - vhost request rate"
  query = "avg(${var.vhost_request_rate_evaluation_period}):per_minute(avg:apache.net.hits{${local.vhost_request_rate_filter},env:${var.env}} by {service,host}) > ${var.vhost_request_rate_critical}"

  alert_message    = "Apache vhost request rate ({{value}}) for ${var.service} > {{threshold}} "
  recovery_message = "Apache vhost request rate for ${var.service} has recovered"

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
  enabled            = var.vhost_request_rate_enabled
  alerting_enabled   = var.vhost_request_rate_alerting_enabled
  warning_threshold  = var.vhost_request_rate_warning
  critical_threshold = var.vhost_request_rate_critical
  priority           = var.vhost_request_rate_priority
  docs               = var.vhost_request_rate_docs
  note               = var.vhost_request_rate_note
  new_group_delay    = var.vhost_request_new_group_delay
}
