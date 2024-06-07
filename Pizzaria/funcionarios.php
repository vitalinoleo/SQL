<?php
// Conexão com o banco de dados
$host = 'localhost';
$dbname = 'senai_TA';
$username = 'postgres';
$password = 'postgres';

try {
    $pdo = new PDO("pgsql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta SQL para listar todos os funcionários
    $sql = "SELECT * FROM funcionarios";

    // Preparar e executar a consulta
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Exibir os resultados
    echo "<h2>Lista de Funcionários:</h2>";
    echo "<table border='1'>";
    echo "<tr><th>Data Contratação</th><th>Tipo Funcionário</th><th>Nome Funcionário</th><th>ID</th></tr>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr>";
        echo "<td>{$row['data_funcionario']}</td>";
        echo "<td>{$row['tipo_funcionario']}</td>";
        echo "<td>{$row['nome_funcionario']}</td>";
        echo "<td>{$row['id_funcionarios']}</td>";
        echo "</tr>";
    }
    echo "</table>";

} catch (PDOException $e) {
    die("Erro ao conectar ao banco de dados: " . $e->getMessage());
}
?>
