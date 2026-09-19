---
name: corrigir-texto
description: >
  Ative quando o usuário pedir para corrigir, revisar ou normalizar um texto em linguagem natural.
  Correção não destrutiva: ortografia, gramática, pontuação, espaçamento, duplicações — preservando
  intenção, tom e terminologia técnica do autor.
---

# 🛠️ Skill: `Corrigir_texto`

## 📌 Descrição
Skill avançada de pós-processamento e revisão textual projetada para correção automática, consistente e não destrutiva de textos em linguagem natural. Foca na eliminação de ruídos tipográficos, ortográficos, gramaticais e estruturais, preservando a intenção, o tom e o estilo original do autor.

## 🎯 Objetivo
- Normalizar espaçamento e quebras de linha
- Corrigir erros de digitação (typos) e ortografia
- Eliminar palavras duplicadas (consecutivas ou não)
- Ajustar pontuação, crase, acentuação e concordância
- Padronizar uso de maiúsculas/minúsculas e traços/aspas
- Garantir legibilidade sem alterar voz narrativa ou terminologia técnica

## 📥 Entrada / 📤 Saída
| Campo | Tipo | Descrição |
|-------|------|-----------|
| `texto_original` | `string` | Texto bruto a ser corrigido |
| `modo` | `enum` | `padrao`, `estrito`, `minimo`, `com_relatorio` |
| `idioma` | `string` | `pt-BR` (padrão), `pt-PT`, `en`, `es`, etc. |
| `preservar` | `array` | Lista de padrões a ignorar (ex: `["@urls", "@emails", "@codigo", "@nomes"]`) |
| `saida` | `string` | Texto corrigido |
| `relatorio_alteracoes` | `object` | (Opcional) Lista de mudanças aplicadas, categoria e justificativa |

---

## 📜 Diretrizes de Processamento (Regras de Ouro)
1. **Preservação de Intenção**: Nunca reescreva para mudar opinião, tom ou estilo do autor.
2. **Não Destrutividade**: Mantenha estrutura original (parágrafos, listas, citações, markdown).
3. **Contexto Primeiro**: Use o contexto da frase para decidir entre homônimos, regências ou concordância.
4. **Transparência**: Em `modo: com_relatorio`, documente cada alteração com categoria e motivo.
5. **Fallback Seguro**: Em caso de ambiguidade crítica, mantenha o original e sinalize com `[?]` ou nota no relatório.
6. **Performance**: Aplicar regras em ordem de impacto crescente (espaçamento → digitação → ortografia → gramática → estilo).

---

## 🔍 Categorias de Correção

### 1. Espaçamento e Formatação
- Substituir múltiplos espaços por um único espaço
- Remover espaços antes de `.,;:!?)]}` e após `([{`
- Normalizar quebras de linha excessivas (`\n\n\n` → `\n\n`)
- Corrigir tabulações inconsistentes por espaços ou indentação padrão

### 2. Ortografia e Digitação
- Corrigir transposições (`aovés` → `através`)
- Ajustar acentuação e cedilha (`voce` → `você`, `porem` → `porém`)
- Corrigir digitação por proximidade de teclas (`suaa` → `sua`, `muinto` → `muito`)
- Validar hífens conforme Novo Acordo Ortográfico

### 3. Gramática e Concordância
- Verificar concordância nominal e verbal básica
- Ajustar regência de verbos e preposições comuns
- Corrigir uso de `há/a`, `mal/mau`, `aonde/onde`, `que/quê`
- Padronizar tratamento de pronomes oblíquos e colocação pronominal (respeitando variante regional solicitada)

### 4. Pontuação e Tipografia
- Inserir vírgulas em enumerações, apostos e orações intercaladas
- Ajustar aspas (`"..."` → `“...”` ou `'...'` conforme padrão)
- Padronizar uso de travessão (`—`) vs hífen (`-`)
- Corrigir pontos finais ausentes em fechamento de parágrafos

### 5. Redundância e Duplicação
- Remover palavras repetidas consecutivas (`o o`, `de de`)
- Eliminar pleonasmos viciosos (`subir para cima`, `planejar antecipadamente`)
- Unificar sinônimos repetidos desnecessariamente no mesmo contexto

### 6. Padronização e Consistência
- Padronizar datas, horas, números e unidades de medida
- Uniformizar uso de siglas (primeira ocorrência por extenso, depois sigla)
- Verificar consistência de tratamento (você/tu, brasileiro/português)

---

## 💡 Exemplos Práticos

### 🔹 Exemplo 1: Espaçamento + Digitação + Duplicação
**Entrada:**  
`O  projeto  foi  entregue  atrasado   porque  o  desenvolvedor  esqueceu  de  testar  o  sistema  o  sistema  antes  da  entrega.`

**Saída (`modo: padrao`):**  
`O projeto foi entregue atrasado porque o desenvolvedor esqueceu de testar o sistema antes da entrega.`

### 🔹 Exemplo 2: Pontuação + Ortografia + Concordância
**Entrada:**  
`ela não foi ao encontro pois estava doente , mas disse  que  ira  participar  da  proxima  vez .`

**Saída (`modo: padrao`):**  
`Ela não foi ao encontro, pois estava doente, mas disse que irá participar da próxima vez.`

### 🔹 Exemplo 3: Modo `com_relatorio`
**Entrada:**  
`nos  vamos  ver  ver  o  relatorio  amanha  de  manha .`

**Saída:**  
```json
{
  "texto_corrigido": "Nós vamos ver o relatório amanhã de manhã.",
  "relatorio_alteracoes": [
    {"original": "nos  vamos", "corrigido": "Nós vamos", "categoria": "Espaçamento/Ortografia", "motivo": "Espaço duplo removido e letra maiúscula no início da frase"},
    {"original": "ver  ver", "corrigido": "ver", "categoria": "Duplicação", "motivo": "Palavra repetida consecutiva removida"},
    {"original": "relatorio", "corrigido": "relatório", "categoria": "Ortografia", "motivo": "Acentuação corrigida"},
    {"original": "amanha  de  manha", "corrigido": "amanhã de manhã", "categoria": "Ortografia", "motivo": "Til adicionado conforme norma"}
  ]
}