DROP DATABASE IF EXISTS BDPROJETO2;
CREATE DATABASE BDPROJETO2; 

 

USE BDPROJETO2; 

 

CREATE TABLE Usuario ( 

    ID_Usuario INT PRIMARY KEY, 

    Nome VARCHAR(50), 

    Email VARCHAR(100), 

    Senha VARCHAR(100), 

    CPF VARCHAR(11), 

    Telefone VARCHAR(11), 

    Tipo VARCHAR(50), 

    CEP VARCHAR(30), 

    Bairro VARCHAR(50), 

    Logradouro VARCHAR(50), 

    fk_Cidade_ID_Cidade INT 

); 

 

CREATE TABLE Estabelecimento ( 

    ID_Estabelecimento INT PRIMARY KEY, 

    CNPJ CHAR(14), 

    Nome_Empresa VARCHAR(100), 

    Email VARCHAR(100), 

    Senha VARCHAR(100), 

    Telefone CHAR(11), 

    CEP VARCHAR(30), 

    Bairro VARCHAR(30), 

    Logradouro VARCHAR(30), 

    fk_Cidade_ID_Cidade INT 

); 

 

CREATE TABLE Pedido ( 

    ID_Pedido INT PRIMARY KEY, 

    Data DATE, 

    fk_Usuario_ID_Usuario INT, 

    fk_Pagamento_ID_Pagamento INT 

); 

 

CREATE TABLE Produtos ( 

    ID_Produtos INT PRIMARY KEY, 

    Nicho VARCHAR(20), 

    Nome VARCHAR(50), 

    Descricao VARCHAR(150), 

    Preco DECIMAL(10,2) 

); 

 

CREATE TABLE Produtos_Pedidos ( 

    ID_Produtos_Pedidos INT PRIMARY KEY, 

    Quantidade INT, 

    Dt_Fabricacao DATE, 

    Dt_Validade DATE, 

    fk_Produtos_ID_Produtos INT, 

    fk_Pedido_ID_Pedido INT 

); 

 

CREATE TABLE Pagamento ( 

    ID_Pagamento INT PRIMARY KEY, 

    Metodo VARCHAR(20), 

    Status VARCHAR(30), 

    Dt_Pagamento DATE 

); 

 

CREATE TABLE Nicho ( 

    Descricao VARCHAR(150), 

    ID_Nicho INT PRIMARY KEY 

); 

 

CREATE TABLE Nicho_Produto ( 

    ID_NichoProduto INT PRIMARY KEY, 

    fk_Produtos_ID_Produtos INT, 

    fk_Nicho_ID_Nicho INT 

); 

 

CREATE TABLE Estabelecimento_Produto ( 

    ID_EstabelecimentoProduto INT PRIMARY KEY, 

    fk_Estabelecimento_ID_Estabelecimento INT, 

    fk_Produtos_ID_Produtos INT 

); 

 

CREATE TABLE Cidade ( 

    Nome VARCHAR(70), 

    Estado VARCHAR(50), 

    ID_Cidade INT PRIMARY KEY 

); 

  

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2 

    FOREIGN KEY (fk_Cidade_ID_Cidade) 

    REFERENCES Cidade (ID_Cidade) 

    ON DELETE RESTRICT; 

  

ALTER TABLE Estabelecimento ADD CONSTRAINT FK_Estabelecimento_2 

    FOREIGN KEY (fk_Cidade_ID_Cidade) 

    REFERENCES Cidade (ID_Cidade) 

    ON DELETE RESTRICT; 

  

ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2 

    FOREIGN KEY (fk_Usuario_ID_Usuario) 

    REFERENCES Usuario (ID_Usuario) 

    ON DELETE CASCADE; 

  

ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_3 

    FOREIGN KEY (fk_Pagamento_ID_Pagamento) 

    REFERENCES Pagamento (ID_Pagamento) 

    ON DELETE CASCADE; 

  

