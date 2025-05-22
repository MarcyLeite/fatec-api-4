# Backlog

## Sprint 1

### Contexto (Prioridade: Média)

O TerraVision tem um time de administradores e consultores que são responsáveis por cadastrar novas fazendas para que seja possível o cadastro de talhões associados a estas. Talhões são pedaços específicos de uma fazenda que contém uma inferência de AI, que futuramente, será homologada pela equipe de analistas, podendo aprovar, reprovar ou editar as geometrias definidas pela inferência da AI.

### User Story
Como um administrador ou consultor, eu quero cadastrar novas fazendas, para que eu possa associar talhões a essas fazendas e iniciar os processos de análise.

### Critérios de aceitação:

1. Desenvolver uma tela de cadastro de novas fazendas acessível apenas para administradores e consultores.
2. Permitir que apenas administradores e consultores tenham permissão para cadastrar novas fazendas.
3. O formulário de cadastro deve incluir os seguintes campos obrigatórios:
    - Nome da fazenda: Campo de texto para o nome da fazenda.
    - Cultura: Campo de texto para o tipo de cultura cultivada.
    - Produtividade por ano: Campo numérico para a produtividade anual.
    - Área: Campo numérico para a área total da fazenda.
    - Tipo de solo: Campo de texto para o tipo de solo predominante.
    - Cidade: Campo de texto para a cidade onde a fazenda está localizada.
    - Estado: Campo de texto para o estado onde a fazenda está localizada.
4. O botão "Salvar" deve estar disponível para confirmar o cadastro, e o botão "Cancelar" deve permitir descartar as mudanças e retornar à listagem de fazendas.
5. A data de criação da fazenda deve ser salva automaticamente no banco de dados.

### Contexto (Prioridade: Alta)

O TerraVision possui usuários que precisam visualizar os talhões cadastrados em mapa, associados às fazendas. Essa funcionalidade é essencial para que os usuários tenham uma visão clara das condições do ambiente, das áreas demarcadas e das informações básicas, como nome, área e cultura. A visualização deve ser intuitiva, permitindo interações como zoom, navegação e seleção de talhões para consulta de detalhes específicos.

### User Story
Como um usuário do TerraVision (administrador, consultor ou analista), eu quero uma tela para visualizar os talhões de uma fazenda em mapa, para que eu possa ter uma visão detalhada das áreas cadastradas, consultar informações básicas e interagir com o mapa de forma intuitiva.

### Critérios de aceitação:
1. Desenvolver uma tela de visualização de talhões acessível apenas para usuários autorizados.
2. A tela de visualização deve exibir:
    - Mapa da fazenda: Com as coordenadas da fazenda e a geometria dos talhões associados.
    - Informações básicas da fazenda: Nome, cultura, área total e tipo de solo.
    - Lista de talhões: Com nome, área e cultura de cada talhão.
    - Permitir interação com o mapa, como:
    - Zoom: Para ampliar ou reduzir a visualização.
    - Navegação: Para mover o mapa e explorar diferentes áreas.
    - Seleção de talhões: Clicar em um talhão no mapa para exibir detalhes específicos.
3. A interface deve ser intuitiva e responsiva, garantindo uma boa experiência de uso.
4. Os dados do mapa devem ser carregados a partir das informações já cadastradas no sistema (geometrias em GeoJSON).

### Contexto (Prioridade: Média)
O TerraVision possui usuários que precisam de uma visualização geral dos talhões de forma paginada, associados às fazendas. Essa funcionalidade é essencial para que os usuários tenham uma visão descritiva dos talhões, além de informações básicas, como nome, área e cultura. A visualização deve ser intuitiva, permitindo interações como navegação entre páginas e seleção de talhões para consulta de detalhes específicos.

### User Story

Como um usuário do TerraVision (administrador, consultor ou analista), eu quero uma tela de visualização dos talhões em lista, para que eu possa ter uma visão detalhada das áreas cadastradas, consultar informações básicas e interagir com a tela de forma intuitiva.

### Critérios de aceitação:
1. Desenvolver uma tela de visualização de talhões acessível apenas para usuários autorizados.
2. A tela de visualização deve exibir:
    - Talhões paginados: Com as informações de cada talhão
    - Informações básicas dos talhões: Nome, cultura, área total e tipo de solo.
    - Lista de talhões: Com nome, área e cultura de cada talhão.
