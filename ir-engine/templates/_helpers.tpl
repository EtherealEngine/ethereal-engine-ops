{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
# {{- define "ir-engine.name" -}}
# {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
# {{- end -}}

{{- define "ir-engine.taskserver.name" -}}
{{- default .Chart.Name .Values.taskserver.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ir-engine.client.name" -}}
{{- default .Chart.Name .Values.client.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ir-engine.api.name" -}}
{{- default .Chart.Name .Values.api.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ir-engine.media.name" -}}
{{- default .Chart.Name .Values.media.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ir-engine.instanceserver.name" -}}
{{- default .Chart.Name .Values.instanceserver.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ir-engine.testbot.name" -}}
{{- default .Chart.Name .Values.testbot.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ir-engine.batchinvalidator.name" -}}
{{- default .Chart.Name .Values.batchinvalidator.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
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


{{- define "ir-engine.taskserver.fullname" -}}
{{- if .Values.taskserver.fullnameOverride -}}
{{- .Values.taskserver.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Values.taskserver.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{- define "ir-engine.client.fullname" -}}
{{- if .Values.client.fullnameOverride -}}
{{- .Values.client.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Values.client.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{- define "ir-engine.api.fullname" -}}
{{- if .Values.api.fullnameOverride -}}
{{- .Values.api.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{- define "ir-engine.media.fullname" -}}
{{- if .Values.media.fullnameOverride -}}
{{- .Values.media.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Values.media.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "ir-engine.instanceserver.fullname" -}}
{{- if .Values.instanceserver.fullnameOverride -}}
{{- .Values.instanceserver.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Values.instanceserver.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{- define "ir-engine.testbot.fullname" -}}
{{- if (.Values.testbot).fullnameOverride -}}
{{- .Values.testbot.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (.Values.testbot).name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "ir-engine.batchinvalidator.fullname" -}}
{{- if .Values.batchinvalidator.fullnameOverride -}}
{{- .Values.batchinvalidator.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Values.batchinvalidator.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "ir-engine.client.host" -}}
{{- printf "%s.%s.%s" "dashboard" .Release.Name .Values.domain -}}
{{- end -}}


{{- define "ir-engine.media.host" -}}
{{- printf "%s.%s.%s" "media" .Release.Name .Values.domain -}}
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
{{- define "ir-engine.taskserver.labels" -}}
helm.sh/chart: {{ include "ir-engine.chart" . }}
{{ include "ir-engine.taskserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ir-engine.taskserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ir-engine.taskserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: taskserver
{{- end -}}

{{/*
Common labels
*/}}
{{- define "ir-engine.client.labels" -}}
helm.sh/chart: {{ include "ir-engine.chart" . }}
{{ include "ir-engine.client.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ir-engine.client.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ir-engine.client.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: client
{{- end -}}


{{/*
Common labels
*/}}
{{- define "ir-engine.api.labels" -}}
helm.sh/chart: {{ include "ir-engine.chart" . }}
{{ include "ir-engine.api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ir-engine.api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ir-engine.api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: api
{{- end -}}


{{/*
Common labels
*/}}
{{- define "ir-engine.media.labels" -}}
helm.sh/chart: {{ include "ir-engine.chart" . }}
{{ include "ir-engine.media.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ir-engine.media.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ir-engine.media.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: media
{{- end -}}

{{/*
Common labels
*/}}
{{- define "ir-engine.instanceserver.labels" -}}
helm.sh/chart: {{ include "ir-engine.chart" . }}
{{ include "ir-engine.instanceserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ir-engine.instanceserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ir-engine.instanceserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: instanceserver
{{- end -}}


{{/*
Common labels
*/}}
{{- define "ir-engine.testbot.labels" -}}
helm.sh/chart: {{ include "ir-engine.chart" . }}
{{ include "ir-engine.testbot.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ir-engine.testbot.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ir-engine.testbot.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: testbot
{{- end -}}

{{/*
Common labels
*/}}
{{- define "ir-engine.batchinvalidator.labels" -}}
helm.sh/chart: {{ include "ir-engine.chart" . }}
{{ include "ir-engine.batchinvalidator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ir-engine.batchinvalidator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ir-engine.batchinvalidator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: batchinvalidator
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "ir-engine.taskserver.serviceAccountName" -}}
{{- if .Values.taskserver.serviceAccount.create -}}
    {{ default (include "ir-engine.taskserver.fullname" .) .Values.taskserver.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.taskserver.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "ir-engine.client.serviceAccountName" -}}
{{- if .Values.client.serviceAccount.create -}}
    {{ default (include "ir-engine.client.fullname" .) .Values.client.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.client.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "ir-engine.api.serviceAccountName" -}}
{{- if .Values.api.serviceAccount.create -}}
    {{ default (include "ir-engine.api.fullname" .) .Values.api.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.api.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "ir-engine.media.serviceAccountName" -}}
{{- if .Values.media.serviceAccount.create -}}
    {{ default (include "ir-engine.media.fullname" .) .Values.media.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.media.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "ir-engine.instanceserver.serviceAccountName" -}}
{{- if .Values.instanceserver.serviceAccount.create -}}
    {{ default (include "ir-engine.instanceserver.fullname" .) .Values.instanceserver.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.instanceserver.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "ir-engine.testbot.serviceAccountName" -}}
{{- if ((.Values.testbot).serviceAccount).create -}}
    {{ default (include "ir-engine.testbot.fullname" .) .Values.testbot.serviceAccount.name }}
{{- else -}}
    {{ default "default" ((.Values.testbot).serviceAccount).name }}
{{- end -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "ir-engine.mariadb.fullname" -}}
{{- if ((.Values.mariadb).fullnameOverride) -}}
{{- .Values.mariadb.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.mariadb.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{/*
Set maria host
*/}}
{{- define "ir-engine.mariadb.host" -}}
{{- if ((.Values.mariadb).enabled) -}}
{{- template "ir-engine.mariadb.fullname" . -}}
{{- else if ((.Values.mariadb).externalHost) -}}
{{- .Values.mariadb.externalHost | quote -}}
{{- end -}}
{{- end -}}
