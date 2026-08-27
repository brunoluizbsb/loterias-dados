name: Atualizar resultados das loterias

on:
  schedule:
    # Roda algumas vezes por dia, cobrindo o horário dos sorteios (horário UTC).
    # Lotofácil sorteia ~20h BRT (23h UTC), Lotomania costuma ser mais cedo.
    # Rodar várias vezes ao dia garante que o resultado seja pego mesmo se atrasar.
    - cron: "30 22 * * *"   # 19h30 BRT
    - cron: "0 0 * * *"     # 21h00 BRT
    - cron: "0 2 * * *"     # 23h00 BRT
    - cron: "0 12 * * *"    # 09h00 BRT (manhã seguinte, garante que pegou)
  workflow_dispatch: {}      # permite rodar manualmente pelo botão "Run workflow" no GitHub

permissions:
  contents: write

jobs:
  atualizar:
    runs-on: ubuntu-latest
    steps:
      - name: Baixar o repositório
        uses: actions/checkout@v4

      - name: Buscar resultados mais recentes
        run: bash scripts/fetch_loterias.sh

      - name: Publicar mudanças (se houver algo novo)
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add data/*.json
          if git diff --cached --quiet; then
            echo "Nada novo para publicar."
          else
            git commit -m "Atualiza resultados das loterias [automático]"
            git push
          fi
