# Contribuindo com Terravision

Obrigado por contribuir com Terravision!

## 👨‍💻 Development Environment

Nessa seção, descrevemos detalhes do ambiente de desenvolvimento e como preparar sua maquina para começar a codificar.

### ⚙️ Setup (Docker)

Esse repositório fornece um ambiente (Docker)[https://www.docker.com/] para rodar o projeto sem instalar as dependencias diretamente na sua maquina.

#### Dependências

- (Docker)[https://www.docker.com/]

#### Passos

1. Instalação das (Dependências)[#Dependências];
2. Executar `./scripts/dev-up.sh` para subir o ambiente de desenvolvimento;
3. Conectar com o container via (VSCode)[https://code.visualstudio.com/docs/devcontainers/attach-container];

Caso queira conectar via terminal, executar `./scripts/connect.sh`.

### Pull requests

Titulo do pull request deve seguir [FEAT | BUG] `descrição curta da mudança`.

Pull requests devem incluir:
- Descrição do que foi alterado;
- Referencia as issues relacionadas seguindo (vinculando a Pull Request com uma Issue usando palavra chave)[https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword];
- Commits seguindo a [padronização de commits](./commit-convention.md) do projeto.
