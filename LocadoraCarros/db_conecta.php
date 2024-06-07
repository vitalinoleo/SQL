<?php
$servername = "localhost";
$username = "postgres";
$password = "postgres";
$dbname = "locadora_carros";


// Criando a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificando a conexão
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
