resource "aws_cloudwatch_metric_alarm" "this" {
  for_each = var.cloudwatch_details
  alarm_name                = each.value.alarm_name
  comparison_operator       = each.value.comparison_operator
  evaluation_periods        = each.value.evaluation_periods
  metric_name               = each.value.metric_name
  namespace                 = each.value.namespace
  period                    = each.value.period
  statistic                 = each.value.statistic
  threshold                 = each.value.threshold
  alarm_description         = each.value.alarm_description
  insufficient_data_actions = each.value.insufficient_data_actions
}