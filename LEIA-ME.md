# Como ativar a atualização automática (uma vez só, ~5 minutos)

## Passo 1 — Criar a conta no GitHub (se ainda não tiver)
1. Acesse https://github.com/signup
2. Use o e-mail bruno.luizbsb@gmail.com, escolha um usuário e uma senha
3. Confirme o e-mail que o GitHub vai te enviar (clique no link recebido)

## Passo 2 — Criar um repositório novo
1. Depois de logado, clique no **+** no canto superior direito → **New repository**
2. Nome sugerido: `loterias-dados`
3. Marque como **Public** (precisa ser público para o app conseguir ler os dados de graça)
4. Clique em **Create repository**

## Passo 3 — Subir estes 3 arquivos
Dentro do repositório recém-criado, clique em **Add file → Upload files** e envie, **mantendo essa mesma estrutura de pastas**:

```
.github/workflows/update-loterias.yml
scripts/fetch_loterias.sh
```

(A pasta `data/` não precisa ser enviada — ela será criada sozinha na primeira vez que o robô rodar.)

Dica: se o GitHub reclamar que não aceita pastas no upload direto, crie os arquivos um por um pelo botão **Add file → Create new file** e cole o caminho completo (ex: `.github/workflows/update-loterias.yml`) no campo do nome — o GitHub cria as pastas sozinho.

## Passo 4 — Rodar pela primeira vez
1. Vá na aba **Actions** do repositório
2. Clique no workflow **"Atualizar resultados das loterias"**
3. Clique em **Run workflow** → **Run workflow** (botão verde)
4. Espere ~30 segundos e atualize a página — deve aparecer com um ✅ verde
5. Depois disso, ele roda sozinho todo dia, nos horários configurados, sem você precisar fazer mais nada

## Passo 5 — Me avisar o nome do seu usuário
Depois de feito, me manda o link do repositório (ou só o nome de usuário) que eu ajusto os dois apps (Lotofácil e Lotomania) para buscarem os dados direto de:

```
https://raw.githubusercontent.com/SEU_USUARIO/loterias-dados/main/data/lotofacil.json
https://raw.githubusercontent.com/SEU_USUARIO/loterias-dados/main/data/lotomania.json
```

Esse endereço (`raw.githubusercontent.com`) sempre libera acesso de qualquer site (CORS liberado por padrão), então essa vai ser a fonte mais confiável de todas — não depende de nenhuma API de terceiro que pode sair do ar.
