# Sprint Backlog

### Requisitos Funcionais

[1] Três tipos de usuários: administrador, analista e consultor.  
[2] O Analista irá visualizar informações da área, aprovar ou não a área cadastrada no sistema. Caso a área não seja aprovada, poderá editá-la e atualizá-la no banco.  
[3] O Consultor terá acesso aos dashboards, mapa e poderá fazer o cadastro de área no sistema.  
[4] O Administrador poderá realizar as mesmas funções que o Consultor e o Analista, além do cadastro de usuários.  
[5] Cadastro de geometria via upload de arquivo .geojson.  
[6] Para o cadastro deve ser informado: nome da fazenda, cultura (ex: soja, milho...), produtividade por ano, área, tipo de solo, cidade e estado.  
[7] Dashboards deverão apresentar informações a partir de filtros dos dados e destacar no mapa as áreas resultantes.

### Definition of Done (DoD)
- ✅ PR testado (automática e manualmente) antes do merge.
- ✅ Cobertura de testes automatizados adequada (unitários e/ou de integração).
- ✅ Código versionado e integrado ao repositório principal sem conflitos.
- ✅ Funcionalidade validada com base nos critérios de aceitação.
- ✅ Testado em ambiente que simula produção (ex: staging ou homologação).
- ✅ Integrações com bibliotecas externas (Java/JS) documentadas ou exemplificadas.
- ✅ Sem débitos técnicos ou tarefas parciais pendentes.
- ✅ Documentação (técnica ou de uso) atualizada, se aplicável.
- ✅ Deploy disponível para validação do cliente, caso necessário.

### Definition of Ready (DoR)
- ✅ User Story validada e compreendida por todo o time técnico.
- ✅ Wireframes definidos e disponíveis, quando aplicável.
- ✅ Critérios de aceitação claros e objetivos estão documentados.
- ✅ Requisitos técnicos e de negócio alinhados com o cliente.
- ✅ Dependências externas identificadas e resolvidas (sem bloqueios).
- ✅ Estimativa de esforço registrada pelo time.
- ✅ Dados de exemplo ou mocks definidos, se necessário.
- ✅ Reunião de refinamento realizada com participação do time e aprovação do cliente.

## ✅ Sprint 1 – Finalizada

| ID   | User Story                                                                 | Prioridade | Status        | Backlog Completo | DoR Atendido | DoD Atendido | Requisito Referenciado                                                                                   |
|------|----------------------------------------------------------------------------|------------|---------------|------------------|--------------|--------------|-----------------------------------------------------------------------------------------------------------|
| S1-1 | Como administrador ou consultor, quero cadastrar novas fazendas           | Média      | Concluída ✅   | ✅                | ✅            | ✅            | [3] O Consultor poderá fazer o cadastro de área no sistema.                                              |
| S1-2 | Como usuário, quero visualizar os talhões em um mapa com interações       | Alta       | Concluída ✅   | ✅                | ✅            | ✅            | [7] Dashboards deverão apresentar informações e destacar no mapa as áreas resultantes.                   |
| S1-3 | Como usuário, quero visualizar os talhões em lista paginada               | Média      | Concluída ✅   | ✅                | ✅            | ✅            | [2] O Analista irá visualizar informações da área.                                                       |
| S1-4 | Como usuário, quero visualizar fazendas em lista paginada                 | Média      | Concluída ✅   | ✅                | ✅            | ✅            | [6] Para o cadastro deve ser informado: nome da fazenda, cultura, produtividade, etc.                    |
| S1-5 | Como administrador ou consultor, quero cadastrar novos talhões            | Alta       | Concluída ✅   | ✅                | ✅            | ✅            | [6] Para o cadastro deve ser informado: nome da fazenda, cultura, produtividade, etc.                    |

---

## ✅ Sprint 2 – Finalizada

| ID   | User Story                                                                 | Prioridade | Status        | Backlog Completo | DoR Atendido | DoD Atendido | Requisito Referenciado                                                                                   |
|------|----------------------------------------------------------------------------|------------|---------------|------------------|--------------|--------------|-----------------------------------------------------------------------------------------------------------|
| S2-1 | Como analista, quero aprovar ou reprovar talhões com edição de geometrias | Alta       | Concluída ✅   | ✅                | ✅            | ✅            | [2] O Analista irá aprovar ou não a área, podendo editá-la se necessário.                                |
| S2-2 | Como consultor, quero cadastrar novos resultados da IA                     | Alta       | Concluída ✅   | ✅                | ✅            | ✅            | [3] O Consultor poderá fazer o cadastro de área no sistema.                                              |
| S2-3 | Como consultor, quero editar informações da fazenda                        | Média      | Concluída ✅   | ✅                | ✅            | ✅            | [6] Para o cadastro deve ser informado: nome da fazenda, cultura, produtividade, etc.                    |
| S2-4 | Como administrador, quero cadastrar novos usuários                         | Baixa      | Concluída ✅   | ✅                | ✅            | ✅            | [4] O Administrador poderá realizar o cadastro de usuários.                                              |


---

## 🚀 Sprint 3 – Planejada

| ID   | User Story                                                                  | Prioridade | Status     | Backlog Completo | DoR Atendido | DoD Atendido | Requisito Referenciado                                                                                   |
|------|-----------------------------------------------------------------------------|------------|------------|------------------|--------------|--------------|-----------------------------------------------------------------------------------------------------------|
| S3-1 | Como usuário, quero fazer upload de arquivo .geojson                       | Alta       | Planejada  | ✅                | ✅            | ❌            | [5] Cadastro de geometria via upload de arquivo .geojson.                                                |
| S3-2 | Como usuário, quero informar cultura, produtividade e tipo de solo         | Alta       | Planejada  | ✅                | ✅            | ❌            | [6] Para o cadastro deve ser informado: nome da fazenda, cultura, produtividade, tipo de solo, etc.     |
| S3-3 | Como consultor ou administrador, quero visualizar dashboards com filtros   | Alta       | Planejada  | ✅                | ✅            | ❌            | [7] Dashboards deverão apresentar informações a partir de filtros e destacar áreas no mapa.              |
| S3-4 | Como consultor, quero filtrar dados no dashboard por cultura e produtividade | Média    | Planejada  | ✅                | ✅            | ❌            | [7] Dashboards deverão apresentar informações a partir de filtros e destacar áreas no mapa.              |



## 📌 Legenda de Status

- ✅ Concluída
- 🔄 Iniciada / Em progresso
- 🚀 Planejada (ainda não iniciada)
- ❌ Não concluída

## 📌 Legenda de Backlog Completo

- ✅ A história faz parte do Product Backlog oficial
