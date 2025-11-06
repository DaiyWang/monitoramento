#!/bin/bash


SITE_URL="https://google.com/"

#-w "%{http_code}" : Escreve apenas o código de status (200, 404, 503)
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $SITE_URL)

if [$STATUS_CODE -eq 200 ]; then
	echo "Sucesso: O site $SITE_URL está ONLINE (Status: $STATUS_CODE)"
else
	echo "FALHA: O Site $SITE_URL está FORA DO AR. (Status: $STATUS_CODE)"
	
	#diga ao Shell (nuvem) que este script falhou
	exit 1
fi