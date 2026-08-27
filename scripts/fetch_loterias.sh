#!/usr/bin/env bash
# Busca os resultados mais recentes da Lotofácil e da Lotomania direto na API da Caixa
# e salva em data/lotofacil.json e data/lotomania.json.
set -e

mkdir -p data

fetch_latest () {
  local jogo="$1"
  local out="$2"
  echo "Buscando $jogo..."
  if curl -sf --max-time 20 \
      -H "User-Agent: Mozilla/5.0" \
      "https://servicebus2.caixa.gov.br/portaldeloterias/api/${jogo}/" \
      -o "$out.tmp"; then
    if [ -s "$out.tmp" ] && grep -q '"numero"' "$out.tmp"; then
      mv "$out.tmp" "$out"
      echo "OK (fonte: Caixa oficial)"
      return 0
    fi
  fi
  if curl -sf --max-time 20 \
      "https://loteriascaixa-api.herokuapp.com/api/${jogo}/latest" \
      -o "$out.tmp"; then
    if [ -s "$out.tmp" ] && grep -q '"concurso"' "$out.tmp"; then
      mv "$out.tmp" "$out"
      echo "OK (fonte: loteriascaixa-api)"
      return 0
    fi
  fi
  echo "AVISO: não foi possível buscar $jogo desta vez."
  rm -f "$out.tmp"
  return 0
}

fetch_latest "lotofacil" "data/lotofacil.json"
fetch_latest "lotomania" "data/lotomania.json"

echo "Concluído."
