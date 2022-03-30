resource "proxmox_vm_qemu" "controlplane" {
  count       = 2
  name        = "controlplane-${count.index}"
  target_node = var.target_node
  clone       = var.cloudinit_template
  agent       = 1
  os_type     = "cloud-init"
  cores       = 2
  sockets     = 1
  cpu         = "host"
  memory      = 4096
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot     = 0
    size     = "10G"
    type     = "scsi"
    storage  = "local"
    iothread = 1
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=192.168.178.1${count.index + 1}/24,gw=192.168.178.1"
  ipconfig1 = "ip=10.0.0.1${count.index + 1}/24"
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF
}
