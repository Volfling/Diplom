terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = file("C:/Users/Volfling/key.json")
  cloud_id                 = "b1g8lprqm6oj5v0bqmi8"
  folder_id                = "b1go6quhdh703as66uqt"
  zone                     = "ru-central1-a"
}

resource "vpc_network" "network" {
  name = "network"
}

resource "vpc_subnet" "subnet" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = vpc_network.network.id
  v4_cidr_blocks = ["192.168.12.0/24"]
}

module "master" {
  source                = "C:/Users/Volfling/SkillFactory/Diplom/terraform/module"
  instance_family_image = "ubuntu"
  vpc_subnet_id         = vpc_subnet.subnet.id
}

module "app" {
  source                = "C:/Users/Volfling/SkillFactory/Diplom/terraform/module"
  instance_family_image = "ubuntu"
  vpc_subnet_id         = vpc_subnet.subnet.id
}

module "srv" {
  source                = "C:/Users/Volfling/SkillFactory/Diplom/terraform/module"
  instance_family_image = "ubuntu"
  vpc_subnet_id         = vpc_subnet.subnet.id
}