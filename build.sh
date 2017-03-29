#!/usr/bin/env bash

vagrant destroy -f
rm -rf .vagrant

time vagrant up --provider virtualbox 2>&1 | tee virtualbox-build-output.log
vagrant halt
vagrant package --base `ls ~/VirtualBox\ VMs | grep vbox-builder` --output virtualbox.box

du virtualbox.box -sh
vagrant destroy -f
rm -rf .vagrant