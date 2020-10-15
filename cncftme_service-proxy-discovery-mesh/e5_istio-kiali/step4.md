# Step 4 - Observe & Scale

The known max amount of simultanous user is 2000.
Therefore increasing the number of replica of the `productpage` deployment should resolve the issue.

* **Open a new terminal** tab, then run the following command.

```bash
kubectl scale deployment productpage-v1 --replicas 3
```{{ execute }}

## Check Kiali

* Select the **Kiali** tab.

The failure should now affect the `reviews` microservice.
**But wait** some times for the traffic to stabilize.