variable "vhost_request_rate_enabled" {
  type    = bool
  default = true
}

variable "vhost_request_rate_warning" {
  type    = number
  default = null
}

variable "vhost_request_rate_critical" {
  type = number
}

variable "vhost_request_rate_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "vhost_request_rate_note" {
  type    = string
  default = ""
}

variable "vhost_request_rate_docs" {
  type    = string
  default = ""
}

variable "vhost_request_rate_filter_override" {
  type    = string
  default = ""
}

variable "vhost_request_rate_alerting_enabled" {
  type    = bool
  default = true
}

variable "vhost_request_rate_no_data_timeframe" {
  type    = number
  default = null
}

variable "vhost_request_rate_notify_no_data" {
  type    = bool
  default = false
}

variable "vhost_request_rate_ok_threshold" {
  type    = number
  default = null
}

variable "vhost_request_rate_name_prefix" {
  type    = string
  default = null
}

variable "vhost_request_rate_name_suffix" {
  type    = string
  default = null
}

variable "vhost_request_rate_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

variable "vhost_request_new_group_delay" {
  description = "Time (in seconds) to skip evaluations for new groups."
  type        = number
  default     = 300
}
