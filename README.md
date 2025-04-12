🛍️ Projeto de Banco de Dados - E-Commerce

📌 Visão Geral
Este projeto implementa o esquema lógico de um sistema de e-commerce, com foco em:
- 🛒 Vendas online
- 👥 Relacionamento com clientes (pessoa física e jurídica)
- 📦 Controle de estoque
- 📑 Gerenciamento de pedidos, entregas e formas de pagamento
- 🤝 Participação de fornecedores e vendedores terceiros

🧱 Estrutura Geral

🔹 Entidades Principais

👤 Cliente
Representa os consumidores da loja, podendo ser Pessoa Física (CPF) ou Pessoa Jurídica (CNPJ).

🏠 EnderecoCliente
Permite armazenar múltiplos endereços por cliente, utilizados para cálculo de frete.

🏢 Fornecedor
Empresas responsáveis por fornecer produtos ao estoque da loja.

🧑‍💼 VendedorTerceiro
Empresas terceiras que vendem produtos por meio da plataforma.

📦 Produto
Artigos disponíveis para venda, sempre vinculados a um fornecedor.

🏬 Estoque
Controle da quantidade de produtos por local físico.

🧾 Pedido
Registro de uma compra realizada, podendo conter vários produtos.

📦 ProdutoPedido
Representa a relação entre pedidos e produtos adquiridos, incluindo quantidade e valor unitário.

🚚 Entrega
Controle logístico com código de rastreio, status e datas de envio e recebimento.

💳 Pagamento
Registro de formas de pagamento associadas ao cliente.

✨ Destaques do Modelo
- 👥 Um cliente pode possuir múltiplos endereços e formas de pagamento.
- 🔁 Produtos podem ser vendidos por vendedores terceiros, mas sempre têm um fornecedor principal.
- 🚚 Entregas são tratadas separadamente dos pedidos, com status e rastreio.
- 🧮 Suporte a atributos derivados, como cálculo de tempo de entrega.
- ❌ Suporte a pedidos cancelados.
- 📦 Suporte a múltiplos produtos por pedido.

🧪 Scripts
📝 Inclui:
- Criação completa do banco de dados
- Inserção de dados para testes
- Consultas SQL de análise e relatórios

🔍 Exemplos de Consultas SQL
- ✅ Contagem de pedidos por cliente
- 🔗 Junção entre produtos e fornecedores
- ⏱️ Cálculo de dias entre envio e entrega
- 📋 Listagem de clientes com mais de um pedido
- 💳 Consulta de formas de pagamento favoritas por cliente
- 🚫 Pedidos cancelados nos últimos 30 dias

⚙️ Utilização
Basta executar o script SQL em um ambiente compatível com MySQL para:
- Criar o banco de dados
- Popular com dados iniciais
- Executar consultas de exemplo

> Recomendado o uso de ferramentas como MySQL Workbench, DBeaver ou VSCode com extensão SQL.
