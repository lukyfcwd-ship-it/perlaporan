import 'package:flutter/material.dart';
import '../../widgets/sidebar_drawer.dart';
import 'buat_pengaduan_screen.dart';

class DashboardSiswa extends StatelessWidget {
  const DashboardSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Siswa', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer: const SidebarDrawer(role: 'Siswa'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Welcome
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF4A47F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Selamat pagi ✨', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  const Text('Andaryoko Wisnu Murti', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Lihat ada sarana sekolah yang rusak? Laporkan sekarang.', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const BuatPengaduanScreen()));
                    },
                    icon: const Icon(Icons.add, color: Color(0xFF4A47F5)),
                    label: const Text('Buat Pengaduan Baru', style: TextStyle(color: Color(0xFF4A47F5))),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Stat Cards
            Row(
              children: [
                _buildStatCard('Total Laporan', '1', Icons.file_copy, Colors.blue),
                const SizedBox(width: 10),
                _buildStatCard('Menunggu', '1', Icons.pending_actions, Colors.orange),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildStatCard('Disetujui', '0', Icons.check_circle_outline, Colors.green),
                const SizedBox(width: 10),
                _buildStatCard('Selesai', '0', Icons.done_all, Colors.teal),
              ],
            ),
            
            const SizedBox(height: 20),
            const Text('Riwayat Terbaru', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey.shade200)),
              child: ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.orange, child: Icon(Icons.pending, color: Colors.white)),
                title: const Text('Kipas angin kelas mati'),
                subtitle: const Text('21 Okt 2026 • LAB RPL'),
                trailing: const Chip(label: Text('Menunggu', style: TextStyle(color: Colors.white)), backgroundColor: Colors.orange),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            Text(count, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
