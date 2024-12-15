import 'package:flutter/material.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idLibraryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _login() async {
    final idLibrary = _idLibraryController.text;
    final password = _passwordController.text;

    if (idLibrary.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Semua field wajib diisi")));
      return;
    }

    try {
      final response = await _apiService.login(idLibrary, password);
      if (response['success']) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login berhasil")));
        // Navigasi ke halaman home (buat halaman ini jika diperlukan)
        // Navigator.pushReplacementNamed(context, '/home');
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
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idLibraryController,
              decoration: InputDecoration(labelText: "ID Library"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text("Login"),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Belum punya akun? Daftar sekarang!"),
            ),
          ],
        ),
      ),
    );
  }
}
