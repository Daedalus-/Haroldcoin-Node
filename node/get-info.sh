#!/bin/bash
/usr/local/bin/haroldcoin-cli -conf=client.conf getinfo
tail -20 ~/.haroldcoin/debug.log
