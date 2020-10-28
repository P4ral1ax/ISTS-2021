#!/bin/sh
# FreeBSD - USE PF

start() {

   
    sleep 3
    iptables -F
}
start