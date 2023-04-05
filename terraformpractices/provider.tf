terraform {
  required_version = ">=1.4.0"
  required_providers {
    shell = {
      source  = "scottwinkler/shell"
      version = "1.7.10"
    }
  }
}

provider "shell" {

}

data "shell_script" "ravikiran" {
  lifecycle_commands {
    read = <<-EOF
          echo "Hello ravikiran"
        EOF
  }
}

output "ravikiran" {
  value = data.shell_script.ravikiran.output
}