ALTER TABLE Produtos_Pedidos ADD CONSTRAINT FK_Produtos_Pedidos_2 

    FOREIGN KEY (fk_Produtos_ID_Produtos) 

    REFERENCES Produtos (ID_Produtos); 

  

ALTER TABLE Produtos_Pedidos ADD CONSTRAINT FK_Produtos_Pedidos_3 

    FOREIGN KEY (fk_Pedido_ID_Pedido) 

    REFERENCES Pedido (ID_Pedido); 

  

ALTER TABLE Nicho_Produto ADD CONSTRAINT FK_Nicho_Produto_2 

    FOREIGN KEY (fk_Produtos_ID_Produtos) 

    REFERENCES Produtos (ID_Produtos); 

  

ALTER TABLE Nicho_Produto ADD CONSTRAINT FK_Nicho_Produto_3 

    FOREIGN KEY (fk_Nicho_ID_Nicho) 

    REFERENCES Nicho (ID_Nicho); 

  

ALTER TABLE Estabelecimento_Produto ADD CONSTRAINT FK_Estabelecimento_Produto_2 

    FOREIGN KEY (fk_Estabelecimento_ID_Estabelecimento) 

    REFERENCES Estabelecimento (ID_Estabelecimento); 

  

ALTER TABLE Estabelecimento_Produto ADD CONSTRAINT FK_Estabelecimento_Produto_3 

    FOREIGN KEY (fk_Produtos_ID_Produtos) 

    REFERENCES Produtos (ID_Produtos);
    
INSERT INTO Cidade (Nome, Estado, ID_Cidade) VALUES  

('Curitiba', 'Paraná', 1), 

('São Paulo', 'São Paulo', 2), 

('Rio de Janeiro', 'Rio de Janeiro', 3), 

('Belo Horizonte', 'Minas Gerais', 4), 

('Porto Alegre', 'Rio Grande do Sul', 5), 

('Florianópolis', 'Santa Catarina', 6), 

('Brasília', 'Distrito Federal', 7), 

('Salvador', 'Bahia', 8), 

('Recife', 'Pernambuco', 9), 

('Campinas', 'São Paulo', 10), 

('São José dos Campos', 'São Paulo', 11), 

('Curitiba', 'Paraná', 12), 

('Londrina', 'Paraná', 13), 

('Uberlândia', 'Minas Gerais', 14), 

('Blumenau', 'Santa Catarina', 15); 
 
INSERT INTO Usuario (ID_Usuario, Nome, Email, Senha, CPF, Telefone, Tipo, CEP, Bairro, Logradouro, fk_Cidade_ID_Cidade) VALUES  

(1, 'Ana Silva', 'ana@gmail.com', 'senha123', '12345678901', '41987654321', 'Cliente', '80000-000', 'Centro', 'Rua A', 1), 

(2, 'Carlos Souza', 'carlos@gmail.com', 'senha456', '23456789012', '41976543210', 'Cliente', '80001-000', 'Batel', 'Rua B', 1), 

(3, 'Mariana Oliveira', 'mariana@pucpr.edu.br', 'senha789', '34567890123', '41965432109', 'Cliente', '80002-000', 'Alto da XV', 'Rua C', 1), 

(4, 'Pedro Almeida', 'pedro@outlook.com', 'senha321', '45678901234', '41954321098', 'Cliente', '80003-000', 'Juvevê', 'Rua D', 1), 

(5, 'Lucia Costa', 'lucia@gmail.com', 'senha654', '56789012345', '41943210987', 'Cliente', '80004-000', 'Rebouças', 'Rua E', 1), 

(6, 'Ricardo Ferreira', 'ricardo@pucpr.edu.br', 'senha987', '67890123456', '41932109876', 'Cliente', '80005-000', 'Civic Center', 'Rua F', 1), 

(7, 'Fernanda Lima', 'fernanda@outlook.com', 'senha234', '78901234567', '41921098765', 'Cliente', '80006-000', 'São Francisco', 'Rua G', 1), 

