# 🧭 Helm Cheat Sheet

This document is a practical Helm command reference, covering the most common workflows:
**repositories → install → inspect → upgrade → template → uninstall**.

---

## 1️⃣ Helm Help & Basics

```bash
helm help
helm help repo
helm help install
```

📌 Use `helm help <command>` whenever you’re unsure about flags or usage.

---

## 2️⃣ Helm Repositories

Helm charts are stored in **chart repositories** (similar to apt/yum/npm registries).

### Add a repository

```bash
helm repo add prom-repo https://prometheus-community.github.io/helm-charts
```

* `prom-repo` is a **local alias**
* You’ll use this alias when installing charts

### List repositories

```bash
helm repo list
```

### Update repository index

```bash
helm repo update
```

📌 Always run `helm repo update` before installing or upgrading charts to get the latest versions.

---

## 3️⃣ Installing Charts

### General install syntax

```bash
helm install <RELEASE-NAME> <REPO-ALIAS>/<CHART-NAME>
```

* **RELEASE-NAME**: name you choose (logical instance name)
* **CHART-NAME**: chart from the repo

### Example

```bash
helm install monitoring prom-repo/kube-prometheus-stack
```

This creates:

* a Helm **release** named `monitoring`
* multiple Kubernetes resources (Pods, Services, CRDs, etc.)

---

## 4️⃣ Listing Installed Releases

```bash
helm list
```

Common variants:

```bash
helm list --all-namespaces
helm list -n monitoring
```

📌 Helm tracks releases independently from `kubectl`.

---

## 5️⃣ Inspecting Charts

### Show default values

```bash
helm show values prom-repo/kube-prometheus-stack
```

This shows:

* all configurable options
* defaults used if you don’t override anything

📌 Best practice:

> Copy this output into `values.yaml` and customize from there.

---

## 6️⃣ Upgrading a Release

Upgrading is how you:

* change configuration
* upgrade chart versions
* redeploy safely

### Upgrade using a values file

```bash
helm upgrade monitoring prom-repo/kube-prometheus-stack --values=values.yaml
```

### Upgrade using a local chart

```bash
helm upgrade monitoring --values=myvalues.yaml .
```

* `.` means “use the chart in the current directory”
* Common when you’ve pulled and modified a chart locally

📌 Helm upgrades are **in-place and versioned** (rollback is possible).

---

## 7️⃣ Uninstalling a Release

```bash
helm uninstall monitoring
```

This:

* deletes Kubernetes resources created by the chart
* removes the Helm release record

⚠️ Note:

* CRDs may **not** be deleted automatically (depends on the chart)

---

## 8️⃣ Downloading Charts (Pull)

### Download and extract a chart

```bash
helm pull prom-repo/kube-prometheus-stack --untar=true
```

This creates:

```text
kube-prometheus-stack/
  Chart.yaml
  values.yaml
  templates/
```

📌 Useful when:

* you want to inspect templates
* customize charts locally
* render manifests manually

---

## 9️⃣ Rendering Templates (No Cluster Required)

Helm can render Kubernetes YAML **without installing anything**.

### Render templates to a file

```bash
helm template monitoring kube-prometheus-stack/ \
  --values=./kube-prometheus-stack/myvalues.yaml \
  > monitoring-stack.yaml
```

This:

* substitutes values
* processes templates
* outputs **plain Kubernetes YAML**

📌 Great for:

* debugging
* GitOps
* understanding what Helm actually deploys

---

## 🔟 Typical Helm Workflow (Mental Model)

```text
helm repo add
helm repo update
helm show values
↓
edit values.yaml
↓
helm install / helm upgrade
↓
helm list
↓
helm uninstall (when done)
```

# Helm create charts
➜ helm create fleetman-helm-chart
Creating fleetman-helm-chart

helmcourse/fleetman/fleetman-helm-chart on  master [?] via ⎈ v3.19.0 
➜ ll
total 24
-rw-r--r--   1 t827056  staff  1155  6 Feb 22:17 Chart.yaml
drwxr-xr-x   2 t827056  staff    64  6 Feb 22:17 charts
drwxr-xr-x  11 t827056  staff   352  6 Feb 22:17 templates
-rw-r--r--   1 t827056  staff  5265  6 Feb 22:17 values.yaml

# Overrides the value in template:
helm template . --set numberOfWebappReplicas=127


