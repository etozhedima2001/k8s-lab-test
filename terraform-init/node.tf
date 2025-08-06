resource "twc_server" "node" {
    name = "node1"
    os_id = data.twc_os.os.id

    configuration {
        configurator_id = data.twc_configurator.configurator.id
        disk = 1024 * 15
        cpu = 2
        ram = 2048
    }

    ssh_key_ids = [twc_ssh_key.node_ssh_key.id]
}

resource "twc_server_ip" "node1_ip" {
  source_server_id = twc_server.node.id

  type = "ipv4"
}

resource "twc_ssh_key" "node_ssh_key" {
    name = "node-key"
    body = file("~/.ssh/id_ed25519.pub")
}
