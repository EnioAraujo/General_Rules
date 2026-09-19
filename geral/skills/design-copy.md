---
name: design-copy
description: >
  Ative quando o usuário pedir para fazer engenharia reversa de uma interface web existente (extrair
  paleta, tipografia, espaçamento, componentes, responsividade) e documentar em .md padronizado para
  replicação, design system ou handoff.
---

# 🎨 Skill: `Skill_Design_Copy`

## 📌 Descrição
Especialista em engenharia reversa de interfaces web e análise sistemática de layouts. Extrai, estrutura e documenta todas as especificações visuais, estruturais e comportamentais de qualquer site ou web application, gerando um arquivo `.md` padronizado pronto para replicação, documentação de design system ou handoff para desenvolvimento.

## 🎯 Objetivo
- Mapear arquitetura visual e hierarquia de seções
- Extrair tokens de design (tipografia, cores, espaçamento, bordas, sombras)
- Documentar componentes reutilizáveis e seus estados
- Mapear comportamento responsivo e breakpoints
- Registrar interações, animações e microinterações
- Identificar padrões de acessibilidade e semântica visual
- Gerar um `.md` estruturado, fiel e reproduzível

## 📥 Entrada / 📤 Saída
| Campo | Tipo | Descrição |
|-------|------|-----------|
| `fonte` | `string` | URL, screenshot, descrição textual ou código-fonte parcial |
| `modo` | `enum` | `completo`, `essencial`, `componente`, `com_tokens` |
| `foco` | `array` | `["tipografia", "cores", "layout", "responsividade", "componentes", "interacoes", "acessibilidade"]` |
| `nivel_detalhe` | `enum` | `alto` (valores exatos), `medio` (faixas/padrões), `baixo` (diretrizes) |
| `saida` | `string` | Arquivo `.md` com especificações extraídas |
| `tokens_extraidos` | `object` | (Opcional) JSON/YAML de design tokens para integração |

---

## 🧩 Framework de Extração (Pontos-Chave)

### 1. 🏗️ Estrutura & Layout
- Sistema de grid (colunas, gutters, container width)
- Modelo de layout (Flexbox, CSS Grid, Float, Absolute/Relative)
- Hierarquia de seções (Header, Hero, Nav, Main, Sidebar, Footer)
- Alinhamento e distribuição de elementos

### 2. 🔤 Tipografia
- Famílias de fonte (serif, sans-serif, mono, display)
- Escala tipográfica (H1–H6, body, caption, overline, button)
- Propriedades: `font-size`, `font-weight`, `line-height`, `letter-spacing`, `text-transform`
- Hierarquia visual e contraste de pesos

### 3. 🎨 Paleta de Cores
- Cores primárias, secundárias, neutras, de destaque
- Estados: `default`, `hover`, `active`, `disabled`, `focus`, `error`, `success`
- Gradientes, transparências, overlays
- Contraste WCAG (AA/AAA) quando aplicável

### 4. 📐 Espaçamento & Dimensionamento
- Sistema de espaçamento (ex: 4px/8px base)
- Margens, paddings, gaps entre componentes
- Bordas: `border-radius`, `border-width`, `border-style`
- Sombras (`box-shadow`), blurs, profundidade z-index

### 5. 🧩 Componentes & Padrões
- Botões, inputs, selects, checkboxes, radios
- Cards, modais, tooltips, dropdowns, navbars
- Tabelas, listas, badges, tags, avatares
- Estados variantes e composições

### 6. 📱 Responsividade & Breakpoints
- Pontos de interrupção (mobile, tablet, desktop, wide)
- Comportamentos adaptativos (stack, hide, resize, reorder)
- Unidades responsivas (`rem`, `vw`, `clamp`, `fr`)
- Imagens/media adaptativas (`srcset`, `object-fit`)

### 7. ⚡ Interações & Animações
- Transições (`transition`, `duration`, `easing`)
- Hover/focus states, scroll behaviors, parallax
- Microinterações (loading, skeletons, success/error feedback)
- Navegação (scroll suave, âncoras, breadcrumbs, tabs)

### 8. ♿ Acessibilidade & Semântica Visual
- Contraste texto/fundo, tamanho mínimo de toque (44×44px)
- Foco visível, ordem de tabulação lógica
- Indicadores de estado não apenas por cor
- Estrutura semântica inferida (heading hierarchy, landmarks)

### 9. 📦 Assets & Mídia
- Formato de imagens (WebP, AVIF, SVG, PNG, JPG)
- Bibliotecas de ícones (FontAwesome, Lucide, Material, custom SVG)
- Favicons, logos, illustrations, videos/embeds
- Estratégia de lazy loading e otimização

