# Ambiente de desenvolvimento — FLY

Este projeto usa um conjunto de **skills de IA** (Claude Code / agentes) versionadas
junto com o código, mais duas ferramentas globais. Quem clonar o repositório
consegue reproduzir o mesmo ambiente em poucos minutos.

## 1. Skills do projeto (já no repositório)

As skills ficam em [`.claude/skills/`](../.claude/skills/) e são **commitadas no git** —
não precisa instalar nada. Ao abrir o repo no Claude Code elas ficam disponíveis
automaticamente. São 28 skills relevantes para uma loja Next.js:

| Categoria | Skills |
|-----------|--------|
| Next.js / React | `nextjs-app-router-patterns`, `nextjs-best-practices`, `react-best-practices`, `frontend-developer`, `frontend-design` |
| Estilo / UI | `ui-ux-pro-max`, `shadcn`, `tailwind-patterns`, `ui-styling`, `design`, `design-system` |
| Comércio / pagamentos | `stripe-integration`, `paypal-integration`, `plaid-fintech`, `monetization`, `algolia-search`, `hubspot-integration` |
| Conversão / SEO | `form-cro`, `seo-audit` |
| Visual / experiência | `high-end-visual-design`, `3d-web-experience`, `scroll-experience`, `interactive-portfolio`, `mobile-design`, `canvas-design`, `banner-design`, `brand`, `slides` |

> Origem: [`ui-ux-pro-max-skill`](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
> e bundles selecionados de [`antigravity-awesome-skills`](https://github.com/sickn33/antigravity-awesome-skills)
> (web-app-builder, product-design-studio, commerce-payments).

## 2. Ferramentas globais (instalar 1x por máquina)

`rtk` e `gsd` **não** dá para versionar dentro do repo (um é binário, o outro
instala hooks/agents globais). Rode o script de setup uma vez:

```powershell
# Windows
pwsh ./scripts/setup-dev.ps1
```

```bash
# macOS / Linux / WSL
./scripts/setup-dev.sh
```

O script instala:

- **rtk** — [Rust Token Killer](https://github.com/rtk-ai/rtk): proxy de CLI que
  economiza 60–90% de tokens em operações de dev. No Windows nativo roda em modo
  limitado (injeção via CLAUDE.md); para suporte completo de hooks use **WSL**.
- **gsd** — [Get Shit Done](https://github.com/gsd-build/get-shit-done) (instalado
  via pacote oficial `get-shit-done-cc`, perfil `standard`): workflow de
  planejamento e execução por fases. Comandos `/gsd-*` no Claude Code.

Depois de rodar, **reinicie o Claude Code**.

## 3. Referência

- [`awesome-claude-code`](https://github.com/hesreallyhim/awesome-claude-code) —
  lista curada de recursos para Claude Code (não é instalável; consulte
  `THE_RESOURCES_TABLE.csv` no repositório original).

## Resumo para quem acabou de clonar

```bash
git clone <repo> && cd FLY
npm install
pwsh ./scripts/setup-dev.ps1   # ou ./scripts/setup-dev.sh
# reinicie o Claude Code
```
