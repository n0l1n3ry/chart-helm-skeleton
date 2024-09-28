{{- /*
Default Template for Service.
*/}}
{{- define "skeleton.service" }}
apiVersion: v1
kind: Service
metadata:
  labels:
    app: {{ .Values.appName }}
  name: {{ .Values.appName }}
spec:
  ports:
  - name: {{ .Values.service.name }}
    port: {{ .Values.skeleton.service.port }}
    protocol: {{ .Values.service.protocol | default "TCP" }}
    targetPort: {{ .Values.service.targetPort }}
  selector:
    app: {{ .Values.appName }}
{{- end }}

{{- /*
Default Template for Deployment.
*/}}
{{- define "skeleton.deployment" }}
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: {{ .Values.appName }}
  name: {{ .Values.appName }}
spec:
  replicas: {{ .Values.replicaCount  }}
  selector:
    matchLabels:
      app: {{ .Values.appName  }}
  template:
    metadata:
      labels:
        app: {{ .Values.appName  }}
    spec:
      containers:
      - name: {{ .Chart.Name }}
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
        imagePullPolicy: {{ .Values.image.pullPolicy }}
{{- end }}
