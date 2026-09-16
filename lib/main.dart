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
      home: DaftarItemPage(),
    );
  }
}

class DaftarItemPage extends StatelessWidget {
  const DaftarItemPage({super.key});

  // Data contoh yang akan ditampilkan di dalam ListView
  final List<Map<String, dynamic>> _daftarBuah = const [
    {'nama': 'Apel', 'subtitle': 'Buah manis kaya serat', 'icon': Icons.apple, 'color': Colors.red},
    {'nama': 'Pisang', 'subtitle': 'Sumber potasium dan energi', 'icon': Icons.lunch_dining, 'color': Colors.amber},
    {'nama': 'Alpukat', 'subtitle': 'Lemak baik untuk kesehatan', 'icon': Icons.eco, 'color': Colors.green},
    {'nama': 'Jeruk', 'subtitle': 'Kaya akan Vitamin C', 'icon': Icons.brightness_5, 'color': Colors.orange},
    {'nama': 'Anggur', 'subtitle': 'Mengandung antioksidan tinggi', 'icon': Icons.grain, 'color': Colors.purple},
    {'nama': 'Semangka', 'subtitle': 'Segar dan menghidrasi tubuh', 'icon': Icons.water_drop, 'color': Colors.redAccent},
    {'nama': 'Stroberi', 'subtitle': 'Rasa asam manis menyegarkan', 'icon': Icons.favorite, 'color': Colors.pink},
    {'nama': 'Nanas', 'subtitle': 'Baik untuk pencernaan', 'icon': Icons.wb_sunny, 'color': Colors.yellow},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buah (ListView)'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      // ListView.builder otomatis aman dari error RenderFlex Overflow!
      body: ListView.builder(
        itemCount: _daftarBuah.length, // Jumlah item dalam daftar
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (context, index) {
          final buah = _daftarBuah[index];

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: buah['color'],
                child: Icon(buah['icon'], color: Colors.white),
              ),
              title: Text(
                buah['nama'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(buah['subtitle']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Memberikan respon saat salah satu baris item diklik
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Kamu memilih buah ${buah['nama']}'),
                    duration: const Duration(seconds: 1),
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
