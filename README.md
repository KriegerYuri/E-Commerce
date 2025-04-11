# E-Commerce
Modelo lógico de banco de dados de E-commerce

Projeto de Banco de Dados - E-Commerce

Visão Geral
Este projeto implementa o esquema lógico de um sistema de loja virtual com foco em:

Vendas online

Relacionamento com clientes (pessoas físicas e jurídicas)

Controle de estoque

Pedidos, entregas e formas de pagamento

Participação de fornecedores e vendedores terceiros

Estrutura Geral
Entidades Principais
Cliente: Representa os consumidores da loja, podendo ser pessoa física (CPF) ou jurídica (CNPJ).

EnderecoCliente: Permite armazenar múltiplos endereços por cliente, utilizados para cálculo de frete.

Fornecedor: Entidades responsáveis por fornecer produtos ao estoque da loja.

VendedorTerceiro: Empresas que vendem produtos por meio da plataforma.

Produto: Artigos disponíveis para venda, vinculados a um fornecedor.

Estoque: Controle da quantidade de produtos por local físico.

Pedido: Registro de uma compra, podendo conter vários produtos.

ProdutoPedido: Relação entre pedidos e os produtos adquiridos.

Entrega: Controle logístico com código de rastreio, status e prazos.

Pagamento: Métodos de pagamento associados ao cliente.

Destaques do Modelo
Cliente pode possuir múltiplos endereços e formas de pagamento.

Produtos podem ser vendidos por vendedores terceiros, mas sempre possuem um fornecedor.

Entregas são tratadas separadamente dos pedidos, com controle de status.

Permite atributos derivados como cálculo de tempo de entrega.

Suporte a pedidos cancelados e múltiplos produtos por pedido.

Scripts
Criação completa do banco + inserções de teste + queries SQL.

Exemplos de Consultas
Contagem de pedidos por cliente

Junção entre produtos e fornecedores

Cálculo de dias entre envio e entrega

Listagem de clientes com mais de um pedido

Utilização
Basta executar o script SQL em um ambiente compatível com MySQL para criar o banco e inserir os dados iniciais.
