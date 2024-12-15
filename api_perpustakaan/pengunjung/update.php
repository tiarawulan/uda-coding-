<?php
include '../db_config.php';

$id = $_POST['id'];
$nama = $_POST['nama'];
$email = $_POST['email'];
$no_hp = $_POST['no_hp'];
$level = $_POST['level'];
$alamat = $_POST['alamat'];

$sql = "UPDATE pengunjung SET nama = '$nama', email = '$email', no_hp = '$no_hp', level = '$level', alamat = '$alamat' WHERE id = $id";

if ($conn->query($sql) === TRUE) {
    echo json_encode(["success" => true, "message" => "Data berhasil diperbarui"]);
} else {
    echo json_encode(["success" => false, "message" => "Error: " . $conn->error]);
}
?>
