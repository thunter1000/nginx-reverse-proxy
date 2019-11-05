# NGINX Reverse Proxy.

Docker image for reverse proxying traffic to another host.

**Example:**

Docker:
```bash
docker build -t nginx-reverse-proxy .
docker run --rm -it -p 8005:80 -e TARGET="https://www.google.com" -e HOST="www.google.com" nginx-reverse-proxy
```

K8s:
```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  labels:
    app: nginx-reverse
  name: nginx-reverse
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-reverse
  template:
    metadata:
      labels:
        app: nginx-reverse
    spec:
      containers:
      - env:
        - name: HOST
          value: www.google.com
        - name: TARGET
          value: https://www.google.com/
        image: thunter1000/nginx-reverse-proxy
        name: nginx-reverse
```