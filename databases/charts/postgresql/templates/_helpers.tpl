{{- define "postgres.primaryHost" -}}
{{ include "postgres.fullname" . }}-master.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}

{{- define "postgres.replicaHost" -}}
{{ include "postgres.fullname" . }}-slave.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}


{{/* postgres.fullname */}}
{{- define "postgres.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
