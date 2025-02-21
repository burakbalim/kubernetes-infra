{{- define "postgres.primaryHost" -}}
{{ .Release.Name }}-master.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}

{{- define "postgres.replicaHost" -}}
{{ .Release.Name }}-slave.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}


{{/* postgres.fullname */}}
{{- define "postgres-slave.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
