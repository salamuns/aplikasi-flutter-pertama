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
      home: InputTeksWarnaDinamisPage(),
    );
  }
}

class InputTeksWarnaDinamisPage extends StatefulWidget {
  const InputTeksWarnaDinamisPage({super.key});

  @override
  State<InputTeksWarnaDinamisPage> createState() => _InputTeksWarnaDinamisPageState();
}

class _InputTeksWarnaDinamisPageState extends State<InputTeksWarnaDinamisPage> {
  final TextEditingController _namaController = TextEditingController();

  final List<Color> _koleksiWarna = [
    Colors.grey,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.teal,
  ];

  final List<IconData> _koleksiIcon = [
    Icons.person_outline,
    Icons.face,
    Icons.sentiment_satisfied_alt,
    Icons.thumb_up,
    Icons.star,
    Icons.favorite,
    Icons.rocket_launch,
    Icons.verified,
  ];

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String nama = _namaController.text;
    int panjangKarakter = nama.length;

    int indexWarna = panjangKarakter % _koleksiWarna.length;
    Color warnaAktif = _koleksiWarna[indexWarna];
    IconData iconAktif = _koleksiIcon[indexWarna];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Teks & Warna Dinamis'),
        backgroundColor: warnaAktif,
        foregroundColor: Colors.white,
      ),
      // 1. SingleChildScrollView membuat seluruh isi layar bisa di-scroll
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Avatar & Ikon Utama
              CircleAvatar(
                radius: 50,
                backgroundColor: warnaAktif,
                child: Icon(
                  iconAktif,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Teks Nama & Panjang Karakter
              Text(
                nama.isEmpty ? 'Ketik nama kamu di bawah:' : 'Halo, $nama!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: warnaAktif,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Panjang karakter: $panjangKarakter',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // Kolom Input
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Masukkan Nama',
                  hintText: 'Coba ketik beberapa huruf...',
                  prefixIcon: Icon(Icons.palette, color: warnaAktif),
                  suffixIcon: nama.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _namaController.clear();
                            });
                          },
                        )
                      : null,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: warnaAktif, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (val) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
