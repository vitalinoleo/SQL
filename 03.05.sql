-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Carro (
Id_Carro NotNull PRIMARY KEY,
Ano NotNull,
Modelo NotNull,
Tipo NotNull,
Placa NotNull,
Disponibilidade NotNull
)

CREATE TABLE Cliente (
Nome Varchar(50) Not Null,
Endereco Varchar(80) Not Null,
Cidade Varchar(50) Not Null,
Celular Varchar(14) Not Null,
Email Varchar(100) Not Null,
Sobrenome Varchart(80),
Id_Cliente Serial PRIMARY KEY,
Estado Char(2) Not Null,
Id_Pagamento Serial,
FOREIGN KEY(Id_Pagamento)REFERENCES Pagamento (Id_Pagamento,Id_Componente)
)

CREATE TABLE Funcionario (
Nome Texto(1),
Id_Funcionario Texto(1) PRIMARY KEY,
Sobrenome Texto(1),
Cargo Texto(1),
Salario Texto(1),
Data_Contratacao Texto(1),
Num_Agencia Texto(1)
)

CREATE TABLE Agenda (
Endereco Texto(1),
Cidade Texto(1),
Estado Texto(1),
Contato Texto(1),
Num_Agencia Texto(1) PRIMARY KEY
)

CREATE TABLE Pagamento  (
Id_Pagamento NotNull,
Status_Pagamento NotNull,
Forma_Pagamento NotNull,
Valor NotNull,
Data_Pagamento NotNull,
Id_Realiza NotNull,
Comprovante  Varchar(255),
PRIMARY KEY(Id_Pagamento,Id_Realiza)
)

CREATE TABLE Manutencao (
Id_Manutencao Texto(1) PRIMARY KEY,
Data_Manutencao Texto(1),
Tipo_Manutencao Texto(1),
Descricao Texto(1),
KM Texto(1),
Custo Texto(1)
)

CREATE TABLE FeedBack (
Id_Feedback Texto(1) PRIMARY KEY,
Comentario Texto(1),
Avaliacao Texto(1),
Data_Feedback Texto(1)
)

CREATE TABLE Locacao (
Data_Devolucao Date Not Nul,
Data_locacao Date NotNull,
Valor_total Decimal (7,2) Not Null,
Id_locacao Serial PRIMARY KEY,
Id_Cliente Serial,
Id_Carro Serial,
FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente),
FOREIGN KEY(Id_Carro) REFERENCES Carro (Id_Carro)
)

CREATE TABLE Recebe (
Id_Manutencao Serial,
Id_Carro Serial,
FOREIGN KEY(Id_Manutencao) REFERENCES Manutencao (Id_Manutencao),
FOREIGN KEY(Id_Carro) REFERENCES Carro (Id_Carro)
)

CREATE TABLE Registra (
Id_Cliente NotNull,
Id_Feedback Texto(1),
FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente),
FOREIGN KEY(Id_Feedback) REFERENCES FeedBack (Id_Feedback)
)

ALTER TABLE Cliente ADD FOREIGN KEY(/*erro: ??*/) REFERENCES Pagamento  (Id_Pagamento,Id_Realiza)
ALTER TABLE Funcionario ADD FOREIGN KEY(Num_Agencia) REFERENCES Agenda (Num_Agencia)
