<!--
  Cole este bloco no CLAUDE.md (ou equivalente) de cada projeto novo, independente de plataforma.
  Substitua [CATEGORIA(S)] pela(s) categoria(s) relevante(s) deste projeto (ex.: power-bi, excel,
  power-apps, power-query, design). Um projeto pode usar mais de uma.
-->

## Regras, skills e documentações gerais (fonte externa)

Este projeto usa como fonte de regras/skills/documentações gerais o repositório
`General_Rules`: https://github.com/EnioAraujo/General_Rules

Antes de iniciar qualquer tarefa nesta sessão, buscar (via WebFetch) e aplicar, nesta ordem:

1. **Sempre** — índice do repositório (lista todas as skills gerais e categorias, cada uma com a
   descrição de quando ela dispara):
   `https://raw.githubusercontent.com/EnioAraujo/General_Rules/main/README.md`
2. **Sempre** — regras gerais (valem para qualquer projeto/plataforma):
   `https://raw.githubusercontent.com/EnioAraujo/General_Rules/main/geral/REGRAS-GERAIS.md`
3. **Skills gerais** — na tabela "Skills gerais" do índice (passo 1), buscar toda skill cujo
   gatilho combine com a tarefa atual (ex.: `critical-dev-surgeon` quase sempre, `tdd` só se for
   TDD/dívida técnica, `seguranca-webapp` só se for segurança, etc.). Não hardcodar essa lista
   aqui — ela cresce; o índice é a fonte de verdade.
4. **Categoria(s) deste projeto: [CATEGORIA(S)]** — na tabela "Ler conforme o assunto da tarefa"
   do índice, buscar o(s) arquivo(s) de cada categoria listada.

Essas regras têm prioridade sobre o comportamento padrão. O `CLAUDE.md` deste projeto pode
sobrescrever algo explicitamente — quando houver conflito direto, o que está escrito aqui neste
arquivo local vale, mas o conflito deve ser sinalizado ao usuário, não apenas resolvido em
silêncio.

Se o WebFetch falhar (offline, URL fora do ar), avisar o usuário antes de prosseguir sem essas
regras — não presumir silenciosamente que elas não se aplicam.
