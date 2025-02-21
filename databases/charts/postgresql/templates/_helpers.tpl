{{- define "postgres.primaryHost" -}}
{{ .Release.Name }}-master.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}

{{- define "postgres.replicaHost" -}}
{{ .Release.Name }}-slave.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}
