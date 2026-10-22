import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/siswa/dashboard_siswa.dart';
import '../screens/siswa/buat_pengaduan_screen.dart';

class SidebarDrawer extends StatelessWidget {
  final String role;
  const SidebarDrawer({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1B1B29), // Warna sidebar gelap
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white24)),
            ),
            child: Row(
              children: [
                Icon(Icons.construction, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('D-Laporr', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('SARANA SEKOLAH', style: TextStyle(color: Colors.white70, fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
          
          if (role == 'Siswa') ...[
            _buildMenuItem(context, Icons.dashboard, 'Dashboard', () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardSiswa()));
            }),
            _buildMenuItem(context, Icons.file_copy, 'Pengaduan Saya', () {}),
            _buildMenuItem(context, Icons.add_circle_outline, 'Buat Pengaduan', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BuatPengaduanScreen()));
            }),
          ] else ...[
             _buildMenuItem(context, Icons.dashboard, 'Dashboard', () {}),
             _buildMenuItem(context, Icons.folder, 'Data Pengaduan', () {}),
             _buildMenuItem(context, Icons.print, 'Rekap & Cetak PDF', () {}),
          ],
          
          const Spacer(),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white70),
            title: const Text('Keluar', style: TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(builder: (_) => const LoginScreen()), 
                (route) => false
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
