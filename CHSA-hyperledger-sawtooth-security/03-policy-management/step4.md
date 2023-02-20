# Step 4 - Validate from load generator logs

The Load Generator tab should now display submissions errors to all of the three nodes.

```bash
Running command: intkey set KPlSJfRY 6841 --url "http://chsa-c2-02:8008"
{
  "link": "http://chsa-c2-02:8008/batch_statuses?id=851541df760f87707227e04f0e6c75dd7e073028802511ec92d0b88a5133b4073150d3f7639cdc1ae2dc797b2e8ada7eb0bed0ceda78e8ff821fb8f52c094e88"
}
Running command: intkey set qPnyNFiy 19019 --url "http://chsa-c2-01:8008"
{
  "link": "http://chsa-c2-01:8008/batch_statuses?id=22be211e5f1647e1496e1901787cb71cf4e38054b19bd1eb6242849776ae42c473bf9147641b9aca0aa1b39c6c0dc8ccf77d89a9f87fe2caad40a173b2e4ee60"
}
Running command: intkey set NBVbt0Z0 14098 --url "http://chsa-c2-00:8008"
{
  "link": "http://chsa-c2-00:8008/batch_statuses?id=a696336d7caaac0407f4b376cc244978c5a964f20e00fef62e72486d16522b8d6b0931af8c881055f5a9d11a7f916ae138404a654a38d7f382505b8172842e7e"
}
```