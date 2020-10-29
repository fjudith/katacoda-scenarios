# Step 4 - Submit workflows

## Simple DAG workflow 

* Submit a simple workflow:

```bash
argo submit -n argo https://raw.githubusercontent.com/argoproj/argo/master/examples/nested-workflow.yaml --wait
```{{execute}}

* Check the **Argo** tab to monitor the execution

## Workflow with artifact exchanges

* Submit the workflow to compare Gzip, Zip, and 7zip compression performances.

```bash
argo submit -n argo compression-workflow --wait
```{{execute}}