<?php
// Conexão com o banco de dados
$host = 'localhost';
$dbname = 'senai_TA';
$username = 'postgres';
$password = 'postgres';

try {
    $pdo = new PDO("pgsql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta SQL para listar todos os itens de pedidos com detalhes da pizza
    $sql = "SELECT p.id_pedido, p.tempo_entrega, p.status_pedido, p.data_pedido, 
                   e.id_pizza, pz.preco_pizza, pz.tamanho_pizza, pz.sabor_pizza
            FROM pedidos p
            JOIN encomenda e ON p.id_pedido = e.id_pedido
            JOIN pizza pz ON e.id_pizza = pz.id_pizza";

    // Preparar e executar a consulta
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Exibir os resultados
    echo "<h2>Itens de pedidos com detalhes da pizza:</h2>";
    echo "<table border='1'>";
    echo "<tr><th>ID Pedido</th><th>Tempo de Entrega</th><th>Status do Pedido</th><th>Data do Pedido</th><th>ID Pizza</th><th>Preço</th><th>Tamanho</th><th>Sabor</th></tr>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr>";
        echo "<td>{$row['id_pedido']}</td>";
        echo "<td>{$row['tempo_entrega']}</td>";
        echo "<td>{$row['status_pedido']}</td>";
        echo "<td>{$row['data_pedido']}</td>";
        echo "<td>{$row['id_pizza']}</td>";
        echo "<td>{$row['preco_pizza']}</td>";
        echo "<td>{$row['tamanho_pizza']}</td>";
        echo "<td>{$row['sabor_pizza']}</td>";
        echo "</tr>";
    }
    echo "</table>";

} catch (PDOException $e) {
    die("Erro ao conectar ao banco de dados: " . $e->getMessage());
}
?>
