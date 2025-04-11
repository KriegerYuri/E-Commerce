-- Criação do banco de dados para o cenário de E-Commerce

CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    NomeDoMeio VARCHAR(3),
    Sobrenome VARCHAR(20),
	Endereco VARCHAR(45),
    tipoPessoa ENUM('F', 'J'),
    email VARCHAR(100),
    telefone VARCHAR(20),
    DataDeNascimento DATE
);

-- Cliente Pessoa Física
CREATE TABLE ClientePessoaFisica (
    idCliente INT PRIMARY KEY,
    CPF CHAR(11),
    CONSTRAINT fk_ClientePF FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Cliente Pessoa Jurídica
CREATE TABLE ClientePessoaJuridica (
    idCliente INT PRIMARY KEY,
    CNPJ CHAR(14),
    razaoSocial VARCHAR(100),
    CONSTRAINT fk_ClientePJ FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Endereço do Cliente
CREATE TABLE EnderecoCliente (
    idEndereco INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    rua VARCHAR(100),
    cidade VARCHAR(50),
    estado CHAR(2),
    CEP CHAR(8),
    tipoEndereco VARCHAR(50),
    CONSTRAINT fk_ClienteEndereco FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(100),
    CNPJ CHAR(14)
);

-- Vendedor Terceiro
CREATE TABLE VendedorTerceiro (
    idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(100),
    CNPJ CHAR(14)
);

-- Produto
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    valor DECIMAL(10, 2),
    categoria VARCHAR(50),
    idFornecedor INT,
    CONSTRAINT fk_Fornecedor_Produtos FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor)
);

-- Produto x Vendedor
CREATE TABLE ProdutoVendedor (
    idProduto INT,
    idVendedor INT,
    PRIMARY KEY(idProduto, idVendedor),
    CONSTRAINT fk_Produtos_Vendedor FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_Vendedor_Produtos FOREIGN KEY (idVendedor) REFERENCES VendedorTerceiro(idVendedor)
);

-- Estoque
CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    idProduto INT,
    local VARCHAR(100),
    quantidade INT,
    CONSTRAINT fk_Produtos_Estoque FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Pedidos
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    dataPedido DATE,
    statusPedido VARCHAR(50),
    valorTotal DECIMAL(10,2),
    cancelado BOOLEAN,
    CONSTRAINT fk_Cliente_Pedido FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- ProdutoPedido
