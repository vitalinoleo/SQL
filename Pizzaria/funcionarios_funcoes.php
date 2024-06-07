-- listar funcionarios com funções
<?php
// Conexão com o banco de dados
$host = 'localhost';
$dbname = 'senai_TA';
$username = 'postgres';
$password = 'postgres';

try {
    $pdo = new PDO("pgsql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta SQL para listar cada funcionário com suas funções
    $sql = "SELECT nome_funcionario, tipo_funcionario FROM funcionarios";

    // Preparar e executar a consulta
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Exibir os resultados
    echo "<h2>Funcionários e suas funções:</h2>";
    echo "<table border='1'>";
    echo "<tr><th>Funcionário</th><th>Função</th></tr>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr><td>{$row['nome_funcionario']}</td><td>{$row['tipo_funcionario']}</td></tr>";
    }
    echo "</table>";

} catch (PDOException $e) {
    die("Erro ao conectar ao banco de dados: " . $e->getMessage());
}
?>
