<?php
function getTableData($conn, $table) {
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);
    return $result;
}
?>
