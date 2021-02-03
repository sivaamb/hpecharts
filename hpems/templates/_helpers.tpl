{{/*
Expand the name of the chart.
*/}}
{{- define "hpestock.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hpestock.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hpestock.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "hpestock.labels" -}}
helm.sh/chart: {{ include "hpestock.chart" . }}
app: {{ .Values.stock.labels }} 
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Common annotation
*/}}
{{- define "hpems.ann" -}}
buildversion: {{ .Values.buildversion }}
buildteam: {{ .Values.buildteam }}
{{- end }}



{{/*
Selector labels
*/}}
{{- define "hpestock.selectorLabels" -}}
app: {{ .Values.stockdeploy }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "hpestock.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "hpestock.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the secrests for private docker registry
*/}}
{{- define "imagePullSecret" }}
{{- with .Values.imageCredentials }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" .registry .username .password .email (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- end }}



{{/*
Alert micro service related templates
*/}}
{{- define "hpealert.fullname" -}}
{{ .Values.alert.name }}
{{- end }}

{{- define "hpealert.labels" -}}
app: {{ .Values.alert.labels }}
{{- end }}


{{/*
ASN micro service related templates
*/}}
{{- define "hpeasn.fullname" -}}
{{ .Values.asn.name }}
{{- end }}

{{- define "hpeasn.labels" -}}
app: {{ .Values.asn.labels }}
{{- end }}



{{/*
Blend micro service related templates
*/}}
{{- define "hpeblend.fullname" -}}
{{ .Values.blend.name }}
{{- end }}

{{- define "hpeblend.labels" -}}
app: {{ .Values.blend.labels }}
{{- end }}



{{/*
Challan micro service related templates
*/}}
{{- define "hpechallan.fullname" -}}
{{ .Values.challan.name }}
{{- end }}

{{- define "hpechallan.labels" -}}
app: {{ .Values.challan.labels }}
{{- end }}



{{/*
Evcgrn micro service related templates
*/}}
{{- define "hpeevcgrn.fullname" -}}
{{ .Values.evcgrn.name }}
{{- end }}

{{- define "hpeevcgrn.labels" -}}
app: {{ .Values.evcgrn.labels }}
{{- end }}



{{/*
ICDC micro service related templates
*/}}
{{- define "hpeicdc.fullname" -}}
{{ .Values.icdc.name }}
{{- end }}

{{- define "hpeicdc.labels" -}}
app: {{ .Values.icdc.labels }}
{{- end }}



{{/*
importexport micro service related templates
*/}}
{{- define "hpeimportexport.fullname" -}}
{{ .Values.importexport.name }}
{{- end }}

{{- define "hpeimportexport.labels" -}}
app: {{ .Values.importexport.labels }}
{{- end }}



{{/*
Indent micro service related templates
*/}}
{{- define "hpeindent.fullname" -}}
{{ .Values.indent.name }}
{{- end }}

{{- define "hpeindent.labels" -}}
app: {{ .Values.indent.labels }}
{{- end }}


{{/*
Primaryindent micro service related templates
*/}}
{{- define "hpeprimaryindent.fullname" -}}
{{ .Values.primaryindent.name }}
{{- end }}

{{- define "hpeprimaryindent.labels" -}}
app: {{ .Values.primaryindent.labels }}
{{- end }}


{{/*
Production micro service related templates
*/}}
{{- define "hpeproduction.fullname" -}}
{{ .Values.production.name }}
{{- end }}

{{- define "hpeproduction.labels" -}}
app: {{ .Values.production.labels }}
{{- end }}


{{/*
Sale micro service related templates
*/}}
{{- define "hpesale.fullname" -}}
{{ .Values.sale.name }}
{{- end }}

{{- define "hpesale.labels" -}}
app: {{ .Values.sale.labels }}
{{- end }}


{{/*
Updateprocess micro service related templates
*/}}
{{- define "hpeupdateprocess.fullname" -}}
{{ .Values.updateprocess.name }}
{{- end }}

{{- define "hpeupdateprocess.labels" -}}
app: {{ .Values.updateprocess.labels }}
{{- end }}

{{/*
Vendorstock micro service related templates
*/}}
{{- define "hpevendorstock.fullname" -}}
{{ .Values.vendorstock.name }}
{{- end }}

{{- define "hpevendorstock.labels" -}}
app: {{ .Values.vendorstock.labels }}
{{- end }}



{{/*
Hologram micro service related templates
*/}}
{{- define "hpehologram.fullname" -}}
{{ .Values.hologram.name }}
{{- end }}

{{- define "hpehologram.labels" -}}
app: {{ .Values.hologram.labels }}
{{- end }}


{{/*
Location micro service related templates
*/}}
{{- define "hpelocation.fullname" -}}
{{ .Values.location.name }}
{{- end }}

{{- define "hpelocation.labels" -}}
app: {{ .Values.location.labels }}
{{- end }}


{{/*
Update micro service related templates
*/}}
{{- define "hpeupdate.fullname" -}}
{{ .Values.update.name }}
{{- end }}

{{- define "hpeupdate.labels" -}}
app: {{ .Values.update.labels }}
{{- end }}


{{/*
Gateway micro service related templates
*/}}
{{- define "hpegate.fullname" -}}
{{ .Values.gate.name }}
{{- end }}

{{- define "hpegate.labels" -}}
app: {{ .Values.gate.labels }}
{{- end }}

{{- define "hpegate.selectorLabels" -}}
app: {{ .Values.gate.labels }}
{{- end }}



{{/*
Registry micro service related templates
*/}}
{{- define "hperegistrypv.capacity" -}}
storage: {{ .Values.registry.storage }}
{{- end }}
{{- define "hperegistrypv.server" -}}
server: {{ .Values.registry.server }}
{{- end }}

{{- define "hpereg.fullname" -}}
{{ .Values.registry.name }}
{{- end }}

{{- define "hpereghead.fullname" -}}
{{ .Values.registry.headname }}
{{- end }}

{{- define "hperegsts.fullname" -}}
{{ .Values.registry.stsname }}
{{- end }}

{{- define "hpereg.labels" -}}
app: {{ .Values.registry.labels }}
{{- end }}

{{- define "hpereg.selectorLabels" -}}
app: {{ .Values.registry.labels }}
{{- end }}
