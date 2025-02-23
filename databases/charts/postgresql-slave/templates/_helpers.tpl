{{- define "postgres.primaryHost" -}}
{{ include "postgres-slave.fullname" . }}-master.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}

{{- define "postgres.replicaHost" -}}
{{ include "postgres-slave.fullname" . }}-slave.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}


{{/* postgres.fullname */}}
{{- define "postgres-slave.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
