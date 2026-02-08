# Kubernetes – Quick Command Reference

This document summarizes the **most commonly used Kubernetes commands** from the *Kubernetes Microservices* course. Commands are grouped by topic and annotated with the relevant course sections.

---

## 1. Minikube

Minikube runs a local, single-node Kubernetes cluster. These commands help you manage that local environment.

* `minikube start`
  Starts Minikube.
  ⚠️ If this hangs for a long time (e.g. 15 minutes), refer to **Section 3**, which covers common startup issues.

* `minikube stop`
  *(Section 3)* Stops the Minikube virtual machine.
  Useful if you encounter errors when starting Minikube.

* `minikube delete`
  *(Section 3)* Completely removes the Minikube VM and its data.
  Useful when Minikube refuses to start and all other fixes fail.
  You can also manually delete:

  * `<home>/.minikube`
  * `<home>/.kube`

* `minikube env`
  *(Section 4)* Prints the environment variables needed to connect your shell to the Docker daemon running inside Minikube.

* `minikube ip`
  *(Section 4 or 5)* Displays the Minikube IP address.
  Required for browser-based access to services.

* `minikube service <k8s-service-name>`
  For Mac users.
---

## 2. Kubectl – Core Commands

`kubectl` is the primary CLI tool for interacting with a Kubernetes cluster.

* `kubectl get all`
  *(Section 5)* Lists all Kubernetes objects you have created.
  Initially this includes **Pods**, and later **ReplicaSets**, **Deployments**, and **Services**.

* `kubectl apply -f <yaml-file>`
  *(Section 5)* Creates or updates resources defined in the specified YAML file.

* `kubectl apply -f .`
  *(Section 7)* Applies **all YAML files** in the current directory.

---

## 3. Inspecting and Executing in Pods

* `kubectl describe pod <pod-name>`
  *(Section 5)* Displays detailed information about the specified pod, including events and container status.

* `kubectl exec -it <pod-name> <command>`
  *(Section 5)* Executes a command inside the pod’s container.
  ⚠️ Does not work reliably in **Cygwin**.

---

## 4. Listing and Filtering Resources

* `kubectl get (pod | po | service | svc | rs | replicaset | deployment | deploy)`
  *(Section 6)* Lists the specified type of Kubernetes resources.
  As the course progresses, this includes Pods, Services, ReplicaSets, and Deployments.

* `kubectl get po --show-labels`
  *(Section 6)* Lists all pods along with their associated labels.

* `kubectl get po --show-labels -l <name>=<value>`
  *(Section 6)* Lists pods that match a specific `label=value` selector.

---

## 5. Deleting Resources

* `kubectl delete po <pod-name>`
  *(Section 8)* Deletes the specified pod.
  The same pattern applies to other resources such as `svc`, `rs`, and `deploy`.

* `kubectl delete po --all`
  *(Section 8)* Deletes **all pods** in the current namespace.
  Can also be used with `svc`, `rs`, or `deploy`.

---

## 6. Deployment Management

These commands help you monitor and manage rolling updates of Deployments.

* `kubectl rollout status deploy <deployment-name>`
  *(Section 9)* Displays the current rollout status of the deployment.

* `kubectl rollout history deploy <deployment-name>`
  *(Section 9)* Shows the revision history of the deployment.

* `kubectl rollout undo deploy <deployment-name>`
  *(Section 9)* Rolls back the deployment by one revision.
  Optionally use:

  ```
  kubectl rollout undo deploy <deployment-name> --to-revision=<revision-number>
  ```

  ⚠️ **Important warning**:
  This should be used **only in emergency situations**. After a rollback, your YAML files may no longer match the live deployment state.

---

📌 *Tip for Java / Microservices Developers*:
Pair `kubectl apply` with version-controlled YAML files to keep your Kubernetes deployments consistent and auditable.