3. Permitir interação com o mapa, como:
    - Navegação: Para mover o mapa e explorar diferentes áreas.
    - Seleção de talhões: Clicar em um talhão na lista para exibir detalhes específicos.
4. A interface deve ser intuitiva e responsiva, garantindo uma boa experiência de uso.

### Contexto (Prioridade: Média)

O TerraVision possui usuários que precisam de uma visualização geral das fazendas de forma paginada. Essa funcionalidade é essencial para que os usuários tenham uma visão descritiva das fazendas, além de informações básicas, como nome, área e cultura, tipo de solo, produtividade. A visualização deve ser intuitiva, permitindo interações como navegação entre páginas e seleção de fazendas para consulta de detalhes específicos.

### User Story

Como um usuário do TerraVision (administrador, consultor ou analista), eu quero visualizar as fazendas em lista, para que eu possa ter uma visão detalhada das áreas cadastradas, consultar informações básicas e interagir com a tela de forma intuitiva.

### Critérios de aceitação:

1. Desenvolver uma tela de visualização de fazendas acessível apenas para usuários autorizados.
2. A tela de visualização deve exibir:
    - Fazendas paginados: Com as informações de cada talhão
    - Informações básicas da fazenda: Nome, cultura, área total e tipo de solo, produtividade.
    - Navegação: Para mover o mapa e explorar diferentes áreas.
    - Seleção de fazendas: Clicar em uma fazenda na lista para exibir detalhes específicos.
3. A interface deve ser intuitiva e responsiva, garantindo uma boa experiência de uso.

### Contexto (Prioridade: Alta)

O TerraVision tem um time de administradores e consultores que são responsáveis por cadastrar novos talhões associados a uma fazenda, pedaços específicos de uma fazenda que contém uma inferência de AI, para que a equipe de analistas, vão aprovar, reprovar ou editar as geometrias definidas pela inferência da AI.

### User Story

Como um administrador ou consultor, eu quero cadastrar novos talhões associados a uma fazenda, para que essas áreas possam ser incluídas nas análises e monitoramentos.

### Critérios de aceitação:

1. Desenvolver uma tela de cadastro de talhões acessível apenas para administradores e consultores.
2. Permitir que apenas administradores e consultores tenham permissão para cadastrar novos talhões.
3. O formulário de cadastro deve incluir os seguintes campos obrigatórios:
    - Fazenda associada: Campo de seleção para escolher a fazenda à qual o talhão pertence.
    - Nome do talhão: Campo de texto para o nome do talhão.
    - Cultura: Campo de texto para o tipo de cultura cultivada.
    - Área: Campo numérico para a área do talhão.
    - Tipo de solo: Campo de texto para o tipo de solo predominante.
    - Geometria: Campo para upload do arquivo GeoJSON contendo a geometria do talhão.
4. O botão "Salvar" deve estar disponível para confirmar o cadastro, e o botão "Cancelar" deve permitir descartar as mudanças e retornar à listagem de talhões.
5. A data de criação do talhão deve ser salva automaticamente no banco de dados.

## Sprint 2 

### Contexto (Prioridade: Alta)

O TerraVision tem um time de analistas que são responsáveis por analisar, aprovar ou reprovar os talhões dos mapas, essa função é de extrema importância visto que a AI muitas vezes erra suas análises, então, o analista existe para ter mais assertividade nessa pesquisa, para que sejam, futuramente, criados dashboards com os relatórios filtrados por analistas e mapas com informações sobre total de mapas concluídos, cálculo de tempo de QA e quantidade de aprovações sem edição, com edição e reprovações. Administradores também podem fazer essa função.

### User Story

Como um analista, eu quero analisar, aprovar ou reprovar os resultados dos talhões. Quando recusado poder editar a geometria do resultado, para que eu possa garantir a precisão e a qualidade das informações no sistema.

### Critérios de aceitação:
1. Desenvolver uma tela de visualização prévia do mapa para que o analista possa visualizar o talhão antes de realizar a análise.
2. Desenvolver uma tela de análise de QA acessível apenas para administradores e analistas.
3. A tela de análise deve incluir:
    - Botão de Aprovação: Para confirmar que o talhão está correto.
    - Botão de Reprovação: Para indicar que o talhão precisa de ajustes.
