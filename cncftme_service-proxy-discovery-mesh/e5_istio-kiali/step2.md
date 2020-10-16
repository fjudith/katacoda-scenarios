# Step 2 - Meet Locust

Locust is an easy to use, scriptable and scalable performance testing tool.
You define the behaviour of your users in regular Python code, instead of using a clunky UI or domain specific language.
This makes Locust infinitely expandable and very developer friendly.

## Generate load

* Select the **Terminal** tab, then run the load generator

```bash
docker container run --rm  -p 8089:8089 --network 'host' --name 'loadgenerator' cncfexercises/bookinfo-load-test  -d 5 -h http://$(hostname) -u 4500 -r 100.0
```{{ execute }}

* Select the **Load generator** tab, then full-fill the form with the following parameters.
  * **Number of total users to simulate**: `5000`{{ copy }}
  * **Spawn rate**: `500`{{ copy }}
  * **Host**: _do not change it_
* Click on the **Start swarming** button
* In the menu bar, select **Charts** to visualise the load progression.

Begining at 2000 user the amount of failures will raise.
This is a normal situation as web servers/api gateways are usually hits their limits around 1500 requests per seconds.

## Observe where the error happens

* Select the **Kiali** tab.

We can see that the `productpage` frontend microservice is the bottleneck.