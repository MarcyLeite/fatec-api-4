# Sprint Backlog

### Requisitos Funcionais

[1] Três tipos de usuários: administrador, analista e consultor.  
[2] O Analista irá visualizar informações da área, aprovar ou não a área cadastrada no sistema. Caso a área não seja aprovada, poderá editá-la e atualizá-la no banco.  
[3] O Consultor terá acesso aos dashboards, mapa e poderá fazer o cadastro de área no sistema.  
[4] O Administrador poderá realizar as mesmas funções que o Consultor e o Analista, além do cadastro de usuários.  
[5] Cadastro de geometria via upload de arquivo .geojson.  
[6] Para o cadastro deve ser informado: nome da fazenda, cultura (ex: soja, milho...), produtividade por ano, área, tipo de solo, cidade e estado.  
[7] Dashboards deverão apresentar informações a partir de filtros dos dados e destacar no mapa as áreas resultantes.


## ✅ Sprint 1 – Finalizada

| ID   | User Story | Prioridade | Status | Backlog Completo | Requisito Referenciado |
|------|------------|------------|--------|------------------|-------------------------|
| S1-1 | Como administrador ou consultor, quero cadastrar novas fazendas para associar talhões. | Média | Concluída ✅ | ✅ | [3] Consultor pode cadastrar área |
| S1-2 | Como usuário, quero visualizar os talhões em um mapa com interações intuitivas. | Alta | Concluída ✅ | ✅ | [7] Destaque das áreas no mapa |
| S1-3 | Como usuário, quero visualizar os talhões em lista paginada com informações básicas. | Média | Concluída ✅ | ✅ | [2] Analista visualiza informações da área |
| S1-4 | Como usuário, quero visualizar fazendas em lista paginada com informações básicas. | Média | Concluída ✅ | ✅ | [6] Informações do cadastro |
| S1-5 | Como administrador ou consultor, quero cadastrar novos talhões associados a uma fazenda. | Alta | Concluída ✅ | ✅ | [6] Informações do cadastro |



---

## 🔄 Sprint 2 – Em andamento

| ID   | User Story | Prioridade | Status | Backlog Completo | Requisito Referenciado |
|------|------------|------------|--------|------------------|-------------------------|
| S2-1 | Como analista, quero aprovar ou reprovar talhões, podendo editar geometrias se necessário. | Alta | Em progresso 🔄 | ✅ | [2] Aprovação/reprovação da área |
| S2-2 | Como consultor, quero cadastrar novos resultados da IA para posterior análise. | Alta | Iniciada 🔄 | ✅ | [3] Consultor cadastra dados |
| S2-3 | Como consultor, quero editar informações da fazenda para garantir precisão dos dados. | Média | Iniciada 🔄 | ✅ | [6] Editar dados do cadastro |
| S2-4 | Como administrador, quero cadastrar novos usuários e atribuir suas funções. | Baixa | Iniciada 🔄 | ✅ | [4] Cadastro de usuários |

---

## 🚀 Sprint 3 – Planejada

| ID   | User Story | Prioridade | Status | Backlog Completo | Requisito Referenciado |
|------|------------|------------|--------|------------------|-------------------------|
| S3-1 | Como usuário, quero fazer upload de arquivo .geojson para cadastrar a geometria da área. | Alta | Planejada | ✅ | [5] Upload de arquivo geojson |
| S3-2 | Como usuário, quero informar cultura, produtividade por ano e tipo de solo ao cadastrar uma fazenda. | Alta | Planejada | ✅ | [6] Dados obrigatórios no cadastro |
| S3-3 | Como consultor ou administrador, quero visualizar dashboards com filtros e mapa com áreas destacadas. | Alta | Planejada | ✅ | [7] Dashboards com filtros e mapa |
| S3-4 | Como consultor, quero filtrar dados no dashboard por cultura e produtividade. | Média | Planejada | ✅ | [7] Dashboards com filtros |


## 📌 Legenda de Status

- ✅ Concluída
- 🔄 Iniciada / Em progresso
- 🚀 Planejada (ainda não iniciada)

## 📌 Legenda de Backlog Completo

- ✅ A história faz parte do Product Backlog oficial
