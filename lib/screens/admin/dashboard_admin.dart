import 'package:flutter/material.dart';
import '../../widgets/sidebar_drawer.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer: const SidebarDrawer(role: 'Admin'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Admin
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF4A47F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Selamat pagi,', style: TextStyle(color: Colors.white70)),
                      const SizedBox(height: 8),
                      const Text('Admin Sarana', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text('Ada 3 pengaduan yang menunggu verifikasi.', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.print, color: Color(0xFF4A47F5)),
                    label: const Text('Cetak Rekap', style: TextStyle(color: Color(0xFF4A47F5))),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Pengaduan Terbaru Table (Simulated in a Card list for mobile view)
            const Text('Pengaduan Terbaru', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildAdminListTile('TIK-20261019-3WPM', 'kursi', 'Andaryoko Wisnu', 'Selesai', Colors.teal),
            _buildAdminListTile('TIK-20261019-Y10G', 'Kipas mati', 'Andaryoko Wisnu', 'Menunggu', Colors.orange),
            _buildAdminListTile('TIK-20261019-2PHU', 'Kursi rusak', 'Andaryoko Wisnu', 'Ditolak', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminListTile(String tiket, String judul, String pelapor, String status, Color statusColor) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey.shade200)),
      child: ListTile(
        title: Text(judul, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Tiket: $tiket\nPelapor: $pelapor'),
        trailing: Chip(
          label: Text(status, style: const TextStyle(color: Colors.white)),
          backgroundColor: statusColor,
        ),
      ),
    );
  }
}
