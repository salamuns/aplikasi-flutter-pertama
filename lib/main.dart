import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// 1. Ubah komponen utama menjadi StatefulWidget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variabel penampung data yang akan berubah
  int _jumlahKlik = 0;
  String _pesan = 'Tombol belum ditekan';

  // Fungsi untuk mengubah data
  void _tambahKlik() {
    // 2. Wajib gunakan setState() agar layar merespons perubahan!
    setState(() {
      _jumlahKlik++;
      _pesan = 'Tombol sudah ditekan $_jumlahKlik kali!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Interaktif'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _pesan,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _tambahKlik, // Dipanggil saat tombol ditekan
              child: const Text('Tekan Saya'),
            ),
          ],
        ),
      ),
    );
  }
}
