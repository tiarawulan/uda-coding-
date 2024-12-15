<?php
// Menghubungkan ke database
include 'db_config.php';

// Cek apakah data 'id_library' dan 'password' sudah ada di dalam request POST
if (isset($_POST['IDLibrary']) && isset($_POST['password'])) {
    // Menangkap data dari form login
    $IDLibrary = $_POST['IDLibrary'];
    $password = md5($_POST['password']); // Menggunakan MD5 untuk password (Catatan: Sebaiknya menggunakan password_hash() di masa depan)

    // Cek apakah tabel 't_admin' ada di database
    $sql_check = "SHOW TABLES LIKE 't_admin'";
    $result_check = $conn->query($sql_check);

    if ($result_check && $result_check->num_rows > 0) {
        // Tabel 't_admin' ada, lanjutkan query
        // Query untuk mencari data admin yang cocok dengan IDLibrary dan password
        $sql = "SELECT * FROM t_admin WHERE IDLibrary = '$IDLibrary' AND password = '$password'";
        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            // Jika data ditemukan, login berhasil
            $admin = $result->fetch_assoc();
            echo json_encode(["success" => true, "message" => "Login berhasil", "data" => $admin]);
        } else {
            // Jika ID Library atau password tidak sesuai
            echo json_encode(["success" => false, "message" => "ID Library atau password salah"]);
        }
    } else {
        // Jika tabel 't_admin' tidak ada
        echo json_encode(["success" => false, "message" => "Tabel t_admin tidak ditemukan di database"]);
    }
} else {
    // Jika data 'id_library' atau 'password' tidak ditemukan dalam POST
    echo json_encode(["success" => false, "message" => "ID Library atau password tidak ditemukan"]);
}
?>
