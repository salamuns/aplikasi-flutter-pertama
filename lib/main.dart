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
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const DynamicListPage(),
    );
  }
}

// Menggunakan StatefulWidget karena data daftar item bisa berubah-ubah
class DynamicListPage extends StatefulWidget {
  const DynamicListPage({super.key});

  @override
  State<DynamicListPage> createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  // 1. Controller untuk menangkap teks input dari user
  final TextEditingController _textController = TextEditingController();

  // 2. List data awal
  final List<String> _daftarKegiatan = [
    'Belajar Dasar Flutter',
    'Membuat Build APK via GitHub Actions',
    'Eksplorasi ListView Dinamis',
  ];

  // 3. Fungsi untuk menambah item ke daftar
  void _tambahItem() {
    final teks = _textController.text.trim();
    if (teks.isNotEmpty) {
      setState(() {
        _daftarKegiatan.add(teks); // Tambah data baru ke list
      });
      _textController.clear(); // Bersihkan kolom input setelah ditambah
    }
  }

  // 4. Fungsi untuk menghapus item dari daftar berdasarkan index
  void _hapusItem(int index) {
    final itemDihapus = _daftarKegiatan[index];
    setState(() {
      _daftarKegiatan.removeAt(index); // Hapus data dari list
    });

    // Tampilkan notifikasi singkat (SnackBar)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"$itemDihapus" berhasil dihapus'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose(); // Hapus controller saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Dinamis (CRUD)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian Input Teks & Tombol Tambah
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Tambah kegiatan baru...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
                    ),
                  ),
                  onPressed: _tambahItem,
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Bagian Tampilan ListView (Menggunakan Expanded agar fleksibel mengikuti tinggi layar)
            Expanded(
              child: _daftarKegiatan.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada kegiatan.\nSilakan tambah di atas!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _daftarKegiatan.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.indigo.shade100,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(_daftarKegiatan[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _hapusItem(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
