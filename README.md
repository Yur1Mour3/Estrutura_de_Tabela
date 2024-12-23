# Estrutura de Tabelas e Relacionamentos em SQL

Este repositório contém o código SQL para a criação e manipulação de tabelas que implementam um modelo dimensional, com exemplos de inserções e consultas. Este modelo é útil para análises e relatórios em ambientes de Business Intelligence (BI).

## Tabelas Criadas

### 1. `DIM_MOEDA`

Armazena informações sobre moedas utilizadas nas transações.

```sql
CREATE TABLE DIM_MOEDA (
    CurrencyKey INT NOT NULL, -- Chave primária única para a moeda
    CurrencyAlternateKey NCHAR(3) NOT NULL, -- Código alternativo da moeda (3 caracteres, ex.: USD)
    CurrencyName NVARCHAR(50) NOT NULL, -- Nome completo da moeda
    CONSTRAINT PK_DIM_MOEDA_CurrencyKey PRIMARY KEY (CurrencyKey) -- Definição da chave primária
);
```

### 2. `DIM_CLIENTE`

Contém informações detalhadas sobre clientes.

```sql
CREATE TABLE DIM_CLIENTE (
    CustomerKey INT NOT NULL, -- Chave primária única para o cliente
    GeographyKey INT NULL, -- Chave estrangeira para a tabela de geografia
    CustomerAlternateKey NVARCHAR(15) NOT NULL, -- Código alternativo do cliente
    Title NVARCHAR(8) NULL, -- Título do cliente (ex.: Sr., Sra.)
    FirstName NVARCHAR(50) NULL, -- Primeiro nome
    MiddleName NVARCHAR(50) NULL, -- Nome do meio
    LastName NVARCHAR(50) NULL, -- Sobrenome
    NameStyle BOOL NULL, -- Estilo do nome (ex.: formal/informal)
    BirthDate DATE NULL, -- Data de nascimento
    MaritalStatus NCHAR(1) NULL, -- Estado civil (ex.: S, C)
    Suffix NVARCHAR(10) NULL, -- Sufixo do nome (ex.: Jr., Sr.)
    Gender NVARCHAR(1) NULL, -- Gênero do cliente (ex.: M, F)
    EmailAddress NVARCHAR(50) NULL, -- Endereço de email
    YearlyIncome NUMERIC(15, 2) NULL, -- Renda anual
    Education NVARCHAR(40) NULL, -- Nível de escolaridade
    Occupation NVARCHAR(100) NULL, -- Ocupação
    AddressLine1 NVARCHAR(120) NULL, -- Endereço principal
    AddressLine2 NVARCHAR(120) NULL, -- Endereço secundário
    Phone NVARCHAR(20) NULL, -- Número de telefone
    DateFirstPurchase DATE NULL, -- Data da primeira compra
    CONSTRAINT PK_DIM_CLIENTE_CustomerKey PRIMARY KEY (CustomerKey) -- Definição da chave primária
);
```

### 3. `DIM_DATA`

Registra informações temporais para análises baseadas em tempo.

```sql

CREACREATE TABLE DIM_DATA (
    DateKey INT NOT NULL, -- Chave primária única para a data
    FullDateAlternateKey DATE NOT NULL, -- Representação completa da data
    DayNumberOfWeek INT NOT NULL, -- Número do dia na semana
    DayNameOfWeek NVARCHAR(10) NOT NULL, -- Nome do dia da semana
    DayNumberOfMonth INT NOT NULL, -- Número do dia no mês
    DayNumberOfYear INT NOT NULL, -- Número do dia no ano
    WeekNumberOfYear INT NOT NULL, -- Número da semana no ano
    MonthName NVARCHAR(10) NOT NULL, -- Nome do mês
    MonthNumberOfYear INT NOT NULL, -- Número do mês no ano
    CalendarQuarter INT NOT NULL, -- Trimestre do ano
    CalendarYear INT NOT NULL, -- Ano do calendário
    CalendarSemester INT NOT NULL, -- Semestre do calendário
    FiscalQuarter INT NOT NULL, -- Trimestre fiscal
    FiscalYear INT NOT NULL, -- Ano fiscal
    FiscalSemester INT NOT NULL, -- Semestre fiscal
    CONSTRAINT PK_DIM_DATA_DateKey PRIMARY KEY (DateKey) -- Definição da chave primária
) DISTSTYLE ALL; -- Distribuição total dos dados (opcional, usado em Redshift).
```


