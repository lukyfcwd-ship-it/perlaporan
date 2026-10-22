import 'package:flutter/material.dart';

class BuatPengaduanScreen extends StatelessWidget {
  const BuatPengaduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Pengaduan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Form Pengaduan Kerusakan Sarana', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                
                const Text('Judul Pengaduan'),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Contoh: Kipas angin kelas mati',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Kategori Sarana'),
                          const SizedBox(height: 5),
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(border: OutlineInputBorder()),
                            items: ['Elektronik', 'Furnitur', 'Bangunan'].map((String val) {
                              return DropdownMenuItem(value: val, child: Text(val));
                            }).toList(),
                            onChanged: (val) {},
                            hint: const Text('-- Tidak diketahui --'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Lokasi Kerusakan'),
                          const SizedBox(height: 5),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Contoh: LAB RPL',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const Text('Deskripsi Kerusakan'),
                const SizedBox(height: 5),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Jelaskan kondisi kerusakan secara rinci...',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                const Text('Bukti Foto (opsional, maks 2MB)'),
                const SizedBox(height: 5),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Pilih File'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300, foregroundColor: Colors.black),
                ),
                const SizedBox(height: 32),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pengaduan Berhasil Dikirim!')));
                        Navigator.pop(context);
                      },
                      child: const Text('Kirim Pengaduan'),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
