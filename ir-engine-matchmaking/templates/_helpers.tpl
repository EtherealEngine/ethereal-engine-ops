{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
# {{- define "ir-engine.name" -}}
# {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
# {{- end -}}

{{- define "ir-engine.director.name" -}}
{{- default .Chart.Name .Values.director.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ir-engine.matchfunction.name" -}}
{{- default .Chart.Name .Values.matchfunction.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ir-engine.matchmaking-namespace" -}}
{{- printf "%s-%s" .Values.release.name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ir-engine.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "ir-engine.director.fullname" -}}
{{- if .Values.director.fullnameOverride -}}
{{- .Values.director.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Values.director.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "ir-engine.matchfunction.fullname" -}}
{{- if .Values.matchfunction.fullnameOverride -}}
{{- .Values.matchfunction.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Values.matchfunction.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ir-engine.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "ir-engine.director.labels" -}}
helm.sh/chart: {{ include "ir-engine.chart" . }}
{{ include "ir-engine.director.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "ir-engine.matchfunction.labels" -}}
helm.sh/chart: {{ include "ir-engine.chart" . }}
{{ include "ir-engine.matchfunction.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ir-engine.director.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ir-engine.director.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: director
{{- end -}}


{{- define "ir-engine.matchfunction.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ir-engine.matchfunction.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: matchfunction
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "ir-engine.director.serviceAccountName" -}}
{{- if .Values.director.serviceAccount.create -}}
    {{ default (include "ir-engine.director.fullname" .) .Values.director.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.director.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "ir-engine.matchfunction.serviceAccountName" -}}
{{- if .Values.matchfunction.serviceAccount.create -}}
    {{ default (include "ir-engine.matchfunction.fullname" .) .Values.matchfunction.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.matchfunction.serviceAccount.name }}
{{- end -}}
{{- end -}}
