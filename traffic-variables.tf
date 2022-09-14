variable "traffic_enabled" {
  type    = bool
  default = true
}

variable "traffic_warning" {
  type    = number
  default = 75000
}

variable "traffic_critical" {
  type    = number
  default = 100000
}

variable "traffic_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "traffic_note" {
  type    = string
  default = ""
}

variable "traffic_docs" {
  type    = string
  default = ""
}

variable "traffic_filter_override" {
  type    = string
  default = ""
}

variable "traffic_alerting_enabled" {
  type    = bool
  default = true
}

variable "traffic_no_data_timeframe" {
  type    = number
  default = null
}

variable "traffic_notify_no_data" {
  type    = bool
  default = false
}

variable "traffic_ok_threshold" {
  type    = number
  default = null
}

variable "traffic_name_prefix" {
  type    = string
  default = null
}

variable "traffic_name_suffix" {
  type    = string
  default = null
}

variable "traffic_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
