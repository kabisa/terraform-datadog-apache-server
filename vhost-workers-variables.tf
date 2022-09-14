variable "vhost_workers_enabled" {
  type    = bool
  default = true
}

variable "vhost_workers_warning" {
  type    = number
  default = 5
}

variable "vhost_workers_critical" {
  type    = number
  default = 1
}

variable "vhost_workers_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "vhost_workers_note" {
  type    = string
  default = ""
}

variable "vhost_workers_docs" {
  type    = string
  default = ""
}

variable "vhost_workers_filter_override" {
  type    = string
  default = ""
}

variable "vhost_workers_alerting_enabled" {
  type    = bool
  default = true
}

variable "vhost_workers_no_data_timeframe" {
  type    = number
  default = null
}

variable "vhost_workers_notify_no_data" {
  type    = bool
  default = false
}

variable "vhost_workers_ok_threshold" {
  type    = number
  default = null
}

variable "vhost_workers_name_prefix" {
  type    = string
  default = null
}

variable "vhost_workers_name_suffix" {
  type    = string
  default = null
}

variable "vhost_workers_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}
