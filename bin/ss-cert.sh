#!/bin/sh

openssl genrsa -out "./secrets/ssl/local.key" 2048

openssl req -new -key "./secrets/ssl/local.key" \
  -out "./secrets/ssl/local.csr" \
  -subj "/C=BR/ST=Sao_Paulo/L=Sao_Paulo/O=OrgName/OU=IT Department/CN=example.com"

openssl x509 -req -days 365 \
  -in "./secrets/ssl/local.csr" \
  -signkey "./secrets/ssl/local.key" \
  -out "./secrets/ssl/local.crt"

rm -rf "./secrets/ssl/local.csr"
