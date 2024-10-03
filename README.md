# Tabela `Pessoas`

Este repositório contém o código SQL para a criação de uma tabela chamada `Pessoas`, que pode ser usada para armazenar informações básicas sobre pessoas, como nome, data de nascimento, sexo, peso, altura e nacionalidade.

## Estrutura da Tabela

A tabela `Pessoas` é definida com os seguintes campos:

- **`id`**: Identificador único de cada pessoa, gerado automaticamente (campo auto incrementado).
- **`nome`**: Nome da pessoa, obrigatório e com um limite de 30 caracteres.
- **`nascimento`**: Data de nascimento da pessoa.
- **`sexo`**: Definido como 'M' para masculino ou 'F' para feminino, com restrição (CHECK) para garantir a entrada correta.
- **`peso`**: Peso da pessoa, em quilogramas, definido com até 5 dígitos (3 antes da vírgula e 2 depois).
- **`altura`**: Altura da pessoa, em metros, com até 3 dígitos (1 antes da vírgula e 2 depois).
- **`nacionalidade`**: Nacionalidade da pessoa, com valor padrão 'Brasil' se não informado.

## Comando SQL

```sql
CREATE TABLE Pessoas (
    id INT NOT NULL IDENTITY(1,1),
    nome NVARCHAR(30) NOT NULL,
    nascimento DATE,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    peso DECIMAL(5, 2),
    altura DECIMAL(3, 2),
    nacionalidade NVARCHAR(20) DEFAULT 'Brasil',
    PRIMARY KEY (id)
);
```
## Restrições e Validações
- A coluna id é a chave primária da tabela, sendo gerada automaticamente para cada nova entrada.
- A coluna sexo possui uma restrição que só permite os valores 'M' (masculino) ou 'F' (feminino), garantindo a consistência dos dados.
## Consideração final
Esse exemplo de código SQL pode ser usado como base para o armazenamento de dados pessoais em diferentes tipos de sistemas de gerenciamento de banco de dados (SGDBs), como SQL Server, MySQL, ou PostgreSQL.

