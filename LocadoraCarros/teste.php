<?php
$host = 'localhost';
$dbname = 'nome_do_banco_de_dados';
$user = 'nome_do_usuario';
$password = 'senha_do_usuario';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erro de conexão: " . $e->getMessage());
}

function fetchAllFromTable($pdo, $tableName) {
    $stmt = $pdo->query("SELECT * FROM $tableName");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

$carros = fetchAllFromTable($pdo, 'Carro');
$clientes = fetchAllFromTable($pdo, 'Cliente');
$funcionarios = fetchAllFromTable($pdo, 'Funcionario');
$agendas = fetchAllFromTable($pdo, 'Agenda');
$pagamentos = fetchAllFromTable($pdo, 'Pagamento');
$manutencoes = fetchAllFromTable($pdo, 'Manutencao');
$feedbacks = fetchAllFromTable($pdo, 'FeedBack');
$locacoes = fetchAllFromTable($pdo, 'Locacao');
$faz = fetchAllFromTable($pdo, 'Faz');
$registra = fetchAllFromTable($pdo, 'Registra');
$realiza = fetchAllFromTable($pdo, 'Realiza');
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Locadora de Carros</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2>Carros</h2>
<table>
    <tr>
        <th>Ano</th>
        <th>ID Carro</th>
        <th>Placa</th>
        <th>Modelo</th>
        <th>Tipo</th>
        <th>Disponibilidade</th>
    </tr>
    <?php foreach ($carros as $carro): ?>
    <tr>
        <td><?= htmlspecialchars($carro['Ano']) ?></td>
        <td><?= htmlspecialchars($carro['Id_Carro']) ?></td>
        <td><?= htmlspecialchars($carro['Placa']) ?></td>
        <td><?= htmlspecialchars($carro['Modelo']) ?></td>
        <td><?= htmlspecialchars($carro['Tipo']) ?></td>
        <td><?= htmlspecialchars($carro['Disponibilidade']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Clientes</h2>
<table>
    <tr>
        <th>ID Cliente</th>
        <th>Estado</th>
        <th>Sobrenome</th>
        <th>Cidade</th>
        <th>Nome</th>
        <th>Endereco</th>
        <th>Celular</th>
        <th>Email</th>
        <th>ID Pagamento</th>
    </tr>
    <?php foreach ($clientes as $cliente): ?>
    <tr>
        <td><?= htmlspecialchars($cliente['Id_Cliente']) ?></td>
        <td><?= htmlspecialchars($cliente['Estado']) ?></td>
        <td><?= htmlspecialchars($cliente['Sobrenome']) ?></td>
        <td><?= htmlspecialchars($cliente['Cidade']) ?></td>
        <td><?= htmlspecialchars($cliente['Nome']) ?></td>
        <td><?= htmlspecialchars($cliente['Endereco']) ?></td>
        <td><?= htmlspecialchars($cliente['Celular']) ?></td>
        <td><?= htmlspecialchars($cliente['Email']) ?></td>
        <td><?= htmlspecialchars($cliente['Id_Pagamento']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Funcionários</h2>
<table>
    <tr>
        <th>Cargo</th>
        <th>ID Funcionário</th>
        <th>Sobrenome</th>
        <th>Nome</th>
        <th>Data de Contratação</th>
        <th>Salário</th>
        <th>Num Agência</th>
    </tr>
    <?php foreach ($funcionarios as $funcionario): ?>
    <tr>
        <td><?= htmlspecialchars($funcionario['Cargo']) ?></td>
        <td><?= htmlspecialchars($funcionario['Id_Funcionario']) ?></td>
        <td><?= htmlspecialchars($funcionario['Sobrenome']) ?></td>
        <td><?= htmlspecialchars($funcionario['Nome']) ?></td>
        <td><?= htmlspecialchars($funcionario['Data_Contratacao']) ?></td>
        <td><?= htmlspecialchars($funcionario['Salario']) ?></td>
        <td><?= htmlspecialchars($funcionario['Num_Agencia']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Agências</h2>
<table>
    <tr>
        <th>Num Agência</th>
        <th>Contato</th>
        <th>Endereco</th>
        <th>Estado</th>
        <th>Cidade</th>
    </tr>
    <?php foreach ($agendas as $agenda): ?>
    <tr>
        <td><?= htmlspecialchars($agenda['Num_Agencia']) ?></td>
        <td><?= htmlspecialchars($agenda['Contato']) ?></td>
        <td><?= htmlspecialchars($agenda['Endereco']) ?></td>
        <td><?= htmlspecialchars($agenda['Estado']) ?></td>
        <td><?= htmlspecialchars($agenda['Cidade']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Pagamentos</h2>
<table>
    <tr>
        <th>ID Pagamento</th>
        <th>Valor</th>
        <th>Data de Pagamento</th>
        <th>Status do Pagamento</th>
        <th>Forma de Pagamento</th>
        <th>ID Realiza</th>
        <th>Comprovante</th>
    </tr>
    <?php foreach ($pagamentos as $pagamento): ?>
    <tr>
        <td><?= htmlspecialchars($pagamento['Id_Pagamento']) ?></td>
        <td><?= htmlspecialchars($pagamento['Valor']) ?></td>
        <td><?= htmlspecialchars($pagamento['Data_Pagamento']) ?></td>
        <td><?= htmlspecialchars($pagamento['Status_Pagamento']) ?></td>
        <td><?= htmlspecialchars($pagamento['Forma_Pagamento']) ?></td>
        <td><?= htmlspecialchars($pagamento['Id_Realiza']) ?></td>
        <td><?= htmlspecialchars($pagamento['Comprovante']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Manutenções</h2>
<table>
    <tr>
        <th>ID Manutenção</th>
        <th>Data de Manutenção</th>
        <th>Tipo de Manutenção</th>
        <th>Descrição</th>
        <th>KM</th>
        <th>Custo</th>
    </tr>
    <?php foreach ($manutencoes as $manutencao): ?>
    <tr>
        <td><?= htmlspecialchars($manutencao['Id_Manutencao']) ?></td>
        <td><?= htmlspecialchars($manutencao['Data_Manutencao']) ?></td>
        <td><?= htmlspecialchars($manutencao['Tipo_Manutencao']) ?></td>
        <td><?= htmlspecialchars($manutencao['Descricao']) ?></td>
        <td><?= htmlspecialchars($manutencao['KM']) ?></td>
        <td><?= htmlspecialchars($manutencao['Custo']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Feedbacks</h2>
<table>
    <tr>
        <th>ID Feedback</th>
        <th>Comentário</th>
        <th>Avaliação</th>
        <th>Data de Feedback</th>
    </tr>
    <?php foreach ($feedbacks as $feedback): ?>
    <tr>
        <td><?= htmlspecialchars($feedback['Id_Feedback']) ?></td>
        <td><?= htmlspecialchars($feedback['Comentario']) ?></td>
        <td><?= htmlspecialchars($feedback['Avaliacao']) ?></td>
        <td><?= htmlspecialchars($feedback['Data_Feedback']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Locações</h2>
<table>
    <tr>
        <th>Data de Locação</th>
        <th>Data de Devolução</th>
        <th>ID Locação</th>
        <th>Valor Total</th>
        <th>ID Carro</th>
        <th>ID Cliente</th>
    </tr>
    <?php foreach ($locacoes as $locacao): ?>
    <tr>
        <td><?= htmlspecialchars($locacao['Data_locacao']) ?></td>
        <td><?= htmlspecialchars($locacao['Data_Devolucao']) ?></td>
        <td><?= htmlspecialchars($locacao['Id_Locacao']) ?></td>
        <td><?= htmlspecialchars($locacao['Valor_Total']) ?></td>
        <td><?= htmlspecialchars($locacao['Id_Carro']) ?></td>
        <td><?= htmlspecialchars($locacao['Id_Cliente']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Faz</h2>
<table>
    <tr>
        <th>ID Cliente</th>
        <th>ID Feedback</th>
    </tr>
    <?php foreach ($faz as $f): ?>
    <tr>
        <td><?= htmlspecialchars($f['Id_Cliente']) ?></td>
        <td><?= htmlspecialchars($f['Id_Feedback']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Registra</h2>
<table>
    <tr>
        <th>ID Locação</th>
        <th>ID Feedback</th>
    </tr>
    <?php foreach ($registra as $r): ?>
    <tr>
        <td><?= htmlspecialchars($r['Id_Locacao']) ?></td>
        <td><?= htmlspecialchars($r['Id_Feedback']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h2>Realiza</h2>
<table>
    <tr>
        <th>ID Funcionário</th>
        <th>ID Manutenção</th>
    </tr>
    <?php foreach ($realiza as $r): ?>
    <tr>
        <td><?= htmlspecialchars($r['Id_Funcionario']) ?></td>
        <td><?= htmlspecialchars($r['Id_Manutencao']) ?></td>
    </tr>
    <?php endforeach; ?>
</table>

</body>
</html>
