import 'package:flutter/material.dart';
import 'package:gojek_app/database_helper.dart'; // Ganti dengan impor yang sesuai

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> _driverData =
      {}; // Data driver yang akan diisi dari database

  @override
  void initState() {
    super.initState();
    loadDriverData(); // Panggil fungsi untuk memuat data driver saat layar pertama kali dibuka
  }

  Future<void> loadDriverData() async {
    // Mengambil data driver dari database
    _driverData = await DatabaseHelper().getDriverData();
    setState(() {}); // Memperbarui tampilan dengan data driver yang diperoleh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(_driverData['foto'] ??
                  ''), // Ganti dengan field foto yang sesuai
            ),
            SizedBox(height: 20),
            Text(
                'Nama: ${_driverData['nama'] ?? ''}'), // Ganti dengan field nama yang sesuai
            Text(
                'No. KTP: ${_driverData['no_ktp'] ?? ''}'), // Ganti dengan field no_ktp yang sesuai
            ElevatedButton(
              onPressed: () {
                // Buka layar edit profil dan kirim data driver untuk di-edit
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditProfileScreen(driverData: _driverData)),
                ).then((value) {
                  // Setelah layar edit ditutup, perbarui data driver
                  loadDriverData();
                });
              },
              child: Text('Edit Profil'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> driverData;

  EditProfileScreen({required this.driverData});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Buat controller untuk masing-masing field yang dapat diedit
  TextEditingController _namaController = TextEditingController();
  TextEditingController _noKtpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Isi controller dengan data driver yang diteruskan dari layar sebelumnya
    _namaController.text = widget.driverData['nama'];
    _noKtpController.text = widget.driverData['no_ktp'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profil')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama Driver'),
            ),
            TextField(
              controller: _noKtpController,
              decoration: InputDecoration(labelText: 'No. KTP'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,
                    '/editProfile'); // Navigasi ke layar EditProfileScreen
              },
              child: Text('Edit Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