4. O sistema deve salvar automaticamente os metadados da análise, incluindo:
    - Tempo de duração do QA.
    - Status da análise (aprovado ou reprovado).
    - Data e hora da análise.
5. Esses metadados devem ser utilizados para alimentar os dashboards de desempenho.


### Contexto (Prioridade: Alta)

O TerraVision possui um time de consultores especializados que atuam como intermediários entre as soluções de IA da empresa e os clientes. Esses consultores são responsáveis por validar, organizar e cadastrar os resultados gerados pelas inteligências artificiais em um sistema centralizado, garantindo que os dados estejam sempre atualizados e disponíveis para análise.

### User story
Como um consultor, eu quero cadastrar novos resultados da IA, para que eu possa possibilitar o analista realizar o QA.

### Critérios de aceitação:
1. Desenvolver uma tela de cadastro de novos resultados acessível para consultores  e administradores.
2. O formulário de cadastro deve incluir os seguintes campos obrigatórios:
    - Título do resultado: Campo de texto para o título completo.
    - Nome do talhão: Campo com o nome do talhão vinculado ao resultado 
    - Nome da fazenda: Campo com o nome da fazenda vinculado ao resultado 
    - Geometria: Geometria representando o resultado do talhão
3. O botão "Salvar" deve estar disponível para confirmar o cadastro, e o botão "Cancelar" deve permitir descartar as mudanças e retornar à listagem de resultados.
4. A data de criação de resultados deve ser salva automaticamente no banco de dados.

### Contexto (Prioridade: Média)
O TerraVision tem um time de consultores que são responsáveis por editar as fazendas paginadas. Essa função é de extrema importância, pois o consultor irá garantir maior assertividade, corrigindo dados quando necessário. Administradores também podem realizar essa função.

### User Story
Como um consultor, eu quero editar as informações de uma fazenda, para que eu possa corrigir erros e garantir a precisão dos dados no sistema.


### Critérios de aceitação:
1. Desenvolver uma tela de edição de fazenda acessível apenas para consultores e administradores.
2. A tela de edição deve permitir que o usuário:
    - Visualize a fazenda a ser editado, com seus dados atuais exibidos na tela.
    - Faça ajustes nos campos de nome, área, tipo de solo, cidade e estado.
3. Incluir botões de ação na tela de edição:
    - Salvar: Para confirmar as alterações.
    - Cancelar: Para descartar as alterações e retornar à tela anterior.
4. Garantir que as alterações sejam refletidas imediatamente no sistema e disponíveis para revisão.

### Contexto (Prioridade: Baixa)

O TerraVision tem um time de administradores, que são responsáveis por criar novos usuários e definir as funções de cada um por meio do seu nível de acesso. Administradores podem executar todos os poderes do site, consultores podem cadastrar mapas, talhões, visualizar dashboards e mapas e analistas podem analisar os dados dos talhões e aprovar ou reprovar. Caso seja reprovado, poderá editar esses dados.

### User Story

Como administrador, eu quero cadastrar novos usuários, para que eu possa atribuir funções (administrador, consultor ou analista) e garantir que cada usuário tenha acesso apenas às funcionalidades correspondentes à sua função.

### Critérios de aceitação:

1. Desenvolver uma tela de cadastro de novos usuários acessível apenas para administradores.
2. Permitir que apenas administradores tenham permissão para cadastrar novos usuários.
3. O formulário de cadastro deve incluir os seguintes campos obrigatórios:
    - Nome do usuário: Campo de texto para o nome completo.
    - E-mail: Campo de texto que aceita apenas e-mails válidos e únicos no sistema.
    - Senha: Campo de texto com validação de segurança 
    - Função: Campo de seleção para definir a função do usuário (administrador, consultor ou analista).
4. O botão "Salvar" deve estar disponível para confirmar o cadastro, e o botão "Cancelar" deve permitir descartar as mudanças e retornar à listagem de usuários.
5. A data de criação do usuário deve ser salva automaticamente no banco de dados.
 
## Sprint 3 

### Contexto(Prioridade: Alta)

O TerraVision tem um time de administradores e consultores que são responsáveis por acessar os dashboards de produção dos analistas, esses dashboards terão filtro por analista, fazenda e talhão, além de relatórios do total de mapas concluídos, tempo de análise, quantidade de aprovações, quantidade de edições e percentagem de modificação.

### User story

