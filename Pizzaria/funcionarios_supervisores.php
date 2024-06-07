--8.  Listar todos os funcionários com seus respectivos supervisores. Consulta para exibir os funcionários e seus supervisores, se aplicável.
<?php
// Conexão com o banco de dados
$host = 'localhost';
$dbname = 'senai_TA';
$username = 'postgres';
$password = 'postgres';

try {
    $pdo = new PDO("pgsql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta SQL para listar cada funcionário e seus supervisores
    $sql = "SELECT f.nome_funcionario AS funcionario, 
                   f.tipo_funcionario AS tipo, 
                   s.nome_supervisor AS supervisor, 
                   s.cargo_supervisor AS cargo_supervisor
            FROM funcionarios f
            LEFT JOIN supervisor s ON f.tipo_funcionario = s.cargo_supervisor";

    // Preparar e executar a consulta
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Exibir os resultados
    echo "<h2>Funcionários e seus supervisores:</h2>";
    echo "<table border='1'>";
    echo "<tr><th>Funcionário</th><th>Tipo</th><th>Supervisor</th><th>Cargo do Supervisor</th></tr>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr><td>{$row['funcionario']}</td><td>{$row['tipo']}</td><td>{$row['supervisor']}</td><td>{$row['cargo_supervisor']}</td></tr>";
    }
    echo "</table>";

} catch (PDOException $e) {
    die("Erro ao conectar ao banco de dados: " . $e->getMessage());
}
?>
