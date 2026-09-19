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

### Skills gerais (carregar quando o gatilho da própria skill disparar)

| Skill | Dispara quando |
|---|---|
| [`geral/skills/critical-dev-surgeon.md`](./geral/skills/critical-dev-surgeon.md) | Criar, modificar, revisar, depurar, refatorar ou otimizar algo que já está em funcionamento e tem dependências — qualquer plataforma. |
| [`geral/skills/boas-praticas-dev.md`](./geral/skills/boas-praticas-dev.md) | Qualquer tarefa de código: pensar antes de codar, simplicidade, mudanças cirúrgicas, critério de sucesso verificável. |
| [`geral/skills/tdd.md`](./geral/skills/tdd.md) | Escrever código com TDD (Red-Green-Refactor), ou varrer código existente por verbosidade/over-engineering/dívida técnica. |
| [`geral/skills/sdd.md`](./geral/skills/sdd.md) | Desenvolver a partir de especificação formal (Spec-Driven Development) antes de codar — complementa o TDD. |
| [`geral/skills/seguranca-webapp.md`](./geral/skills/seguranca-webapp.md) | Revisar, auditar, criar ou melhorar código de aplicação web com foco em segurança (OWASP Top 10, API, LLM, auth, criptografia, supply chain). |
| [`geral/skills/corrigir-texto.md`](./geral/skills/corrigir-texto.md) | Corrigir/revisar texto em linguagem natural sem alterar tom ou intenção. |
| [`geral/skills/design-copy.md`](./geral/skills/design-copy.md) | Engenharia reversa de uma interface web existente → `.md` de design system. |
| [`geral/skills/design-systems.md`](./geral/skills/design-systems.md) | Diretrizes gerais para construir/manter um design system (cor, tipografia, componentes, acessibilidade). |
| [`geral/skills/frontend-design.md`](./geral/skills/frontend-design.md) | Construir páginas/componentes/artefatos de frontend com estética distinta (marketing, landing pages, posters). |
| [`geral/skills/interface-design.md`](./geral/skills/interface-design.md) | Construir dashboards, painéis admin, apps e ferramentas — não para marketing (usar `frontend-design`). |
| [`geral/skills/caveman.md`](./geral/skills/caveman.md) | Modo de comunicação ultra-compactado (reduz ~75% de tokens de saída), sob pedido do usuário. |
| [`geral/skills/analise-dados-logistica-rh.md`](./geral/skills/analise-dados-logistica-rh.md) | Análise cruzando dados de RH (people analytics) com operações/logística. |

### Ler conforme o assunto da tarefa

| Categoria | Quando usar | Arquivos |
|---|---|---|
| **Power BI** | Tarefas com Power BI, DAX, deploy de medidas via TOM | [`categorias/power-bi/REGRAS-POWERBI.md`](./categorias/power-bi/REGRAS-POWERBI.md) · script: [`categorias/power-bi/scripts/inject-measure-TEMPLATE.ps1`](./categorias/power-bi/scripts/inject-measure-TEMPLATE.ps1) · [`formulas/`](./categorias/power-bi/formulas/) (medidas DAX soltas) |
| **Design** | Paleta, layout, componentes, identidade visual | [`categorias/design/REGRAS-DESIGN.md`](./categorias/design/REGRAS-DESIGN.md) |
| **Power Apps** | Tarefas com Canvas Apps / Power Apps | [`categorias/power-apps/README.md`](./categorias/power-apps/README.md) — skill completa + fórmulas Fx |
| **Power Query** | Tarefas com M / transformação de dados | [`categorias/power-query/README.md`](./categorias/power-query/README.md) — códigos M soltos, sem curadoria ainda |
| **Excel** | Tarefas com planilhas, VBA, fórmulas | [`categorias/excel/README.md`](./categorias/excel/README.md) — regras de Excel+Power Query, fórmulas, macros VBA |
| **Power Automate** | Tarefas com flows/expressões do Power Automate | [`categorias/power-automate/README.md`](./categorias/power-automate/README.md) — funções soltas, sem curadoria ainda |
| **Prompts para IA** | Reaproveitar um prompt já escrito | [`categorias/prompts-ia/README.md`](./categorias/prompts-ia/README.md) — sem curadoria/deduplicação ainda |

### Não faz parte do cérebro (arquivado)

[`_arquivo/`](./_arquivo/README.md) — conteúdo específico de workspace/projeto, regras já
absorvidas em `geral/REGRAS-GERAIS.md`, e pacotes `.skill` duplicados de um `.md` equivalente mais
completo. Preservado por histórico, **não deve ser buscado pelos projetos**. Contém aviso de dado
sensível — ler antes de decidir o que fazer com ele.

### Fora do git (quarentena — dado real sensível, não commitado)

4 arquivos vindos do último upload continham dado real sensível (credenciais, e-mails de
colegas/terceiros) e foram **retirados do repositório**, não apenas mascarados — ver aviso no final
da resposta da sessão em que foram tratados. Não estão em nenhum lugar deste git.

## Estrutura de pastas

```
General_Rules/
├── README.md                          # este arquivo — índice mestre
├── geral/
│   ├── REGRAS-GERAIS.md               # regras universais, qualquer plataforma
│   └── skills/                        # 11 skills gerais (ver tabela acima)
├── categorias/
│   ├── power-bi/{REGRAS-POWERBI.md, scripts/, formulas/}
│   ├── design/{README.md, REGRAS-DESIGN.md}
│   ├── power-apps/{README.md, skills/powerapps.md, formulas/}
│   ├── power-query/{README.md, codigos/}          # >100 arquivos, sem curadoria
│   ├── excel/{README.md, REGRAS-EXCEL-POWERQUERY.md, formulas/, macros/}
│   ├── power-automate/README.md                    # arquivos soltos, sem curadoria
│   └── prompts-ia/README.md                        # arquivos soltos, sem curadoria
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
6. **Arquivo solto na raiz** (ex.: upload manual pelo GitHub web) → categorizar na próxima sessão
   que o notar: identificar se é regra geral, skill, regra de categoria ou conteúdo específico de
   projeto (→ `_arquivo/`), mover para o lugar certo e atualizar este índice. Nunca deixar solto.
