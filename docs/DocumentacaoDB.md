# Modelo Descritivo do Banco de Dados

## Entidade: `fazenda`

Representa uma fazenda cadastrada no sistema, com dados como localização, tipo de solo, cultura e produtividade anual.

**Campos**:
- `id`: *Integer*  
  Identificador único da fazenda. **(PK)**

- `faz_area`: *Decimal ou Float*  
  Área total da fazenda em hectares.

- `faz_prod_anual`: *Decimal ou Float*  
  Produtividade anual da fazenda.

- `cid_id`: *Integer*  
  Referência para a cidade onde está localizada a fazenda. **(FK)**

- `faz_nome`: *String*  
  Nome da fazenda.

- `faz_tipo_solo`: *String*  
  Tipo de solo predominante na fazenda.

---

## Entidade: `cidade`

Representa uma cidade cadastrada no sistema.

**Campos**:
- `id`: *Integer*  
  Identificador único da cidade. **(PK)**

- `est_id`: *Integer*  
  Referência para o estado ao qual a cidade pertence. **(FK)**

- `cid_nome`: *String*  
  Nome da cidade.

---

## Entidade: `estado`

Contém os dados dos estados.

**Campos**:
- `id`: *Integer*  
  Identificador único do estado. **(PK)**

- `est_nome`: *String*  
  Nome do estado.

- `est_sigla`: *String*  
  Sigla do estado (ex: SP, RJ, MG).

---

## Entidade: `talhao`

Representa um talhão agrícola vinculado a uma fazenda.

**Campos**:
- `id`: *Integer*  
  Identificador único do talhão. **(PK)**

- `tal_area`: *Decimal ou Float*  
  Área do talhão em hectares.

- `faz_id`: *Integer*  
  Referência à fazenda associada. **(FK)**

- `tal_cultura`: *String*  
  Cultura cultivada no talhão.

- `tal_nome`: *String*  
  Nome do talhão.

- `rel_shape`: *Geometry (GeoJson)*  
  Forma geográfica do talhão.

---

## Entidade: `mtm_missoes_talhoes`

Tabela de associação entre missões e talhões (relação muitos-para-muitos).

**Campos**:
- `tal_id`: *Integer*  
  ID do talhão. **(FK)**

- `mis_id`: *Integer*  
  ID da missão. **(FK)**

---

## Entidade: `missao`

Representa uma missão de captura ou análise de dados.

**Campos**:
- `id`: *Integer*  
  Identificador único da missão. **(PK)**

- `mis_created_at`: *DateTime*  
  Data de criação da missão.

- `mis_last_upload`: *DateTime*  
  Data do último upload de arquivos.

- `mis_status`: *String*  
  Status atual da missão.

---

## Entidade: `resultado`

Representa o resultado de uma missão para um talhão.

**Campos**:
- `id`: *Integer*  
  Identificador do resultado. **(PK)**

- `res_source`: *String*  
  Fonte do dado (ex: IA, satélite, drone).

- `mis_id`: *Integer*  
  Missão à qual o resultado pertence. **(FK)**

---

## Entidade: `danninha`

Dados sobre a ocorrência de plantas daninhas.

**Campos**:
- `id`: *Integer*  
  Identificador único do registro. **(PK)**

- `dan_geom`: *Geometry (GeoJson)*  
  Geometria da área com plantas daninhas.

- `res_id`: *Integer*  
  Resultado relacionado. **(FK)**

---

## Entidade: `relatorio`

Registra os relatórios com análise de resultados.

**Campos**:
- `id`: *Integer*  
  Identificador do relatório. **(PK)**

- `percentual_diff`: *Float*  
  Diferença percentual calculada.

- `rel_status`: *String*  
  Status do relatório.

- `start_review`: *DateTime*  
  Início da revisão.

- `end_review`: *DateTime*  
  Fim da revisão.

- `use_id`: *Integer*  
  Usuário que realizou a revisão. **(FK)**

- `mis_id`: *Integer*  
  Missão analisada. **(FK)**

---

## Entidade: `usuario`

Contém os usuários do sistema e suas funções.

**Campos**:
- `id`: *Integer*  
  Identificador único do usuário. **(PK)**

- `use_role`: *String*  
  Papel do usuário (Administrador, Consultor, Analista).

- `created_at`: *DateTime*  
  Data de criação da conta.

- `use_email`: *String*  
  E-mail do usuário.

- `use_nome`: *String*  
  Nome do usuário.

- `active`: *Boolean*  
  Indica se o usuário está ativo.

---


