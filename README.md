<p align="center">
  <img src="https://github.com/user-attachments/assets/d8732d1e-08dc-4dde-858e-4d09aeb13461" alt="ApiLogo Banner" width="700px" />
</p>

## Desafio
Desenvolvimento de Sistema WEB para manipulação e gerenciamento de dados espaciais

Descrição: Este desafio demanda a implementação de um sistema web que utiliza ferramentas que possibilitem a visualização, edição geoespacial e a análise de dados em tempo real contribui para uma melhoria nos resultados produzidos pelos
modelos automáticos, garantindo melhores resultados utilizados pelo cliente final. Desta forma, a aplicação deve possibilitar a interação usuários: administrador, analista e consultor. O usuário analista deverá ter acesso a uma lista de talhões agrícolas (informações geoespaciais e alfa-numéricas), mapa de um determinado problema evidenciado nestes talhões (informações geoespaciais e alfa-numéricas), ferramentas para visualização de imagens por protocolo OGC, ferramentas para edição vetorial e atualização em banco. Já o usuário consultor, irá adicionar os dados a serem editados pelo usuário analista e terá acesso a um dashboard que mostrará evidências quantitativas e qualitativos da evolução das atividades dos usuários analistas. Já o usuário administrador, terá as todas as funções desenvolvidas e necessárias no sistema aqui proposto, que são: cadastro de usuários, de áreas, acesse a aplicação Web e os dashboards.  

## Prazos 

| Sprints           | Início   | Fim     |
|-------------------|----------|---------|
| Kick-off geral    | 24/02    | 28/02   |
| Sprint 1          | 10/03    | 30/03   |
| Sprint 2          | 07/04    | 27/04   |
| Sprint 3          | 05/05    | 25/05   |
| Feira de Soluções | 29/05    |         |

### 📆 Planejamento das Sprints

[Board com as priorizações](https://github.com/users/MarcyLeite/projects/8)

### Como instalar o projeto
Siga as instruções do Contribuiting

[Contribuiting](https://github.com/MarcyLeite/fatec-api-4/blob/main/.github/CONTRIBUING.md)

# Requisitos não funcionais
<ul>
  <li>Fornecer visualização de imagens tiradas de satélites</li>
  <li>Dashboards com os dados dos mapas disponibilizados</li>
  <li>Utilizar softwares livres</li>
  <li>Manual de Usuário</li>
  <li>Guia de Instalação</li>
  <li>Java (linguagem de programação, frameworks e APIs)</li>
  <li>Documentação API</li>
  <li>Modelagem de Banco de dados</li>
  <li>Deve ser uma aplicação web</li>
</ul>

# Requisitos Funcionais
<ul>
  <li>Inserção de três tipos de usuários: administrador, analista e consultor</li>
  <li>Registro e edição de mapas</li>
  <li>O Cadastro de geometria via upload de arquivo .geojson</li>
  <li>O Dashboards com informações a partir de filtros dos dados e destacar no mapa as áreas resultantes</li>
  <li>Edição de mapas em tempo real</li>
</ul>

# Backlog

| N°  | Sprint   | User Story                                                                                                                                                                                                 | Prioridade | Status |
|-----|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|--------|
| 1   | Sprint 1 | Como um administrador ou consultor, eu quero cadastrar novas fazendas, para que eu possa associar talhões a essas fazendas e iniciar os processos de análise.                                               | Alta       |   Em progresso     |
| 2   | Sprint 1 | Como um usuário do TerraVision (administrador, consultor ou analista), eu quero uma tela para visualizar os talhões de uma fazenda em mapa, para que eu possa ter uma visão detalhada das áreas cadastradas. | Alta       |    Em progresso    |
| 3   | Sprint 1 | Como um usuário do TerraVision (administrador, consultor ou analista), eu quero uma tela de visualização dos talhões em lista, para que eu possa ter uma visão detalhada das áreas cadastradas.             | Média      |  Em progresso      |
| 4   | Sprint 1 | Como um usuário do TerraVision (administrador, consultor ou analista), eu quero visualizar as fazendas em lista, para que eu possa ter uma visão detalhada das áreas cadastradas.                           | Média      |    Em progresso    |
| 5   | Sprint 1 | Como um administrador ou consultor, eu quero cadastrar novos talhões associados a uma fazenda, para que essas áreas possam ser incluídas nas análises e monitoramentos.                                      | Alta       |  Em progresso      |
| 6   | Sprint 2 | Como um analista, eu quero analisar, aprovar ou reprovar os talhões dos mapas, para que eu possa garantir a precisão e a qualidade das informações no sistema.                                              | Alta       |   À fazer     |
| 7   | Sprint 2 | Como um analista, eu quero editar a geometria de um talhão, para que eu possa corrigir erros ou ajustar informações geradas pela IA e garantir a precisão dos dados no sistema.                              | Média      |   À fazer     |
| 8   | Sprint 2 | Como um consultor, eu quero editar as informações de um talhão, para que eu possa corrigir erros e garantir a precisão dos dados no sistema.                                                                | Média      |   À fazer     |
| 9   | Sprint 2 | Como um consultor, eu quero editar as informações de uma fazenda, para que eu possa corrigir erros e garantir a precisão dos dados no sistema.                                                              | Média      |   À fazer     |
| 10  | Sprint 2 | Como administrador, eu quero cadastrar novos usuários, para que eu possa atribuir funções (administrador, consultor ou analista) e garantir que cada usuário tenha acesso às funcionalidades correspondentes. | Baixa      |   À fazer     |
| 11  | Sprint 3 | Como um administrador ou consultor, eu quero acessar dashboards de produção dos analistas, para que eu possa acompanhar o desempenho da equipe e a qualidade das análises.                                  | Baixa      |    À fazer    |
| 12  | Sprint 3 | Como um usuário do TerraVision (administrador, consultor ou analista), eu quero realizar login no sistema, para que eu possa acessar as funcionalidades correspondentes à minha função de forma segura.     | Média      |   À fazer     |


## Tecnologias, Linguagens e Ferramentas usadas

![Tecnologias e Ferramentas utilizadas](https://github.com/user-attachments/assets/958df917-026a-4198-9b36-c8de3cd69e1b)


## Design das Telas

[Design das Telas](https://github.com/user-attachments/files/19172676/Visualizacao.administrador.pdf)


## Modelo Conceitual

![ModeloBando API - 4](https://github.com/user-attachments/assets/c33f3a1f-9ab2-4e6e-89aa-3d8b9010e575)


## Equipe

| Integrante                                                                                                                             | LinkedIn                                                                                                                                                                |
| -------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Yan Yamim ![Static Badge](https://img.shields.io/badge/Product_owner-blue) ![Static Badge](https://img.shields.io/badge/Dev-black)   | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/yan-yamim-185220278/)                  |
| Matheus Marciano ![Static Badge](https://img.shields.io/badge/Scrum_master-pink) ![Static Badge](https://img.shields.io/badge/Dev-black) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/matheus-marciano-leite/)                |
| Maria Clara Santos ![Static Badge](https://img.shields.io/badge/Dev-black)                                                    | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/c137santos/) |
| Pedro Henrique Lopes de Souza ![Static Badge](https://img.shields.io/badge/Dev-black)                                                  | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/pelopes7/)                    |
| Marília Borgo ![Static Badge](https://img.shields.io/badge/Dev-black)                                                          | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mariliaborgo/)           |
