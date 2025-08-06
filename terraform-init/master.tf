resource "twc_server" "master" {
    name = "master-node"
    os_id = data.twc_os.os.id

    configuration {
        configurator_id = data.twc_configurator.configurator.id
        disk = 1024 * 15
        cpu = 2
        ram = 2048
    }

    ssh_key_ids = [twc_ssh_key.master_ssh_key.id]
}

resource "twc_server_ip" "master_ip" {
  source_server_id = twc_server.master.id

  type = "ipv4"
}

resource "twc_ssh_key" "master_ssh_key" {
    name = "master-key"
    body = file("~/.ssh/id_ed25519.pub")
}