import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oetan Kayoe Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  // 1. Variabel penanda halaman mana yang sedang aktif (0 = Beranda, 1 = Daftar, 2 = Profil)
  int _selectedIndex = 0;

  // 2. Daftar halaman yang akan ditampilkan sesuai menu bawah yang diklik
  final List<Widget> _pages = [
    const HomeScreen(),
    const ListScreen(),
    const ProfileScreen(),
  ];

  // 3. Fungsi untuk mengupdate posisi tab yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oetan Kayoe App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Menampilkan halaman sesuai indeks yang dipilih
      body: _pages[_selectedIndex],
      // Menu Navigasi Bawah
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Daftar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// --- Komponen Layar / Halaman ---

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 80, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Selamat Datang di Beranda',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Item Menu ${index + 1}'),
            subtitle: const Text('Deskripsi singkat item'),
          ),
        );
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 16),
          Text(
            'Pengguna Oetan Kayoe',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text('user@oetankayoe.com', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