CREATE TABLE ProdutoPedido (
    idProduto INT,
    idPedido INT,
    quantidade INT,
    valorUnitario DECIMAL(10, 2),
    PRIMARY KEY(idProduto, idPedido),
    CONSTRAINT fk_Produtos_Pedidos FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_Pedidos_Produtos FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Entrega
CREATE TABLE Entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    codigoRastreio VARCHAR(100),
    statusEntrega VARCHAR(50),
    dataEnvio DATE,
    dataEntregaPrevista DATE,
    dataEntregaReal DATE,
    CONSTRAINT fk_Pedido_Entrega FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Pagamento
CREATE TABLE Pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    tipoPagamento VARCHAR(50),
    dados VARCHAR(255),
    favorito BOOLEAN,
    CONSTRAINT fk_Cliente_Pagamento FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- --------------------
-- DADOS PARA TESTES --
-- --------------------

INSERT INTO Cliente (nome, tipoPessoa, email, telefone) VALUES 
('Anna Oliveira', 'F', 'annaob@gmail.com', '619966338'),
('Empresa NITA', 'J', 'contato@nita.com', '613214569');

INSERT INTO ClientePessoaFisica VALUES (1, '12345678900');
INSERT INTO ClientePessoaJuridica VALUES (2, '00123456000199', 'NITA Ltda');

INSERT INTO EnderecoCliente (idCliente, rua, cidade, estado, CEP, tipoEndereco) VALUES
(1, 'Rua B', 'São Sebastião', 'DF', '01234567', 'Residencial'),
(2, 'Residencial do Bosque', 'São sebastião', 'DF', '20000000', 'Comercial');

INSERT INTO Fornecedor (razaoSocial, CNPJ) VALUES
('Fornecedor 1', '11111111111111'),

('Fornecedor 2', '22222222222222');

INSERT INTO VendedorTerceiro (razaoSocial, CNPJ) VALUES
('Vendedor 1', '33333333333333'),
('Fornecedor 1', '11111111111111'); -- Também é fornecedor

INSERT INTO Produto (nome, descricao, valor, categoria, idFornecedor) VALUES
('Gameboy', 'Console Portátil', 800.00, 'Categoria Portátil', 1),
('PC Gamer', 'Computador para Jogos', 1500.00, 'Categoria PC Gamer', 2);

INSERT INTO ProdutoVendedor VALUES 
(1, 1),
(2, 2);

INSERT INTO Estoque (idProduto, local, quantidade) VALUES 
(1, 'São Sebastião', 10),
(2, 'Samambaia', 5);

INSERT INTO Pedido (idCliente, dataPedido, statusPedido, valorTotal, cancelado) VALUES
(1, '2025-04-01', 'Entregue', 200.00, FALSE),
(2, '2025-04-03', 'Em processamento', 150.00, FALSE);

INSERT INTO ProdutoPedido VALUES 
(1, 1, 1, 100.00),
(2, 1, 1, 100.00),
(2, 2, 1, 150.00);

INSERT INTO Entrega (idPedido, codigoRastreio, statusEntrega, dataEnvio, dataEntregaPrevista, dataEntregaReal) VALUES
(1, 'BR123456', 'Entregue', '2025-04-02', '2025-04-05', '2025-04-04'),
(2, 'BR654321', 'Aguardando envio', NULL, '2025-04-10', NULL);

INSERT INTO Pagamento (idCliente, tipoPagamento, dados, favorito) VALUES 
(1, 'Cartão', '**** **** **** 1234', TRUE),
(2, 'Pix', 'chavepix@nita.com', TRUE);

-- ------------------------------
-- CONSULTAS SQL (QUERIES)
-- ------------------------------

-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT C.nome, COUNT(P.idPedido) AS totalPedidos
FROM Cliente C
JOIN Pedido P ON C.idCliente = P.idCliente
GROUP BY C.nome;

-- 2. Algum vendedor também é fornecedor?
SELECT V.razaoSocial
FROM VendedorTerceiro V
JOIN Fornecedor F ON V.CNPJ = F.CNPJ;

-- 3. Relação de produtos, fornecedores e estoques
SELECT PR.nome AS Produto, F.razaoSocial AS Fornecedor, E.local, E.quantidade
FROM Produto PR
JOIN Fornecedor F ON PR.idFornecedor = F.idFornecedor
JOIN Estoque E ON PR.idProduto = E.idProduto;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT F.razaoSocial AS Fornecedor, PR.nome AS Produto
FROM Produto PR
JOIN Fornecedor F ON PR.idFornecedor = F.idFornecedor;

-- 5. Recuperar todos os pedidos feitos por clientes PF com seus valores totais
SELECT c.nome, p.idPedido, p.valorTotal
FROM Cliente c
JOIN ClientePessoaFisica pf ON c.idCliente = pf.idCliente
JOIN Pedido p ON p.idCliente = c.idCliente;

-- 6. Pedidos ordenados por valor total
SELECT idPedido, valorTotal
FROM Pedido
ORDER BY valorTotal DESC;

-- 7. Atributo derivado: tempo de entrega (dias)
SELECT E.idEntrega, DATEDIFF(E.dataEntregaReal, E.dataEnvio) AS diasEntrega
FROM Entrega E
WHERE E.dataEntregaReal IS NOT NULL;

-- 8. Listar produtos com valor acima de R$ 100, ordenados por valor decrescente
SELECT nome, valor
FROM Produto
WHERE valor > 100
ORDER BY valor DESC;

-- 9. Recuperar todos os pedidos feitos por clientes PF com seus valores totais
SELECT c.nome, p.idPedido, p.valorTotal
FROM Cliente c
JOIN ClientePessoaFisica pf ON c.idCliente = pf.idCliente
JOIN Pedido p ON p.idCliente = c.idCliente;

-- 9. Recuperar todos os pedidos feitos por clientes PJ com seus valores totais
SELECT c.nome, p.idPedido, p.valorTotal
FROM Cliente c
JOIN ClientePessoaJuridica pj ON c.idCliente = pj.idCliente
JOIN Pedido p ON p.idCliente = c.idCliente;