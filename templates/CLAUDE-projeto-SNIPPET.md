<!--
  Cole este bloco no CLAUDE.md (ou equivalente) de cada projeto novo, independente de plataforma.
  Substitua [CATEGORIA(S)] pela(s) categoria(s) relevante(s) deste projeto (ex.: power-bi, excel,
  power-apps, power-query, design). Um projeto pode usar mais de uma.
-->

## Regras, skills e documentações gerais (fonte externa)

Este projeto usa como fonte de regras/skills/documentações gerais o repositório
`General_Rules`: https://github.com/EnioAraujo/General_Rules

Antes de iniciar qualquer tarefa nesta sessão, buscar (via WebFetch) e aplicar, nesta ordem:

1. **Sempre** — índice do repositório:
   `https://raw.githubusercontent.com/EnioAraujo/General_Rules/main/README.md`
2. **Sempre** — regras gerais (valem para qualquer projeto/plataforma):
   `https://raw.githubusercontent.com/EnioAraujo/General_Rules/main/geral/REGRAS-GERAIS.md`
3. **Sempre** — skill de revisão técnica crítica:
   `https://raw.githubusercontent.com/EnioAraujo/General_Rules/main/geral/skills/critical-dev-surgeon.md`
4. **Se a tarefa envolver TDD/testes ou varredura de dívida técnica**:
   `https://raw.githubusercontent.com/EnioAraujo/General_Rules/main/geral/skills/tdd.md`
5. **Se a tarefa envolver segurança de aplicação web** (revisão, auditoria, OWASP, auth, etc.):
   `https://raw.githubusercontent.com/EnioAraujo/General_Rules/main/geral/skills/seguranca-webapp.md`
6. **Se a tarefa envolver [CATEGORIA(S)]** — buscar o(s) arquivo(s) de categoria correspondente(s)
   listados no índice (passo 1), em
   `https://raw.githubusercontent.com/EnioAraujo/General_Rules/main/categorias/<categoria>/`

Essas regras têm prioridade sobre o comportamento padrão. O `CLAUDE.md` deste projeto pode
sobrescrever algo explicitamente — quando houver conflito direto, o que está escrito aqui neste
arquivo local vale, mas o conflito deve ser sinalizado ao usuário, não apenas resolvido em
silêncio.

Se o WebFetch falhar (offline, URL fora do ar), avisar o usuário antes de prosseguir sem essas
regras — não presumir silenciosamente que elas não se aplicam.
