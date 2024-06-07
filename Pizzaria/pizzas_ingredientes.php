-- listar pizzas disponiveis e ingredientes
<?php
// Conexão com o banco de dados
$host = 'localhost';
$dbname = 'senai_TA';
$username = 'postgres';
$password = 'postgres';

try {
    $pdo = new PDO("pgsql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta SQL para listar pizzas disponíveis e seus ingredientes
    $sql = "SELECT p.sabor_pizza, p.preco_pizza, p.tamanho_pizza, i.nome_ingrediente, i.quantidade
            FROM pizza p
            JOIN ingredientes i ON p.id_pizza = i.id_pizza";

    // Preparar e executar a consulta
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Exibir os resultados
    echo "<h2>Pizzas Disponíveis e Seus Ingredientes:</h2>";
    echo "<table border='1'>";
    echo "<tr><th>Sabor</th><th>Preço</th><th>Tamanho</th><th>Ingredientes</th><th>Quantidade</th></tr>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr>";
        echo "<td>{$row['sabor_pizza']}</td>";
        echo "<td>{$row['preco_pizza']}</td>";
        echo "<td>{$row['tamanho_pizza']}</td>";
        echo "<td>{$row['nome_ingrediente']}</td>";
        echo "<td>{$row['quantidade']}</td>";
        echo "</tr>";
    }
    echo "</table>";

} catch (PDOException $e) {
    die("Erro ao conectar ao banco de dados: " . $e->getMessage());
}
?>
