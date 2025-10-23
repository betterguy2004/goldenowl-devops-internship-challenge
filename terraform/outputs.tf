output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.main.dns_name
}

output "alb_url" {
  description = "URL to access the application"
  value       = "http://${aws_lb.main.dns_name}"
}

output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.app.name
}

output "cloudwatch_alarm_high_cpu" {
  description = "CloudWatch Alarm for high CPU"
  value       = aws_cloudwatch_metric_alarm.cpu_high.alarm_name
}

output "cloudwatch_alarm_low_cpu" {
  description = "CloudWatch Alarm for low CPU"
  value       = aws_cloudwatch_metric_alarm.cpu_low.alarm_name
}
