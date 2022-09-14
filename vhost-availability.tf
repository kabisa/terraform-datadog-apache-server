module "vhost_availability" {
  source  = "kabisa/service-check-monitor/datadog"
  version = "2.0.0"

  name        = "Apache - vhost availability"
  metric_name = "apache.can_connect"
  by_tags     = ["host", "service"]

  include_tags = var.vhost_availability_include_tags
  exclude_tags = var.vhost_availability_exclude_tags

  alert_message    = "Apache vhost not running is not running on ${var.service} Node {{host.name}} please check."
  recovery_message = "Apache vhost is back on ${var.service} Node {{host.name}}"

  require_full_window = var.vhost_require_full_window
  no_data_timeframe   = var.vhost_availability_no_data_timeframe
  notify_no_data      = var.vhost_availability_notify_no_data

  # monitor level vars
  enabled            = var.vhost_availability_enabled
  alerting_enabled   = var.vhost_availability_alerting_enabled
  critical_threshold = var.vhost_availability_critical
  warning_threshold  = var.vhost_availability_warning
  ok_threshold       = var.vhost_availability_ok_threshold
  priority           = var.vhost_availability_priority
  docs               = var.vhost_availability_docs
  note               = var.vhost_availability_note

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
