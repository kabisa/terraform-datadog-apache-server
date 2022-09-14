
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Apache Server

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator


[Module Variables](#module-variables)

Monitors:

| Monitor name    | Default enabled | Priority | Query                  |
|-----------------|------|----|------------------------|
| [CPU Load](#cpu-load) | True | 3  | `avg(${var.cpu_usage_evaluation_period}):avg:apache.performance.cpu_load{${local.cpu_usage_filter}} by {service,host} > ${var.cpu_usage_critical}` |
| [Traffic](#traffic) | True | 3  | `avg(last_15m):avg:apache.net.bytes_per_s{tag:xxx} by {service,host} > 100000` |
| [Vhost Request Rate](#vhost-request-rate) | True | 3  | `avg(last_30m):per_minute(avg:apache.net.hits{tag:xxx,env:${var.env}} by {service,host}) > ` |
| [Vhost Workers](#vhost-workers) | True | 2  | `max(last_15m):min:apache.performance.idle_workers{tag:xxx} by {service,host} < 1` |

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you clone a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## CPU Load

Query:
```terraform
avg(${var.cpu_usage_evaluation_period}):avg:apache.performance.cpu_load{${local.cpu_usage_filter}} by {service,host} > ${var.cpu_usage_critical}
```

| variable                    | default  | required | description                      |
|-----------------------------|----------|----------|----------------------------------|
| cpu_usage_enabled           | True     | No       |                                  |
| cpu_usage_warning           | 75       | No       |                                  |
| cpu_usage_critical          | 80       | No       |                                  |
| cpu_usage_evaluation_period | last_15m | No       |                                  |
| cpu_usage_note              | ""       | No       |                                  |
| cpu_usage_docs              | ""       | No       |                                  |
| cpu_usage_filter_override   | ""       | No       |                                  |
| cpu_usage_alerting_enabled  | True     | No       |                                  |
| cpu_usage_no_data_timeframe | None     | No       |                                  |
| cpu_usage_notify_no_data    | False    | No       |                                  |
| cpu_usage_ok_threshold      | None     | No       |                                  |
| cpu_usage_name_prefix       | None     | No       |                                  |
| cpu_usage_name_suffix       | None     | No       |                                  |
| cpu_usage_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Traffic

Query:
```terraform
avg(last_15m):avg:apache.net.bytes_per_s{tag:xxx} by {service,host} > 100000
```

| variable                  | default  | required | description                      |
|---------------------------|----------|----------|----------------------------------|
| traffic_enabled           | True     | No       |                                  |
| traffic_warning           | 75000    | No       |                                  |
| traffic_critical          | 100000   | No       |                                  |
| traffic_evaluation_period | last_15m | No       |                                  |
| traffic_note              | ""       | No       |                                  |
| traffic_docs              | ""       | No       |                                  |
| traffic_filter_override   | ""       | No       |                                  |
| traffic_alerting_enabled  | True     | No       |                                  |
| traffic_no_data_timeframe | None     | No       |                                  |
| traffic_notify_no_data    | False    | No       |                                  |
| traffic_ok_threshold      | None     | No       |                                  |
| traffic_name_prefix       | None     | No       |                                  |
| traffic_name_suffix       | None     | No       |                                  |
| traffic_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Vhost Availability

This monitor raises alerts when it cannot successfully connect to an apache vhost.

| variable                             | default                                  | required | description                      |
|--------------------------------------|------------------------------------------|----------|----------------------------------|
| vhost_availability_enabled           | True                                     | No       |                                  |
| vhost_availability_freshness_cycles  | 3                                        | No       |                                  |
| vhost_availability_warning           | 2                                        | No       |                                  |
| vhost_availability_critical          | 3                                        | No       |                                  |
| vhost_availability_evaluation_period | last_5m                                  | No       |                                  |
| vhost_availability_note              | ""                                       | No       |                                  |
| vhost_availability_docs              | This monitor raises alerts when it cannot successfully connect to an apache vhost. | No       |                                  |
| vhost_availability_include_tags      | []                                       | No       |                                  |
| vhost_availability_exclude_tags      | []                                       | No       |                                  |
| vhost_availability_filter_override   | ""                                       | No       |                                  |
| vhost_availability_alerting_enabled  | True                                     | No       |                                  |
| vhost_availability_no_data_timeframe | 0                                        | No       |                                  |
| vhost_availability_notify_no_data    | False                                    | No       |                                  |
| vhost_availability_ok_threshold      | 1                                        | No       |                                  |
| vhost_availability_name_prefix       | ""                                       | No       |                                  |
| vhost_availability_name_suffix       | ""                                       | No       |                                  |
| vhost_availability_priority          | 2                                        | No       | Number from 1 (high) to 5 (low). |
| vhost_require_full_window            | False                                    | No       |                                  |


## Vhost Request Rate

Query:
```terraform
avg(last_30m):per_minute(avg:apache.net.hits{tag:xxx,env:${var.env}} by {service,host}) > 
```

| variable                             | default  | required | description                                           |
|--------------------------------------|----------|----------|-------------------------------------------------------|
| vhost_request_rate_enabled           | True     | No       |                                                       |
| vhost_request_rate_warning           | None     | No       |                                                       |
| vhost_request_rate_critical          |          | Yes      |                                                       |
| vhost_request_rate_evaluation_period | last_30m | No       |                                                       |
| vhost_request_rate_note              | ""       | No       |                                                       |
| vhost_request_rate_docs              | ""       | No       |                                                       |
| vhost_request_rate_filter_override   | ""       | No       |                                                       |
| vhost_request_rate_alerting_enabled  | True     | No       |                                                       |
| vhost_request_rate_no_data_timeframe | None     | No       |                                                       |
| vhost_request_rate_notify_no_data    | False    | No       |                                                       |
| vhost_request_rate_ok_threshold      | None     | No       |                                                       |
| vhost_request_rate_name_prefix       | None     | No       |                                                       |
| vhost_request_rate_name_suffix       | None     | No       |                                                       |
| vhost_request_rate_priority          | 3        | No       | Number from 1 (high) to 5 (low).                      |
| vhost_request_new_group_delay        | 300      | No       | Time (in seconds) to skip evaluations for new groups. |


## Vhost Workers

Query:
```terraform
max(last_15m):min:apache.performance.idle_workers{tag:xxx} by {service,host} < 1
```

| variable                        | default  | required | description                      |
|---------------------------------|----------|----------|----------------------------------|
| vhost_workers_enabled           | True     | No       |                                  |
| vhost_workers_warning           | 5        | No       |                                  |
| vhost_workers_critical          | 1        | No       |                                  |
| vhost_workers_evaluation_period | last_15m | No       |                                  |
| vhost_workers_note              | ""       | No       |                                  |
| vhost_workers_docs              | ""       | No       |                                  |
| vhost_workers_filter_override   | ""       | No       |                                  |
| vhost_workers_alerting_enabled  | True     | No       |                                  |
| vhost_workers_no_data_timeframe | None     | No       |                                  |
| vhost_workers_notify_no_data    | False    | No       |                                  |
| vhost_workers_ok_threshold      | None     | No       |                                  |
| vhost_workers_name_prefix       | None     | No       |                                  |
| vhost_workers_name_suffix       | None     | No       |                                  |
| vhost_workers_priority          | 2        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable             | default  | required | description  |
|----------------------|----------|----------|--------------|
| filter_str           |          | Yes      |              |
| env                  |          | Yes      |              |
| service              |          | Yes      |              |
| service_display_name | None     | No       |              |
| notification_channel |          | Yes      |              |
| additional_tags      | []       | No       |              |
| locked               | False    | No       |              |
| name_prefix          | ""       | No       |              |
| name_suffix          | ""       | No       |              |


