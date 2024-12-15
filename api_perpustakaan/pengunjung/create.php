<?php
include '../db_config.php';

$nama = $_POST['nama'];
$id_library = $_POST['id_library'];
$email = $_POST['email'];
$password = md5($_POST['password']);
$no_hp = $_POST['no_hp'];
$level = $_POST['level'];
$alamat = $_POST['alamat'];

$sql = "INSERT INTO pengunjung (nama, id_library, email, password, no_hp, level, alamat) VALUES ('$nama', '$id_library', '$email', '$password', '$no_hp', '$level', '$alamat')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(["success" => true, "message" => "Pengunjung berhasil ditambahkan"]);
} else {
    echo json_encode(["success" => false, "message" => "Error: " . $conn->error]);
}
?>