(8, 'Gustavo Martins', 'gustavo@gmail.com', 'senha890', '89012345678', '41910987654', 'Cliente', '80007-000', 'Cristo Rei', 'Rua H', 1), 

(9, 'Juliana Rocha', 'juliana@pucpr.edu.br', 'senha432', '90123456789', '41909876543', 'Cliente', '80008-000', 'Água Verde', 'Rua I', 1), 

(10, 'André Dias', 'andre@outlook.com', 'senha567', '01234567890', '41998765432', 'Cliente', '80009-000', 'Sítio Cercado', 'Rua J', 1), 

(11, 'Claudia Pires', 'claudia@gmail.com', 'senha876', '12345678901', '41987654322', 'Cliente', '80010-000', 'Novo Mundo', 'Rua K', 1), 

(12, 'Marcos Paulo', 'marcos@pucpr.edu.br', 'senha654', '23456789012', '41976543221', 'Cliente', '80011-000', 'Tarumã', 'Rua L', 1), 

(13, 'Rafaela Santos', 'rafaela@outlook.com', 'senha543', '34567890123', '41965432120', 'Cliente', '80012-000', 'Bairro Alto', 'Rua M', 1), 

(14, 'Thiago Lima', 'thiago@gmail.com', 'senha321', '45678901234', '41954321019', 'Cliente', '80013-000', 'Cabral', 'Rua N', 1), 

(15, 'Sofia Almeida', 'sofia@pucpr.edu.br', 'senha654', '56789012345', '41943210918', 'Cliente', '80014-000', 'Centro Cívico', 'Rua O', 1); 
 

INSERT INTO Estabelecimento (ID_Estabelecimento, CNPJ, Nome_Empresa, Email, Senha, Telefone, CEP, Bairro, Logradouro, fk_Cidade_ID_Cidade) VALUES  

(1, '12345678000195', 'Restaurante Saboroso', 'saboroso@gmail.com', 'senha123', '41988887777', '80015-000', 'Centro', 'Avenida 1', 1), 

(2, '98765432000100', 'Pizzaria Delícia', 'delicia@gmail.com', 'senha456', '41987776666', '80016-000', 'Batel', 'Avenida 2', 1), 

(3, '54321678000112', 'Hamburgueria Top', 'top@outlook.com', 'senha789', '41986665555', '80017-000', 'Alto da XV', 'Avenida 3', 1), 

(4, '10987654000145', 'Café da Manhã', 'cafe@gmail.com', 'senha321', '41985554444', '80018-000', 'Juvevê', 'Avenida 4', 1), 

(5, '10203040500195', 'Sorveteria Gelato', 'gelato@gmail.com', 'senha654', '41984443333', '80019-000', 'Rebouças', 'Avenida 5', 1), 

(6, '60607080900190', 'Restaurante Vegano', 'vegano@outlook.com', 'senha456', '41983332222', '80020-000', 'Batel', 'Avenida 6', 1), 

(7, '70809010000101', 'Cervejaria Artesanal', 'cerveja@gmail.com', 'senha123', '41982221111', '80021-000', 'Centro', 'Avenida 7', 1), 

(8, '80910111200112', 'Churrascaria do Zé', 'churras@gmail.com', 'senha456', '41981110000', '80022-000', 'Água Verde', 'Avenida 8', 1), 

(9, '91011121300123', 'Comida Caseira', 'caseira@outlook.com', 'senha789', '41980009999', '80023-000', 'São Francisco', 'Avenida 9', 1), 

(10, '01112131400134', 'Cozinha Internacional', 'internacional@gmail.com', 'senha321', '41979998888', '80024-000', 'Cristo Rei', 'Avenida 10', 1), 

(11, '12345678000190', 'Pizzaria Saborosa', 'pizzaria.saborosa@gmail.com', 'senha123', '11987654321', '12345-678', 'Centro', 'Rua das Pizzas', 2), 

