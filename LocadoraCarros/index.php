<!DOCTYPE html>
<html>
<head>
    <title>Locadora de Carros</title>
</head>
<body>
    <h1>Locadora de Carros - Informações</h1>
    
    <?php
    // Incluindo o arquivo de conexão
    include 'db_connect.php';
    
    // Incluindo o arquivo com a função de consulta
    include 'get_table_data.php';
    
    // Tabelas que queremos listar
    $tables = ['Carro', 'Cliente', 'Funcionario', 'Agenda', 'Pagamento', 'Manutencao', 'FeedBack', 'Locacao'];
    
    foreach ($tables as $table) {
        echo "<h2>$table</h2>";
        $result = getTableData($conn, $table);
        
        if ($result->num_rows > 0) {
            echo "<table border='1'><tr>";
            // Imprimindo cabeçalhos das colunas
            while ($fieldinfo = $result->fetch_field()) {
                echo "<th>{$fieldinfo->name}</th>";
            }
            echo "</tr>";
            
            // Imprimindo dados das linhas
            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                foreach($row as $data) {
                    echo "<td>$data</td>";
                }
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "0 results";
        }
    }
    
    // Fechando a conexão
    $conn->close();
    ?>
</body>
</html>
