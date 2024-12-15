import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _idLibraryController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _register() async {
    final data = {
      'nama': _namaController.text,
      'id_library': _idLibraryController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    if (data.values.any((value) => value.isEmpty)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Semua field wajib diisi")));
      return;
    }

    try {
      final response = await _apiService.register(data);
      if (response['success']) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registrasi berhasil")));
        Navigator.pop(context); // Kembali ke halaman login
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response['message'])));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Terjadi kesalahan")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: _namaController,
                decoration: InputDecoration(labelText: "Nama")),
            TextField(
                controller: _idLibraryController,
                decoration: InputDecoration(labelText: "ID Library")),
            TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email")),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text("Daftar"),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Sudah punya akun? Login sekarang!"),
            ),
          ],
        ),
      ),
    );
  }
}
