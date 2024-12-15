<?php
include '../db_config.php';

$sql = "SELECT * FROM pengunjung";
$result = $conn->query($sql);

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>
