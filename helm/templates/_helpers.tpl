{{/*
Expand the name of the chart.
*/}}
{{- define "fastapi-chart.name" -}}
{{ .Chart.Name | quote }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "fastapi-chart.fullname" -}}
{{ printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "fastapi-chart.chart" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "fastapi-chart.labels" -}}
helm.sh/chart: {{ include "fastapi-chart.chart" . }}
{{ include "fastapi-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "fastapi-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fastapi-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "fastapi-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{ default (include "fastapi-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{ default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Debug information
*/}}
{{- define "fastapi-chart.debug" -}}
Chart Name: {{ .Chart.Name | quote }}
Release Name: {{ .Release.Name | quote }}
Values: {{ .Values | toYaml }}
{{- end }}

