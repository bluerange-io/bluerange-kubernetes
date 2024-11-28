{{- if and (not .Values.bluerangeServer.config) (not .Values.bluerangeServer.environment) (not .Values.bluerangeServer.secrets)  -}}
{{ fail "Please provide at least one of the following values: bluerangeServer.config, bluerangeServer.environment, bluerangeServer.secrets" }}
{{- end -}}
