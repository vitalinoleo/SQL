<?php
include 'functions.php';
// Conectar ao banco de dados PostgreSQL
$pdo = pdo_connect_pgsql();
// Obter a página via solicitação GET (parâmetro URL: page), se não existir, defina a página como 1 por padrão
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
// Número de registros para mostrar em cada página
$records_per_page = 5;

// Preparar a instrução SQL e obter registros da tabela contacts, LIMIT irá determinar a página
$stmt = $pdo->prepare('SELECT * FROM contatos ORDER BY id_contato OFFSET :offset LIMIT :limit');
$stmt->bindValue(':offset', ($page - 1) * $records_per_page, PDO::PARAM_INT);
$stmt->bindValue(':limit', $records_per_page, PDO::PARAM_INT);
$stmt->execute();
// Buscar os registros para exibi-los em nosso modelo.
$contacts = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Obter o número total de contatos, isso é para determinar se deve haver um botão de próxima e anterior
$num_contacts = $pdo->query('SELECT COUNT(*) FROM contatos')->fetchColumn();
?>


<?=template_header('Pesquisar Pedidos')?>

<div class="content read">
    <h2>Pesquisar Pedidos</h2>

    <!-- Formulário de pesquisa -->
    <form action="" method="get">
        <label for="search">Pesquisar por Nome:</label>
        <input type="text" id="search" name="search" placeholder="Digite o nome do cliente">
        <input type="submit" value="Pesquisar">
    </form>

    <?php
    // Verificar se houve uma pesquisa
    if(isset($_GET['search']) && !empty($_GET['search'])) {
        // Limpar a entrada para evitar injeção de SQL
        $search = htmlspecialchars($_GET['search']);
        // Preparar a instrução SQL para buscar o cliente com o no me pesquisado
        $stmt = $pdo->prepare('SELECT * FROM contatos WHERE nome LIKE ?');
        // Executar a consulta com o nome do cliente pesquisado
        $stmt->execute(["%$search%"]);
        // Buscar os resultados da consulta
        $contacts = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Verificar se foi encontrado um cliente com o nome pesquisado
        if(count($contacts) > 0) {
            // Exibir a tabela de pedidos somente se um cliente foi encontrado
    ?>
    <table>
        <thead>
            <tr>
                <td>#</td>
                <td>Nome</td>
                <td>Email</td>
                <td>Celular</td>
                <td>Pizza</td>
                <td>Data do Pedido</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($contacts as $contact): ?>
            <tr>
                <td><?=$contact['id_contato']?></td>
                <td><?=$contact['nome']?></td>
                <td><?=$contact['email']?></td>
                <td><?=$contact['cel']?></td>
                <td><?=$contact['pizza']?></td>
                <td><?=$contact['cadastro']?></td>
                <td class="actions">
                    <a href="update.php?id=<?=$contact['id_contato']?>" class="edit"><i class="fas fa-pen fa-xs"></i></a>
                    <a href="delete.php?id=<?=$contact['id_contato']?>" class="trash"><i class="fas fa-trash fa-xs"></i></a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <?php
        } else {
            // Se nenhum cliente for encontrado com o nome pesquisado, exibir uma mensagem
            echo "<p>Nenhum cliente encontrado com o nome '$search'.</p>";
        }
    }
    ?>
</div>

<?php
// Função para exibir a tabela de contatos
function display_contacts_table($contacts) {
    echo <<<EOT
<div class="content read">
    <h2>Pesquisar Pedidos</h2>
    <table>
        <thead>
            <tr>
                <td>#</td>
                <td>Nome</td>
                <td>Email</td>
                <td>Celular</td>
                <td>Pizza</td>
                <td>Data do Pedido</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
EOT;

    foreach ($contacts as $contact) {
        echo "<tr>
                <td>{$contact['id_contato']}</td>
                <td>{$contact['nome']}</td>
                <td>{$contact['email']}</td>
                <td>{$contact['cel']}</td>
                <td>{$contact['pizza']}</td>
                <td>{$contact['cadastro']}</td>
                <td class='actions'>
                    <a href='update.php?id={$contact['id_contato']}' class='edit'><i class='fas fa-pen fa-xs'></i></a>
                    <a href='delete.php?id={$contact['id_contato']}' class='trash'><i class='fas fa-trash fa-xs'></i></a>
                </td>
            </tr>";
    }

    echo <<<EOT
        </tbody>
    </table>
</div>
EOT;
} 

// Função para listar todos os clientes cadastrados
function listar_clientes() {
    global $pdo;
    $stmt = $pdo->query('SELECT * FROM clientes');
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Função para listar todos os pedidos realizados em um determinado período
function listar_pedidos_por_periodo($inicio, $fim) {
    global $pdo;
    $stmt = $pdo->prepare('SELECT * FROM pedidos WHERE data_pedido BETWEEN :inicio AND :fim');
    $stmt->execute(['inicio' => $inicio, 'fim' => $fim]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Função para listar os itens de um pedido específico
function listar_itens_pedido($id_pedido) {
    global $pdo;
    $stmt = $pdo->prepare('SELECT * FROM itens_pedido WHERE id_pedido = :id_pedido');
    $stmt->execute(['id_pedido' => $id_pedido]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Função para calcular o total gasto por um cliente
function calcular_total_gasto_por_cliente($id_cliente) {
    global $pdo;
    $stmt = $pdo->prepare('SELECT SUM(preco) AS total_gasto FROM pedidos WHERE id_cliente = :id_cliente');
    $stmt->execute(['id_cliente' => $id_cliente]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    return $result['total_gasto'];
}

// Função para listar os sabores de pizza mais populares
function listar_sabores_pizza_mais_populares() {
    global $pdo;
    $stmt = $pdo->query('SELECT p.nome AS nome_pizza, COUNT(ip.pizza_id) AS quantidade_pedidos
                         FROM pizzas AS p
                         LEFT JOIN itens_pedido AS ip ON p.id_pizza = ip.pizza_id
                         GROUP BY p.id_pizza, p.nome
                         ORDER BY quantidade_pedidos DESC');
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


?>





<?=template_footer()?>
