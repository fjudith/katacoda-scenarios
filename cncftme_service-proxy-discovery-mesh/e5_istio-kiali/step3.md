# Step 3 - Manage Locust load

## Reduce the load

* Select the **Load generator** tab.
* In the top bar, click on **Edit** and full-fill the form with the following parameters.
  * **Number of total users to simulate**: `1500`{{ copy }}
  * **Spawn rate**: `100`{{ copy }}
* Click on the **Start swarming** button
* In the menu bar, select **Charts** to visualise the load progression.

The amount of failure effectively falls arount 2000 rps.

## Restore the peak load

* In the top bar, click on **Edit** and full-fill the form with the following parameters.
  * **Number of total users to simulate**: `4500`{{ copy }}
  * **Spawn rate**: `100`{{ copy }}
* Click on the **Start swarming** button
* In the menu bar, select **Charts** to visualise the load progression.

The amout of failures raise again.