# Fly - Loja de Roupa

Este é o repositório principal da loja de roupa **Fly**. 

## Desenvolvimento

Este projeto está configurado com Git e foi inicializado com **Next.js** para oferecer uma experiência de loja muito rápida e com visual premium.

A arquitetura prevê integração Headless com Yampi/Montink para gerenciamento de produtos e pagamentos.

### Como rodar o projeto localmente:

1. Instale as dependências (se não estiverem instaladas):
   ```bash
   npm install
   ```

2. Rode o servidor de desenvolvimento:
   ```bash
   npm run dev
   ```

3. Abra [http://localhost:3000](http://localhost:3000) no seu navegador para ver o resultado.

### Ambiente de IA (Claude Code)

Este repo inclui skills de IA versionadas em [`.claude/skills/`](.claude/skills/) (Next.js, React,
shadcn, Tailwind, Stripe/PayPal, design) — disponíveis automaticamente no Claude Code, sem instalar nada.

Para as ferramentas globais (`rtk`, `gsd`), rode uma vez após clonar:

```bash
pwsh ./scripts/setup-dev.ps1   # Windows
./scripts/setup-dev.sh         # macOS / Linux / WSL
```

Detalhes em [`docs/DEV-SETUP.md`](docs/DEV-SETUP.md).

### Próximos Passos
1. Desenvolver o UI base (Home, Lista de Produtos) usando CSS puro (Vanilla) com design Premium.
2. Integrar API para listar produtos.
