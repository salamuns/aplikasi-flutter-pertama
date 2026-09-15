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
      home: InputTeksPage(),
    );
  }
}

class InputTeksPage extends StatefulWidget {
  const InputTeksPage({super.key});

  @override
  State<InputTeksPage> createState() => _InputTeksPageState();
}

class _InputTeksPageState extends State<InputTeksPage> {
  // 1. Buat controller untuk menampung teks dari TextField
  final TextEditingController _namaController = TextEditingController();

  // Variabel untuk menampilkan hasil input di layar
  String _hasilInput = 'Belum ada input';

  // 2. Wajib bersihkan controller saat halaman ditutup (mencegah memory leak)
  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

  void _tampilkanTeks() {
    setState(() {
      // 3. Ambil isi teks menggunakan properti .text milik controller
      if (_namaController.text.isEmpty) {
        _hasilInput = 'Kolom input tidak boleh kosong!';
      } else {
        _hasilInput = 'Halo, ${_namaController.text}!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Teks Flutter'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Komponen Input Teks (TextField)
            TextField(
              controller: _namaController, // Pasang controller di sini
              decoration: const InputDecoration(
                labelText: 'Masukkan Nama Kamu',
                hintText: 'Contoh: Budi',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol untuk mengambil dan menampilkan nilai
            ElevatedButton(
              onPressed: _tampilkanTeks,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Tampilkan Nama'),
            ),
            const SizedBox(height: 30),

            // Teks hasil pembacaan input
            Text(
              _hasilInput,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
