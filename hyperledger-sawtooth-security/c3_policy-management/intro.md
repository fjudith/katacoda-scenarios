# Policy management

This exercise demonstrates how to leverage the Identity transaction in a permissionned Sawtooth network.

The stack includes the following hosts:

host | services
---- | --------
`chsa-c3-00` | `validator`, **`identity-tp`**, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c3-01` | `validator`, **`identity-tp`**, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c3-02` | `validator`, **`identity-tp`**, `settings-tp`, `intkey-tp-python`, `xo-tp-python` and `rest-api`
`chsa-c3-loadgen` | Intkey load generator

The because Sawtooth network permits any source of transactions out of the box, `chsa-c3-loadgen` is currently able to successfully generate requests to all nodes.

```
Running command: intkey set eGGjC3Uv 8151 --url "http://chsa-c3-00:8008"
{
  "link": "http://chsa-c3-00:8008/batch_statuses?id=da7e54b873ab4d130ae5400477c578c7318a9c519eabaa40d8ca3d18c7df6aa824caae83c0a8db6ed4b51cc3220ded845567cf9bd5c50408ae2e30b661b24b35"
}
...
Running command: intkey set XFSAR25E 17405 --url "http://chsa-c3-01:8008"
{
  "link": "http://chsa-c3-01:8008/batch_statuses?id=a98d6e7efea365a1413e7422b1569d40c96bdfa74c0909ea444af8270c966552745b927785915d0c155952c963db4967320512f864e54bbeae2a51a9c975e693"
}
...
Running command: intkey set Nh2pziEK 19308 --url "http://chsa-c3-02:8008"
{
  "link": "http://chsa-c3-02:8008/batch_statuses?id=a0959f9ff34a2b25a2b6ec2d41adcb2864fff61695cc05e9dbfd762887f30095332efef53dc6c6aee96c980472adf577a22297d9894f11dcaaeff111ddb48608"
}
```

The goal is to install the `identity-tp` transaction processor to restrict the load-generator using the **on-chain** method.
