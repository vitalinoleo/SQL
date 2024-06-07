    Clientes
  
Id_Cliente - Int (AutoIncr)
Nome_Completo - Varchar(255)
CPF - Varchar (14)
Numero_De_Celular - Varchar (14) 
Endereço - Varchar (100)

   Funcionarios 

Matricula - Varchar (6)
Email_Do_Cliente - Varchar (100)
Senha - Varcha (20)

   Produtos

Id_Do_Produto - Int(AutoIncr)
Descricao_Do_Produto - Text
Preco_Do_Produto - Decimal
Estoque_Atual - Int

   Pedidos

Id_Do_Pedido - Int (AutoIncr)
Id_Do_Produto - Int FK (fk pq o valor dele esta vindo de outro lugar)
Id_Do_Cliente - Int FK
Data_Do_Pedido - Date
Email_Do_Cliente - Varchar FK

   Itens Pedidos 

Id_Do_Pedido - Int FK
Id_Do_Item - Int (AutoIncr)
Preço_Unitario - Decimal

   Pagamentos 

Id_Do_Pedido - Int FK 
Id_Do_Item - Int FK 
Preco_Total - Decimal
Forma_Do_Pagamento - Varchar (50)
 


 