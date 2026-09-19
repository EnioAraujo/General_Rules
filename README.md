# General_Rules

Cérebro central de regras, skills e documentações reutilizáveis entre projetos — independente de
plataforma ou ferramenta. Cada projeto novo aponta para este repositório em vez de duplicar regras.

## Como um projeto consome este repositório

O `CLAUDE.md` (ou equivalente) de cada projeto deve conter um bloco que busca, via WebFetch, os
arquivos relevantes deste repositório no início da sessão. Ver
[`templates/CLAUDE-projeto-SNIPPET.md`](./templates/CLAUDE-projeto-SNIPPET.md) — copiar esse bloco
para o CLAUDE.md do projeto e ajustar a lista de categorias.

Regra de precedência: **geral → categoria → projeto**. O CLAUDE.md do projeto pode sobrescrever
algo deste repositório, mas só explicitamente e sinalizando o conflito ao usuário — nunca em
silêncio.

## Índice de roteamento

### Sempre ler (qualquer projeto, qualquer tarefa)

| Arquivo | Conteúdo |
|---|---|
| [`geral/REGRAS-GERAIS.md`](./geral/REGRAS-GERAIS.md) | As 8 regras permanentes de trabalho: REGRA LIVE, proibição de editar em pedidos de leitura, análise em cadeia completa, sigilo de credenciais, atualização de docs só quando pedido, execução/verificação, conferência final obrigatória, objetividade. |
| [`geral/skills/critical-dev-surgeon.md`](./geral/skills/critical-dev-surgeon.md) | Skill de revisor técnico crítico / implementador cirúrgico — dispara em qualquer tarefa de dev (código, config, dados, infra) que altere algo já em funcionamento. |

### Ler conforme o assunto da tarefa

| Categoria | Quando usar | Arquivos |
|---|---|---|
| **Power BI** | Tarefas com Power BI, DAX, deploy de medidas via TOM | [`categorias/power-bi/REGRAS-POWERBI.md`](./categorias/power-bi/REGRAS-POWERBI.md) · script: [`categorias/power-bi/scripts/inject-measure-TEMPLATE.ps1`](./categorias/power-bi/scripts/inject-measure-TEMPLATE.ps1) |
| **Power Apps** | Tarefas com Canvas Apps / Power Apps | [`categorias/power-apps/README.md`](./categorias/power-apps/README.md) — ainda sem regras genéricas registradas |
| **Power Query** | Tarefas com M / transformação de dados | [`categorias/power-query/README.md`](./categorias/power-query/README.md) — ainda sem regras registradas |
| **Excel** | Tarefas com planilhas, VBA, fórmulas | [`categorias/excel/README.md`](./categorias/excel/README.md) — ainda sem regras registradas |
| **Design** | Paleta, layout, identidade visual | [`categorias/design/README.md`](./categorias/design/README.md) — ainda sem regras registradas |

### Não faz parte do cérebro (arquivado)

[`_arquivo/`](./_arquivo/README.md) — conteúdo específico de um workspace/projeto que entrou no
primeiro upload deste repositório por engano (estado de app, script com dado de cliente real).
Preservado por histórico, não é regra geral nem de categoria, e **não deve ser buscado pelos
projetos**. Contém aviso de dado sensível — ler antes de decidir o que fazer com ele.

## Estrutura de pastas

```
General_Rules/
├── README.md                          # este arquivo — índice mestre
├── geral/
│   ├── REGRAS-GERAIS.md               # regras universais, qualquer plataforma
│   └── skills/
│       └── critical-dev-surgeon.md
├── categorias/
│   ├── power-bi/
│   │   ├── REGRAS-POWERBI.md
│   │   └── scripts/inject-measure-TEMPLATE.ps1
│   ├── power-apps/README.md
│   ├── power-query/README.md
│   ├── excel/README.md
│   └── design/README.md
├── templates/
│   └── CLAUDE-projeto-SNIPPET.md      # colar no CLAUDE.md de cada projeto novo
└── _arquivo/                          # fora do escopo — ver aviso acima
```

## Convenção para adicionar uma nova categoria ou regra

1. Categoria nova → criar pasta em `categorias/<nome-em-minúsculo-com-hífen>/`.
2. Arquivo de regra → `REGRAS-<ASSUNTO>.md` (maiúsculo, sem acento no nome do arquivo).
3. Skill nova (com frontmatter `name`/`description`) → `geral/skills/<nome>.md` se for
   independente de plataforma, ou `categorias/<categoria>/skills/<nome>.md` se for específica.
4. Sempre atualizar a tabela de índice acima ao adicionar ou renomear um arquivo — é o que os
   projetos consultam primeiro.
5. Nunca commitar credencial, IP, token ou dado de cliente real neste repositório — ele é
   **público**. Usar placeholder e generalizar (ver regra 4 em `geral/REGRAS-GERAIS.md`).