Como um administrador ou consultor, eu quero acessar dashboards de produção dos analistas, para que eu possa acompanhar o desempenho da equipe e a qualidade das análises.

### Critérios de aceitação:

1. Desenvolver uma tela de exibição de dashboards acessível apenas para administradores e consultores.
2. O dashboard deve exibir as seguintes métricas:
    - Total de mapas concluídos: Número total de mapas analisados e finalizados.
    - Cálculo de tempo de QA: Tempo médio gasto em cada análise.
    - Quantidade de aprovações sem edição: Número de mapas aprovados sem necessidade de ajustes.
    - Quantidade de edições realizadas: Número de mapas que precisaram ser editados antes da aprovação.
    - Percentual de modificações: Percentual de mapas que foram editados em relação ao total de análises.
3. Permitir filtros para personalizar a visualização dos dados:
    - Por analista: Para visualizar o desempenho individual de cada analista.
    - Por fazenda/talhão: Para analisar o desempenho em áreas específicas.
    - Por período: Para avaliar o desempenho em um intervalo de tempo específico.
4. Os dados devem ser atualizados em tempo real com base nas análises realizadas.
5. A interface deve ser intuitiva, com gráficos e tabelas que facilitem a interpretação dos dados.
6. Deve ser possível exportar os dados do dashboard em formato CSV ou PDF para relatórios externos.

### Contexto (prioridade: Média)

O TerraVision é uma plataforma que conta com diferentes tipos de usuários (administradores, consultores e analistas), cada um com permissões e funcionalidades específicas. Para garantir a segurança e o acesso controlado ao sistema, é necessário que os usuários realizem login com credenciais válidas. Atualmente, não há uma tela de login implementada, o que impede a autenticação e a proteção adequada das informações do sistema.

### User Story
Como um usuário do TerraVision (administrador, consultor ou analista), eu quero realizar login no sistema, para que eu possa acessar a plataforma e as funcionalidades de forma segura.

### Critérios de aceitação:

1. Desenvolver uma tela de login acessível a todos os usuários.
2. A tela de login deve incluir os seguintes campos obrigatórios:
    - E-mail: Campo de texto para inserir o e-mail cadastrado.
    - Senha: Campo de texto para inserir a senha (com ocultação de caracteres).
3. Validar os dados de login:
    - Verificar se o e-mail e a senha correspondem a um usuário cadastrado.
    - Exibir mensagens de erro claras em caso de credenciais inválidas (ex: "E-mail ou senha incorretos").

### Contexto (prioridade: Média)

O TerraVision é uma plataforma que atende diferentes perfis de usuários (administradores, consultores e analistas), cada um com permissões e funcionalidades específicas. Atualmente, o sistema ainda não possui uma tela de login, o que impede a autenticação de usuários e o controle de acesso às funcionalidades. Para garantir a segurança e permitir o uso adequado dos recursos da plataforma conforme o perfil de cada usuário, é necessário implementar um mecanismo de autenticação com validação de credenciais (e-mail e senha) e atribuição das permissões correspondentes após o login.

### User Story
Como um usuário do TerraVision (administrador, consultor ou analista), eu quero acessar as funcionalidades e permissões representada pelo meu tipo de usuário.

### Critérios de aceitação:

1. Verificar se o e-mail e a senha correspondem a um usuário cadastrado.
2. Após o login bem-sucedido, determinar as permissões e funcionalidades das quais o usuário logado tem.

### Contexto (prioridade: Baixa)

O TerraVision é uma plataforma que conta com diferentes tipos de usuários (administradores, consultores e analistas), cada um com permissões e funcionalidades específicas. Para garantir a segurança e o acesso controlado ao sistema, é necessário que usuários que mudam de função ou que são desligados sejam alterados ou removidos do sistema.

### User Story
Como um administrador, eu quero editar e deletar usuários do sistema, para que tenha melhor controle dos usuários que entram e saem.

### Critérios de aceitação:
1. Desenvolver uma tela com os usuários listados, acessível a todos os administradores.
2. Deve incluir:
    - Botão de editar usuário
    - Campos para mudar, nome, email e função.
    - Opção para desativar usuário
3. O botão "Salvar" deve estar disponível para confirmar o cadastro, e o botão "Cancelar" deve permitir descartar as mudanças e retornar à listagem de usuários.
4. A data de criação do usuário deve ser salva automaticamente no banco de dados.

