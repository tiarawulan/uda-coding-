<?php
include 'db_config.php';

// Cek apakah data POST ada
if (isset($_POST['nama'], $_POST['IDLibrary'], $_POST['email'], $_POST['password'])) {
    $nama = $_POST['nama'];
    $id_library = $_POST['IDLibrary'];
    $email = $_POST['email'];
    $password = md5($_POST['password']); // Hash password

    $sql = "INSERT INTO admin (nama, IDLibrary, email, password) VALUES ('$nama', '$id_library', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["success" => true, "message" => "Registrasi berhasil"]);
    } else {
        echo json_encode(["success" => false, "message" => "Error: " . $conn->error]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Data tidak lengkap"]);
}
?>
