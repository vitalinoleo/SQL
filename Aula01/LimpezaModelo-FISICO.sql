-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Clientes (
Endereco Varchar (100) PRIMARY KEY,
Nome_Completo Varchar (255),
Id_Cliente Int (AutoIncr),
Telefone Varchar (14),
CPF Varchar (14)
)

CREATE TABLE Funcionarios (
Email Varchar (100) PRIMARY KEY,
Senha Varchar (20),
Matricula Varchar (6)
)

CREATE TABLE  Produtos (
Id_Produto Int (AutoIncr) PRIMARY KEY,
Estoque_Atual Int,
Descricao_Produto Text,
Preco_Poduto Decimal
)

CREATE TABLE Pedidos (
Id_Cliente Int FK PRIMARY KEY,
Email_Cliente Varchar FK,
Id_Pedido Int (AutoIncr),
Data_Pedido Date,
Id_Produto Int FK
)

CREATE TABLE Itens Pedidos (
Id_Pedido Int_FK PRIMARY KEY,
Preco_Unitario Decimal,
Id_Item Int (AutoIncr)
)

CREATE TABLE Pagamentos (
Id_Item Int FK PRIMARY KEY,
Forma_Pagamento Varchar (50),
Preco_Total Decimal,
Id_Pedidos Int FK
)