### 10. 🛠️ Pistas Técnicas & Design Tokens
- Framework/CSS hint (Tailwind, Bootstrap, Chakra, custom)
- Convenção de nomes (BEM, utility-first, CSS variables)
- Tokens extraídos em formato compatível (`--color-primary`, `$spacing-md`, etc.)
- Notas de implementação e recomendações de stack

---

## 📄 Template de Saída (.md)
> ⚠️ Este é o esqueleto exato que a skill preencherá. Mantenha a estrutura ao gerar.

```markdown
# 🎨 Especificação de Design: [NOME_DO_SITE_OR_APP]
> Extraído em: {data} | Fonte: {url/imagem} | Modo: {modo}

## 🏗️ 1. Estrutura & Layout
| Elemento | Tipo de Grid | Container | Alinhamento | Notas |
|----------|--------------|-----------|-------------|-------|
| Header   |              |           |             |       |
| Hero     |              |           |             |       |
| Main     |              |           |             |       |
| Footer   |              |           |             |       |

## 🔤 2. Tipografia
| Token | Família | Tamanho | Peso | Altura | Espaçamento | Uso |
|-------|---------|---------|------|--------|-------------|-----|
| `h1`  |         |         |      |        |             |     |
| `h2`  |         |         |      |        |             |     |
| `body`|         |         |      |        |             |     |
| `caption` |     |         |      |        |             |     |

## 🎨 3. Paleta de Cores
| Token | Hex / RGBA | Uso | Estado |
|-------|------------|-----|--------|
| `--color-primary` | | | default |
| `--color-secondary` | | | |
| `--color-bg` | | | |
| `--color-text` | | | |
| `--color-success` | | | |
| `--color-error` | | | |

## 📐 4. Espaçamento & Dimensionamento
- Base unit: `{ex: 4px ou 8px}`
- Paddings: `{ex: sm: 8px, md: 16px, lg: 24px, xl: 32px}`
- Margens/Gaps: `{especificar padrão ou sistema}`
- Border Radius: `{ex: 4px, 8px, full, 16px}`
- Sombras: `{ex: shadow-sm: 0 1px 2px rgba(0,0,0,0.05)}`

## 🧩 5. Componentes Mapeados
### 🔹 Botões
| Variante | Padding | Radius | Cor (bg/text) | Hover | States |
|----------|---------|--------|---------------|-------|--------|
| Primary  |         |        |               |       |        |
| Outline  |         |        |               |       |        |

### 🔹 Inputs & Formulários
- Estilo base, bordas, focus ring, validação visual, placeholders
- (Detalhar conforme extraído)

### 🔹 Cards / Modais / Navbars
- Estrutura, espaçamento interno, comportamentos, sobreposição

## 📱 6. Responsividade & Breakpoints
| Breakpoint | Largura | Comportamento Principal |
|------------|---------|-------------------------|
| `xs`       | ≤576px  |                         |
| `sm`       | 577–768px|                        |
| `md`       | 769–992px|                        |
| `lg`       | 993–1200px|                       |
| `xl`       | ≥1201px |                         |

## ⚡ 7. Interações & Animações
| Elemento | Tipo | Duração | Easing | Gatilho |
|----------|------|---------|--------|---------|
| Botões   | transition | {ex: 200ms} | ease-out | hover/focus |
| Modal    | transform + opacity | {ex: 300ms} | cubic-bezier(...) | open/close |
| Scroll   | smooth | - | - | anchor link |

## ♿ 8. Acessibilidade & Semântica
- Contraste mínimo verificado: `{AA/AAA/Não verificado}`
- Estados visíveis sem dependência de cor: `{Sim/Não/Parcial}`
- Foco visível presente: `{Sim/Não}`
- Hierarquia de headings respeitada: `{Sim/Não}`

## 📦 9. Assets & Mídia
| Tipo | Formato | Biblioteca/Origem | Estratégia de Carregamento |
|------|---------|-------------------|----------------------------|
| Ícones | SVG/Font | {ex: Lucide, Heroicons, custom} | Inline/Sprite |
| Imagens | {WebP/AVIF/etc} | {ex: Unsplash, CDN próprio} | Lazy, srcset, object-fit |
| Logo | SVG/PNG | {path ou descrição} | Inline/External |

## 🛠️ 10. Pistas Técnicas & Design Tokens
- Framework/CSS inferido: `{ex: Tailwind v3, Bootstrap 5, CSS Variables custom}`
- Convenção de nomes: `{ex: utility-first, BEM, semântico}`
- Tokens sugeridos (CSS/JSON):
  ```css
  :root {
    --color-primary: #hex;
    --spacing-md: 1rem;
    --radius-lg: 0.5rem;
    --font-body: "Inter", system-ui, sans-serif;
  }