### 4. `DIM_GEOGRAFIA`
Detalha informações geográficas para análise de localização.

```sql

CREATE TABLE DIM_GEOGRAFIA (
    GeographyKey INT NOT NULL, -- Chave primária única para a localização
    City NVARCHAR(30) NULL, -- Nome da cidade
    StateProvinceCode NVARCHAR(3) NULL, -- Código do estado/província
    StateProvinceName NVARCHAR(50) NULL, -- Nome do estado/província
    CountryRegionCode NVARCHAR(3) NULL, -- Código do país/região
    CountryRegionName NVARCHAR(50) NULL, -- Nome do país/região
    PostalCode NVARCHAR(15) NULL, -- Código postal
    SalesTerritoryKey INT NULL, -- Chave para o território de vendas
    IpAddressLocator NVARCHAR(15) NULL, -- Localizador de IP
    CONSTRAINT PK_DIM_GEOGRAFIA_GeographyKey PRIMARY KEY (GeographyKey) -- Definição da chave primária
);
```

### 5. `FATO_VENDAS`

Armazena dados de transações de vendas para análise de performance.

```sql
CREATE TABLE FATO_VENDAS (
    ProductKey INT NOT NULL, -- Chave estrangeira para o produto
    OrderDateKey INT NOT NULL, -- Chave estrangeira para a data do pedido
    DueDateKey INT NOT NULL, -- Chave estrangeira para a data de vencimento
    ShipDateKey INT NOT NULL, -- Chave estrangeira para a data de envio
    CustomerKey INT NOT NULL, -- Chave estrangeira para o cliente
    CurrencyKey INT NOT NULL, -- Chave estrangeira para a moeda
    SalesTerritoryKey INT NOT NULL, -- Chave para o território de vendas
    SalesOrderNumber NVARCHAR(20) NOT NULL, -- Número do pedido
    SalesOrderLineNumber INT NOT NULL, -- Número da linha no pedido
    RevisionNumber INT NOT NULL, -- Número da revisão do pedido
    OrderQuantity INT NOT NULL, -- Quantidade do pedido
    UnitPrice NUMERIC(15, 2) NOT NULL, -- Preço unitário
    ExtendedAmount NUMERIC(15, 2) NOT NULL, -- Valor total estendido
    UnitPriceDiscountPct FLOAT NOT NULL, -- Porcentagem de desconto no preço unitário
    DiscountAmount FLOAT NOT NULL, -- Valor do desconto
    ProductStandardCost NUMERIC(15, 2) NOT NULL, -- Custo padrão do produto
    TotalProductCost NUMERIC(15, 2) NOT NULL, -- Custo total do produto
    SalesAmount NUMERIC(15, 2) NOT NULL, -- Valor total das vendas
    TaxAmt NUMERIC(15, 2) NOT NULL, -- Valor dos impostos
    Freight NUMERIC(15, 2) NOT NULL, -- Valor do frete
    CarrierTrackingNumber NVARCHAR(25) NULL, -- Número de rastreamento do transporte
    CustomerPONumber NVARCHAR(25) NULL, -- Número do pedido do cliente
    OrderDate DATETIME NULL, -- Data do pedido
    DueDate DATETIME NULL, -- Data de vencimento
    ShipDate DATETIME NULL, -- Data de envio
    CONSTRAINT PK_FATO_VENDAS_SalesOrderNumber_SalesOrderLineNumber PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber) -- Definição da chave primária
);
```



## Considerações Finais
Este código fornece uma base robusta para a criação de um banco de dados relacional orientado a análise de dados. Ele pode ser adaptado para diferentes sistemas de gerenciamento de banco de dados, como SQL Server, MySQL e PostgreSQL, dependendo das necessidades do projeto.

