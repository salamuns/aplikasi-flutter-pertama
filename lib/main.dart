import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanDaftarBuah(),
    );
  }
}

// ==================== 1. HALAMAN UTAMA (LISTVIEW) ====================
class HalamanDaftarBuah extends StatelessWidget {
  const HalamanDaftarBuah({super.key});

  final List<Map<String, dynamic>> _daftarBuah = const [
    {
      'nama': 'Apel',
      'deskripsi': 'Apel adalah buah yang kaya akan serat dan vitamin C. Cocok untuk konsumsi harian.',
      'icon': Icons.apple,
      'color': Colors.red,
    },
    {
      'nama': 'Pisang',
      'deskripsi': 'Pisang memberikan pasokan energi cepat dan kaya akan potasium.',
      'icon': Icons.lunch_dining,
      'color': Colors.amber,
    },
    {
      'nama': 'Alpukat',
      'deskripsi': 'Alpukat mengandung lemak tak jenuh tunggal yang baik untuk kesehatan jantung.',
      'icon': Icons.eco,
      'color': Colors.green,
    },
    {
      'nama': 'Jeruk',
      'deskripsi': 'Jeruk terkenal dengan kandungan Vitamin C yang tinggi untuk daya tahan tubuh.',
      'icon': Icons.brightness_5,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Buah'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _daftarBuah.length,
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (context, index) {
          final buah = _daftarBuah[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: buah['color'],
                child: Icon(buah['icon'], color: Colors.white),
              ),
              title: Text(
                buah['nama'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Klik untuk lihat detail'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // KIRIM DATA KE HALAMAN DETAIL SAAT DIKLIK
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanDetailBuah(dataBuah: buah),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ==================== 2. HALAMAN DETAIL (PENERIMA DATA) ====================
class HalamanDetailBuah extends StatelessWidget {
  // Tangkap data melalui variabel ini
  final Map<String, dynamic> dataBuah;

  const HalamanDetailBuah({super.key, required this.dataBuah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataBuah['nama']),
        backgroundColor: dataBuah['color'],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView( // Aman dari overflow
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // Tampilan Icon Besar dari data yang dikirim
                CircleAvatar(
                  radius: 60,
                  backgroundColor: dataBuah['color'],
                  child: Icon(
                    dataBuah['icon'],
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // Nama Buah
                Text(
                  dataBuah['nama'],
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: dataBuah['color'],
                  ),
                ),
                const SizedBox(height: 16),

                // Deskripsi Buah
                Text(
                  dataBuah['deskripsi'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 30),

                // Tombol Kembali
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dataBuah['color'],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali ke Daftar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
