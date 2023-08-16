import 'package:flutter/material.dart';
import 'package:gojek_app/database_helper.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _noKtpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDriverData();
  }

  Future<void> _loadDriverData() async {
    Map<String, dynamic> driverData = await DatabaseHelper().getDriverData();
    _namaController.text = driverData['nama'];
    _noKtpController.text = driverData['no_ktp'];
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
              onPressed: () async {
                Map<String, dynamic> updatedDriverData = {
                  'nama': _namaController.text,
                  'no_ktp': _noKtpController.text,
                };
                await DatabaseHelper().saveDriverData(updatedDriverData);
                Navigator.pop(context); // Kembali ke layar sebelumnya
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
