#!/usr/bin/env bats

@test "the avahi-daemon service should running" {
  [ "$(ps aux | grep 'avahi-daemon: running' | grep -v grep)" ]
}

@test "the avahi name (ubuntu1204-test-kitchen.local) should respond to ping" {
  run ping -c 1 -q ubuntu1204-test-kitchen.local
  [ "$status" -eq 0 ]
}
