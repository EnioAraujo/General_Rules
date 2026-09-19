# Arquivo — conteúdo fora do escopo deste repositório

Estes arquivos vieram do primeiro upload deste repositório e **não são regras gerais nem regras de
categoria** — são estado de projeto e script de um workspace específico (apps de Power Apps e um
deploy de medida DAX de um projeto de Power BI). Foram preservados aqui, sem edição de conteúdo,
para não perder histórico, mas não fazem parte do "cérebro" consultado pelos projetos.

- `CLAUDE-workspace-powerapps-ORIGINAL.md` — `CLAUDE.md` de um workspace de projetos de Power Apps
  em uma máquina específica (setup de ambiente Windows, e handoff de três apps: Controle de
  Terceiros, Relatório de Picking, Evidências TPE). As 8 regras genéricas que ele continha foram
  extraídas, generalizadas e movidas para [`geral/REGRAS-GERAIS.md`](../geral/REGRAS-GERAIS.md); o
  resto é específico daquele workspace e deveria viver no repositório/pasta daquele projeto, não
  aqui.
- `inject_tom-ORIGINAL.ps1` — script de deploy de uma medida DAX específica de um projeto real
  (nome de cliente, empresa e usuário de domínio Windows em texto claro). Uma versão genérica e
  parametrizada, sem esses dados, está em
  [`categorias/power-bi/scripts/inject-measure-TEMPLATE.ps1`](../categorias/power-bi/scripts/inject-measure-TEMPLATE.ps1).

> Removidos desta pasta (conteúdo já 100% absorvido em outro lugar, sem perda): as versões antigas
> em `.skill` já superadas pelos `.md` de referência em `geral/skills/`, `Regras_intocaveis.txt`
> (coberto por `geral/REGRAS-GERAIS.md`) e `contexto_excel.md` (metade redundante com
> `critical-dev-surgeon`, metade extraída para
> [`categorias/excel/REGRAS-EXCEL-POWERQUERY.md`](../categorias/excel/REGRAS-EXCEL-POWERQUERY.md)).

⚠️ **Atenção:** este repositório é **público**. Os dois arquivos que restam aqui contêm nome de
cliente, nome de empresa e nome de usuário de domínio em texto claro, e já estavam expostos nos
commits anteriores a esta reorganização — isso não é exposição nova, mas também não some sozinho.
Eliminar esses dados do histórico do git exige reescrevê-lo (`git filter-repo`/BFG + force-push) —
ação destrutiva que só deve ser feita mediante pedido explícito.
