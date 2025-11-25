// Import Bahan
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Akademik Mahasiswa',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        
       // Font Teks
        textTheme: GoogleFonts.poppinsTextTheme( 
          Theme.of(context).textTheme,
        ),
        
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20, 
            fontWeight: FontWeight.w600, 
            color: Colors.white
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
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
    if (controllerEmailUser.text.isEmpty || controllerSandi.text.isEmpty) {
      setState(() {
        _pesanError = "**Email/NPM dan Password tidak boleh kosong!**";
      });
      return;
    }
    
    setState(() {
      _pesanError = null;
    });
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selamat Datang!', 
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins( 
                  fontSize: 24, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.indigo
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Akses cepat info akademik Anda.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.indigo,
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

              TextField(
                controller: controllerEmailUser, 
                decoration: InputDecoration(
                  labelText: 'NPM atau Email',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              
              TextField(
                controller: controllerSandi, 
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 35),
              
              ElevatedButton(
                onPressed: fungsiCekLogin, 
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  backgroundColor: Colors.indigo,
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Masuk Aplikasi', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)
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
      appBar: AppBar(
        title: const Text('Dashboard Akademik', style: TextStyle(fontWeight: FontWeight.bold),), 
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Halo, Wafa Rosyadi 👋', 
                    style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 4),
                  const Text('Selamat datang di dashboard Anda.', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo.shade400, Colors.blue.shade300],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))
                  ]
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tugas Baru!", style: TextStyle(color: Colors.white70, fontSize: 14)),
                    SizedBox(height: 5),
                    Text(
                      'Pemrograman Mobile', 
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Text('Menu Cepat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3, 
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: <Widget>[
                  _buatKotakMenu( 
                    context, 'Profil', Icons.person_outline, 
                    () { Navigator.pushNamed(context, '/profile'); }
                  ),
                  _buatKotakMenu(context, 'Data Nilai', Icons.grade_outlined, () {}),
                  _buatKotakMenu(context, 'Pengaturan', Icons.settings_outlined, () {}),
                  _buatKotakMenu(context, 'Jadwal', Icons.calendar_today_outlined, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buatKotakMenu(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5, spreadRadius: 1)
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 32, color: Colors.indigo), 
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)), 
          ],
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
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.indigo.shade50,
                  child: Icon(Icons.school_rounded, size: 70, color: Colors.indigo.shade300), 
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.edit, size: 15, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),

            Text(
              'Wafa Rosyadi',
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const Text("Teknik Informatika - 2023", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))
                ],
              ),
              child: Column(
                children: [
                  _buatBarisInfo(Icons.badge_outlined, 'NPM', '23670144'),
                  const Divider(),
                  _buatBarisInfo(Icons.email_outlined, 'Email', 'wafarosyadi24@mail.com'),
                  const Divider(),
                  _buatBarisInfo(Icons.class_outlined, 'Semester', '5 (Ganjil)'),
                ],
              ),
            ),
            
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () { Navigator.pop(context); }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade50,
                foregroundColor: Colors.red,
                elevation: 0,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
              ),
              child: const Text('Keluar Akun'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buatBarisInfo(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
