import 'package:flutter/material.dart';
import '../siswa/dashboard_siswa.dart';
import '../admin/dashboard_admin.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.construction, size: 80, color: Color(0xFF4A47F5)),
              const SizedBox(height: 16),
              const Text(
                'Masuk ke D-Laporr',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email / ID Pengguna',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Kata Sandi',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Simulasi login siswa
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardSiswa()));
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                child: const Text('Login Siswa'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  // Simulasi login admin
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardAdmin()));
                },
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                child: const Text('Login Admin'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
