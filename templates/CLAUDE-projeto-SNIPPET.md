<!--
  Cole este bloco no CLAUDE.md (ou equivalente) de cada projeto novo, independente de plataforma.
  Nada pra preencher — o reconhecimento de categoria é automático (passo 3), a cada tarefa.
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
3. **Reconhecimento automático por tarefa** — a cada tarefa desta sessão (não só no início), olhar
   as duas tabelas do índice (passo 1) — "Skills gerais" e "Ler conforme o assunto da tarefa" — e
   buscar toda entrada cujo gatilho/descrição combine com o que está sendo pedido agora. Isso vale
   tanto pra skill (`tdd`, `seguranca-webapp`, `sdd`...) quanto pra categoria (`power-bi`, `excel`,
   `power-apps`...). Não é preciso declarar de antemão quais categorias este projeto usa — se a
   tarefa mudar de assunto no meio do projeto (hoje é Power BI, amanhã é Excel), buscar a categoria
   nova na hora, sem precisar editar este arquivo.

Essas regras têm prioridade sobre o comportamento padrão. O `CLAUDE.md` deste projeto pode
sobrescrever algo explicitamente — quando houver conflito direto, o que está escrito aqui neste
arquivo local vale, mas o conflito deve ser sinalizado ao usuário, não apenas resolvido em
silêncio.

Se o WebFetch falhar (offline, URL fora do ar), avisar o usuário antes de prosseguir sem essas
regras — não presumir silenciosamente que elas não se aplicam.
