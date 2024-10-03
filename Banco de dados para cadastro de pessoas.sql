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
