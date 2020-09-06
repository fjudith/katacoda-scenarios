# Check the interconnection

The peering is validated. So what about the interconnection.

* Check the Validator debug logs for `interconnect` events

```bash
docker exec -it -u sysops chsa-a6-00 bash -c 'sudo cat /var/log/sawtooth/validator-debug.log | grep interconnect'
```{{execute}}

> **Notice**: Seems their is an issue with one of the host.

```
[14:49:19.180 [InterconnectThread-1] interconnect INFO] Listening on tcp://127.0.0.1:4004
[14:49:19.314 [InterconnectThread-11] interconnect INFO] Listening on tcp://eth0:8800
[14:49:19.315 [ConnectionManager] interconnect DEBUG] Adding connection to tcp://chsa-a6-01:8800
[14:49:19.321 [ConnectionManager] interconnect DEBUG] Adding connection to tcp://chsa-a6-02:8800
[14:49:19.326 [Thread-15] interconnect DEBUG] Connection to 2099f3b0ec3383a9533e8d51d1c284f7e4be4afcc4804bda355dac6b659dceb04672566c1c3c80a740fa7f059be372a503619585d73b5023f12c5ee77531e5ff was acknowledged
[14:49:19.330 [Thread-15] interconnect DEBUG] Connection to d49318afc3ac5a953de66bfe6c158ceeb378065c976d1afc350aca01c75d15c1d0ffedbb45ab2b14afeef525ce526eb0975aad96ac0ed2fff6697316aecf926a was acknowledged
[14:49:19.408 [Thread-18] interconnect DEBUG] Determining whether inbound connection should be allowed. num connections: 3 max 100
[14:49:19.508 [Thread-21] interconnect DEBUG] Determining whether inbound connection should be allowed. num connections: 4 max 100
[14:49:39.316 [InterconnectThread-11] interconnect DEBUG] No response from 811bf1358bcee8def7af0125e0096fb70d5e0500931acb43801474f967aec95570ae961507550f49d1473fda3e4ec3b72904401b7a519c53c52c0cdf73f8808f in 19.88680648803711 seconds - beginning heartbeat pings.
[14:49:59.317 [InterconnectThread-11] interconnect DEBUG] No response from 811bf1358bcee8def7af0125e0096fb70d5e0500931acb43801474f967aec95570ae961507550f49d1473fda3e4ec3b72904401b7a519c53c52c0cdf73f8808f in 19.998597383499146 seconds - beginning heartbeat pings.
[14:50:19.320 [InterconnectThread-11] interconnect DEBUG] No response from 811bf1358bcee8def7af0125e0096fb70d5e0500931acb43801474f967aec95570ae961507550f49d1473fda3e4ec3b72904401b7a519c53c52c0cdf73f8808f in 19.998292207717896 seconds - beginning heartbeat pings.
```
