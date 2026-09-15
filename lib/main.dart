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
      home: UbahWarnaPage(),
    );
  }
}

class UbahWarnaPage extends StatefulWidget {
  const UbahWarnaPage({super.key});

  @override
  State<UbahWarnaPage> createState() => _UbahWarnaPageState();
}

class _UbahWarnaPageState extends State<UbahWarnaPage> {
  // Daftar pilihan warna yang mencolok
  final List<Color> _daftarWarna = [
    Colors.white,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
  ];

  int _indexWarna = 0;

  void _gantiWarna() {
    setState(() {
      // Mengubah indeks warna berurutan
      _indexWarna = (_indexWarna + 1) % _daftarWarna.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna background berubah sesuai indeks
      backgroundColor: _daftarWarna[_indexWarna],
      appBar: AppBar(
        title: Text('Warna Ke-${_indexWarna + 1}'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white.withOpacity(0.8),
              child: Text(
                'Indeks Warna Saat Ini: $_indexWarna',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                // Panggil fungsi saat ditekan
                _gantiWarna();
              },
              child: const Text(
                'KLIK UNTUK GANTI WARNA',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
