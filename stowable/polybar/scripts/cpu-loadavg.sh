#!/bin/sh

awk '{print $1}' < /proc/loadavg