(12, '23456789000101', 'Burguer Mania', 'burguer.mania@pucpr.edu.br', 'senha456', '11876543210', '23456-789', 'Jardim das Flores', 'Av. dos Burgers', 3), 

(13, '34567890000112', 'Cafeteria Aroma', 'cafeteria.aroma@outlook.com', 'senha789', '11765432109', '34567-890', 'Bairro Novo', 'Praça da Cafeteria', 5), 

(14, '45678901000123', 'Churrascaria do Sul', 'churrascaria.sul@gmail.com', 'senha012', '11654321098', '45678-901', 'Parque Industrial', 'Rua do Churrasco', 9), 

(15, '56789012000134', 'Sushi Point', 'sushi.point@pucpr.edu.br', 'senha345', '11543210987', '56789-012', 'Vila Nova', 'Av. do Sushi', 12); 
 

INSERT INTO Pagamento (ID_Pagamento, Metodo, Status, Dt_Pagamento) VALUES  

(1, 'Cartão de Crédito', 'Aprovado', '2024-10-01'), 

(2, 'Boleto', 'Aguardando', '2024-10-02'), 

(3, 'Dinheiro', 'Aprovado', '2024-10-03'), 

(4, 'Cartão de Débito', 'Aprovado', '2024-10-04'), 

(5, 'Transferência', 'Aprovado', '2024-10-05'), 

(6, 'Cartão de Crédito', 'Cancelado', '2024-10-06'), 

(7, 'Boleto', 'Aprovado', '2024-10-07'), 

(8, 'Dinheiro', 'Aprovado', '2024-10-08'), 

(9, 'Cartão de Débito', 'Aguardando', '2024-10-09'), 

(10, 'Transferência', 'Aprovado', '2024-10-10'), 

(11, 'Cartão de Crédito', 'Aprovado', '2024-10-11'), 

(12, 'Boleto', 'Cancelado', '2024-10-12'), 

(13, 'Dinheiro', 'Aprovado', '2024-10-13'), 

(14, 'Cartão de Débito', 'Aprovado', '2024-10-14'), 

(15, 'Transferência', 'Aprovado', '2024-10-15'); 

 

INSERT INTO Pedido (ID_Pedido, Data, fk_Usuario_ID_Usuario, fk_Pagamento_ID_Pagamento) VALUES  

(1, '2024-10-01', 1, 1), 

(2, '2024-10-02', 2, 2), 

(3, '2024-10-03', 3, 3), 

(4, '2024-10-04', 4, 4), 

(5, '2024-10-05', 5, 5), 

(6, '2024-10-06', 6, 6), 

(7, '2024-10-07', 7, 7), 

(8, '2024-10-08', 8, 8), 

(9, '2024-10-09', 9, 9), 

(10, '2024-10-10', 10, 10), 

(11, '2024-10-11', 11, 11), 

(12, '2024-10-12', 12, 12), 

(13, '2024-10-13', 13, 13), 

(14, '2024-10-14', 14, 14), 

(15, '2024-10-15', 15, 15); 

 

INSERT INTO Produtos (ID_Produtos, Nicho, Nome, Descricao, Preco) VALUES  

(1, 'Comida', 'X-Burguer', 'Hambúrguer com queijo e bacon', 15.00), 

(2, 'Comida', 'Pizza Margherita', 'Pizza tradicional com muçarela e manjericão', 30.00), 

(3, 'Bebida', 'Suco Natural', 'Suco fresco de laranja', 8.00), 

(4, 'Comida', 'Frango Frito', 'Frango frito crocante', 20.00), 

(5, 'Comida', 'Tacos', 'Tacos com carne e guacamole', 12.00), 

(6, 'Bebida', 'Cerveja Artesanal', 'Cerveja produzida localmente', 12.00), 

(7, 'Comida', 'Lasanha', 'Lasanha de carne com molho béchamel', 22.00), 

