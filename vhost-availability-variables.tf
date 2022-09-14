variable "vhost_availability_enabled" {
  type    = bool
  default = true
}

variable "vhost_availability_freshness_cycles" {
  type    = number
  default = 3
}

variable "vhost_availability_warning" {
  type    = number
  default = 2
}

variable "vhost_availability_critical" {
  type    = number
  default = 3
}

variable "vhost_availability_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "vhost_availability_note" {
  type    = string
  default = ""
}

variable "vhost_availability_docs" {
  type    = string
  default = "This monitor raises alerts when it cannot successfully connect to an apache vhost."
}

variable "vhost_availability_include_tags" {
  type    = list(string)
  default = []
}

variable "vhost_availability_exclude_tags" {
  type    = list(string)
  default = []
}

variable "vhost_availability_filter_override" {
  type    = string
  default = ""
}

variable "vhost_availability_alerting_enabled" {
  type    = bool
  default = true
}

variable "vhost_availability_no_data_timeframe" {
  type    = number
  default = 0
}

variable "vhost_availability_notify_no_data" {
  type    = bool
  default = false
}

variable "vhost_availability_ok_threshold" {
  type    = number
  default = 1
}

variable "vhost_availability_name_prefix" {
  type    = string
  default = ""
}

variable "vhost_availability_name_suffix" {
  type    = string
  default = ""
}

variable "vhost_availability_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}

variable "vhost_require_full_window" {
  description = ""
  type        = bool
  default     = false
}
