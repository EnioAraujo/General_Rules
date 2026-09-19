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
- `Regras_intocaveis-ORIGINAL.txt` — versão antiga/curta das regras REGRA LIVE e "proibido editar
  em pedidos de leitura", já totalmente incorporadas em
  [`geral/REGRAS-GERAIS.md`](../geral/REGRAS-GERAIS.md) (itens 1 e 2). Mantido só por histórico.
- `contexto_excel-ORIGINAL.md` — metade era a mesma persona crítica de
  [`critical-dev-surgeon`](../geral/skills/critical-dev-surgeon.md) (redundante); a metade
  específica de Excel+Power Query foi extraída, generalizada (removidas as siglas de linha de
  negócio do cliente original) e virou
  [`categorias/excel/REGRAS-EXCEL-POWERQUERY.md`](../categorias/excel/REGRAS-EXCEL-POWERQUERY.md).
- `skills-duplicadas/` — pacotes `.skill` (zip com `SKILL.md` dentro) cujo conteúdo já existe como
  `.md` equivalente em `geral/skills/`, seja idêntico (`skill-powerapps-identico.skill`,
  `frontend-design-pacote.skill`, `interface-design-pacote.skill`) seja uma versão mais antiga e
  menos completa (`caveman-v-antiga.skill`, `seguranca-webapp-v-antiga.skill`). O `.md` em
  `geral/skills/` é a versão de referência.

⚠️ **Atenção:** este repositório é **público**. Os dois arquivos acima contêm nome de cliente,
nome de empresa e nome de usuário de domínio em texto claro, e já estavam expostos nos commits
anteriores a esta reorganização — mover os arquivos para cá não cria exposição nova, mas também
não remove a que já existe no histórico do git. Se quiser eliminar esses dados do histórico, isso
exige reescrever o histórico (`git filter-repo`/BFG + force-push) — ação destrutiva que só deve ser
feita mediante pedido explícito.
