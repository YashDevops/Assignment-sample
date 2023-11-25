variable "cloudwatch_details" {
  type = map(object({
   alarm_name = string
   comparison_operator = string
   evaluation_periods = string
   metric_name = string
   namespace = string
   period = string
   statistic = string
   threshold = string
   alarm_description = string
   insufficient_data_actions = list(string)
   }))
}