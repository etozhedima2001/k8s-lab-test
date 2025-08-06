data "twc_configurator" "configurator" {
    location = "ru-1"
    disk_type = "nvme"
}

data "twc_os" "os" {
    name = "ubuntu"
    version = "22.04"
}