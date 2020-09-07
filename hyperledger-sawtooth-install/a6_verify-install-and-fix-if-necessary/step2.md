# Check the interconnection

The peering is validated. So what about the interconnection.

* Check the Validator debug logs for `interconnect` events

```bash
docker exec -it -u sysops chsa-a6-00 bash -c 'sudo cat /var/log/sawtooth/validator-debug.log | grep interconnect'
```{{execute}}

> **Notice**: Seems their is an issue with one of the host.

```
docker exec -it -u sysops chsa-a6-00 bash -c 'sudo cat /var/log/sawtooth/validator-debug.log | grep interconnect'
[10:23:01.880 [InterconnectThread-1] interconnect INFO] Listening on tcp://127.0.0.1:4004
[10:23:01.973 [InterconnectThread-11] interconnect INFO] Listening on tcp://eth0:8800
[10:23:02.031 [Thread-13] interconnect DEBUG] Determining whether inbound connection should be allowed. num connections: 1 max 100
[10:23:02.084 [Thread-14] interconnect DEBUG] Determining whether inbound connection should be allowed. num connections: 2 max 100
[10:23:21.974 [InterconnectThread-11] interconnect DEBUG] No response from 050997cb7643c4b1c618975a392987c5db0d6a514a990fec32b304c02d0894e41c5f613faceedb949894d720a6ac62e2f26f50f859e98b4d179c2708d2444d4a in 19.52543067932129 seconds - beginning heartbeat pings.
[10:23:41.976 [InterconnectThread-11] interconnect DEBUG] No response from 050997cb7643c4b1c618975a392987c5db0d6a514a990fec32b304c02d0894e41c5f613faceedb949894d720a6ac62e2f26f50f859e98b4d179c2708d2444d4a in 19.998936891555786 seconds - beginning heartbeatpings.
```
