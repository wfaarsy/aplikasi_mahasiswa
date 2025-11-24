// main.dart - Kode Lengkap Aplikasi Akademik
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definisi Rute Aplikasi
    return MaterialApp(
      title: 'Aplikasi Akademik Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (konteks) => const HalamanLogin(), 
        '/dashboard': (konteks) => const HalamanUtama(),
        '/profile': (konteks) => const HalamanDataDiri(),
      },
    );
  }
}

// =========================================================================
// 1. Halaman Login
// =========================================================================

class HalamanLogin extends StatefulWidget { 
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _StateLogin();
}

class _StateLogin extends State<HalamanLogin> { 
  final TextEditingController controllerEmailUser = TextEditingController(); 
  final TextEditingController controllerSandi = TextEditingController(); 
  String? _pesanError;

  void fungsiCekLogin() {
    // Validasi: Cek input kosong
    if (controllerEmailUser.text.isEmpty || controllerSandi.text.isEmpty) {
      setState(() {
        _pesanError = "**Email/NPM dan Password tidak boleh kosong!**";
      });
      return;
    }
    
    // Navigasi ke Dashboard
    setState(() {
      _pesanError = null;
    });
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Masuk Aplikasi")),
      body: Center(
        child: SingleChildScrollView(
          // Padding 
          padding: const EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 20.0),
          // Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text (Judul & Deskripsi)
              const Text(
                'Selamat Datang, Mahasiswa Informatika!', 
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.indigo),
              ),
              const SizedBox(height: 10),
              const Text(
                'Akses cepat info akademik Anda.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              //  Gambar (Icon Avatar)
              const Icon(
                Icons.account_box_rounded,
                size: 110,
                color: Colors.indigoAccent,
              ),
              const SizedBox(height: 30),
              
              if (_pesanError != null) 
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    _pesanError!,
                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),

              // TextField: Email/NPM
              TextField(
                controller: controllerEmailUser, 
                decoration: InputDecoration(
                  labelText: 'NPM atau Email',
                  prefixIcon: const Icon(Icons.person), // Icon
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              // TextField: Password
              TextField(
                controller: controllerSandi, 
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  prefixIcon: const Icon(Icons.lock), // Icon
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 35),
              // Tombol Login
              ElevatedButton(
                onPressed: fungsiCekLogin, // Tombol dengan fungsi Navigator
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Masuk Sekarang', 
                  style: TextStyle(fontSize: 18, color: Colors.white)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =========================================================================
// 2. Halaman Dasboard
// =========================================================================

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dan Icon Notifikasi
      appBar: AppBar(
        title: const Text('Dashboard Akademik'), 
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.notifications_active), // Icon
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //  Column
          children: <Widget>[
            // Header User
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Halo, Wafa Rosyadi 👋'), // Text
                  const SizedBox(height: 4),
                  const Text('Selamat datang di dashboard Anda.'), // Text
                ],
              ),
            ),

            // Gambar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Pemberitahuan Tugas Baru!', 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 52, 100),
                    ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Text('Menu Cepat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),

            // Menu dalam bentuk Grid (minimal 3 item)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3, 
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  // Menu 1: Profil (Pakai Navigator)
                  _buatKotakMenu( 
                    context, 'Profil', Icons.person_pin, 
                    () { Navigator.pushNamed(context, '/profile'); } // Navigator
                  ),
                  // Menu 2: Data
                  _buatKotakMenu(context, 'Data Nilai', Icons.grade, () {}),
                  // Menu 3: Pengaturan
                  _buatKotakMenu(context, 'Pengaturan', Icons.settings, () {}),
                  _buatKotakMenu(context, 'Jadwal Kuliah', Icons.calendar_month, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Pembantu Menu Item (Icon + Text)
  Widget _buatKotakMenu(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40, color: Colors.indigo), //  Icon
              const SizedBox(height: 8),
              Text(title, textAlign: TextAlign.center), // Text
            ],
          ),
        ),
      ),
    );
  }
}

// =========================================================================
// 3. Halaman Profil
// =========================================================================

class HalamanDataDiri extends StatelessWidget {
  const HalamanDataDiri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Informasi Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 25.0),
        // Column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Foto / Avatar 
            const CircleAvatar(
              radius: 65,
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.school, size: 85, color: Colors.white), // Gambar/Icon
            ),
            const SizedBox(height: 25),

            //  Text Nama
            const Text(
              'Wafa Rosyadi',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 15),

            // Container Data
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.indigo.shade100, width: 2)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buatBarisInfo('NPM', '23670144'),
                  _buatBarisInfo('Alamat Email', 'wafarosyadi24@mail.com'),
                  const Divider(height: 30, thickness: 1.5),
                  
                  //  Row kecil untuk info lain
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: [
                      _blokInfo('Fakultas', 'Teknik & Informatika'),
                      _blokInfo('Semester', '5 (Ganjil)'),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 50),

            // Tombol Kembali ke Dashboard
            ElevatedButton.icon(
              onPressed: () { Navigator.pop(context); }, // Navigator
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
              label: const Text(
                'Kembali ke Dashboard Utama',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Pembantu Baris Info
  Widget _buatBarisInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
  
  // Widget Pembantu Blok Info Row
  Widget _blokInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.indigo)),
      ],
    );
  }
}