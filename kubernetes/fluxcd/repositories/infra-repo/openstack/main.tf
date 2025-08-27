terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}

provider "openstack" {
  # ใช้ค่า OS_* จาก Secret ผ่าน env (ไม่ต้องใส่อะไรเพิ่ม)
}

resource "openstack_compute_instance_v2" "vm" {
  name       = "front-test-1"
  image_name = "Ubuntu 22.04"     # ปรับตามชื่อ image ที่ NIPA ให้
  flavor_name = "ani.large.v2"        # ปรับตาม flavor ที่มี
  key_pair    = "Fronttest"      # ต้องมี keypair นี้ในโปรเจกต์
  security_groups = ["default"]

  network { name = "Front-Network" }    # หรือใส่ network_id ตามที่คุณใช้จริง
}