(8, 'Comida', 'Salada Caesar', 'Salada com frango grelhado e molho Caesar', 18.00), 

(9, 'Comida', 'Espaguete', 'Espaguete à carbonara', 22.00), 

(10, 'Bebida', 'Refrigerante', 'Refrigerante de cola', 5.00), 

(11, 'Comida', 'Sushi', 'Sushi variado com salmão e atum', 40.00), 

(12, 'Bebida', 'Água Mineral', 'Água mineral com gás', 4.00), 

(13, 'Comida', 'Churrasco', 'Churrasco com acompanhamentos', 50.00), 

(14, 'Comida', 'Coxinha', 'Coxinha de frango', 6.00), 

(15, 'Bebida', 'Milkshake', 'Milkshake de chocolate', 10.00); 

 
INSERT INTO Produtos_Pedidos (ID_Produtos_Pedidos, Quantidade, Dt_Fabricacao, Dt_Validade, fk_Produtos_ID_Produtos, fk_Pedido_ID_Pedido) VALUES  

(1, 2, '2024-09-20', '2024-11-20', 1, 1), 

(2, 1, '2024-09-21', '2024-11-21', 2, 2), 

(3, 3, '2024-09-22', '2024-11-22', 3, 3), 

(4, 4, '2024-09-23', '2024-11-23', 4, 4), 

(5, 5, '2024-09-24', '2024-11-24', 5, 5), 

(6, 2, '2024-09-25', '2024-11-25', 6, 6), 

(7, 1, '2024-09-26', '2024-11-26', 7, 7), 

(8, 3, '2024-09-27', '2024-11-27', 8, 8), 

(9, 2, '2024-09-28', '2024-11-28', 9, 9), 

(10, 1, '2024-09-29', '2024-11-29', 10, 10), 

(11, 2, '2024-09-30', '2024-11-30', 11, 11), 

(12, 3, '2024-10-01', '2024-12-01', 12, 12), 

(13, 1, '2024-10-02', '2024-12-02', 13, 13), 

(14, 2, '2024-10-03', '2024-12-03', 14, 14), 

(15, 1, '2024-10-04', '2024-12-04', 15, 15); 

 

INSERT INTO Nicho (Descricao, ID_Nicho) VALUES  

('Comida', 1), 

('Bebida', 2), 

('Fast Food', 3), 

('Sushi', 4), 

('Vegano', 5), 

('Saudável', 6), 

('Doces', 7), 

('Sorvetes', 8), 

('Churrasco', 9), 

('Lanches', 10), 

('Cafés', 11), 

('Pizzas', 12), 

('Massas', 13), 

('Bistrôs', 14), 

('Bistrô Moderno', 15); 


INSERT INTO Nicho_Produto (ID_NichoProduto, fk_Produtos_ID_Produtos, fk_Nicho_ID_Nicho) VALUES  

(1, 1, 1), 

(2, 2, 12), 

(3, 3, 2), 

(4, 4, 1), 

(5, 5, 3), 

(6, 6, 2), 

(7, 7, 13), 

(8, 8, 1), 

(9, 9, 12), 

(10, 10, 2), 

(11, 11, 4), 

(12, 12, 6), 

(13, 13, 9), 

(14, 14, 7), 

(15, 15, 10); 


INSERT INTO Estabelecimento_Produto (ID_EstabelecimentoProduto, fk_Estabelecimento_ID_Estabelecimento, fk_Produtos_ID_Produtos) VALUES  

(1, 1, 1), 

(2, 1, 2), 

(3, 2, 1), 

(4, 2, 3), 

(5, 3, 4), 

(6, 3, 5), 

(7, 4, 6), 

(8, 4, 7), 

(9, 5, 8), 

(10, 5, 9), 

(11, 6, 10), 

(12, 6, 11), 

(13, 7, 12), 

(14, 8, 13), 

(15, 9, 14); 