#!/bin/sh

openssl genrsa -out "./config/ssl/local.key" 2048

openssl req -new -key "./config/ssl/local.key" \
  -out "./config/ssl/local.csr" \
  -subj "/C=BR/ST=Sao_Paulo/L=Sao_Paulo/O=OrgName/OU=IT Department/CN=example.com"

openssl x509 -req -days 365 \
  -in "./config/ssl/local.csr" \
  -signkey "./config/ssl/local.key" \
  -out "./config/ssl/local.crt"

rm -rf "./config/ssl/local.csr"
