resource "shoreline_notebook" "input_output_error_and_file_corruption_on_linux_systems" {
  name       = "input_output_error_and_file_corruption_on_linux_systems"
  data       = file("${path.module}/data/input_output_error_and_file_corruption_on_linux_systems.json")
  depends_on = [shoreline_action.invoke_log_file_error_check]
}

resource "shoreline_file" "log_file_error_check" {
  name             = "log_file_error_check"
  input_file       = "${path.module}/data/log_file_error_check.sh"
  md5              = filemd5("${path.module}/data/log_file_error_check.sh")
  description      = "Check system logs and identify the root cause of the input/output error and file corruption."
  destination_path = "/tmp/log_file_error_check.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_log_file_error_check" {
  name        = "invoke_log_file_error_check"
  description = "Check system logs and identify the root cause of the input/output error and file corruption."
  command     = "`chmod +x /tmp/log_file_error_check.sh && /tmp/log_file_error_check.sh`"
  params      = ["PATH_TO_LOG_FILE"]
  file_deps   = ["log_file_error_check"]
  enabled     = true
  depends_on  = [shoreline_file.log_file_error_check]
}

