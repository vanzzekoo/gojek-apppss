// lib/send_package_screen.dart

import 'package:flutter/material.dart';

class SendPackageScreen extends StatefulWidget {
  @override
  _SendPackageScreenState createState() => _SendPackageScreenState();
}

class _SendPackageScreenState extends State<SendPackageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kirim Barang')),
      body: Center(
        child: Column(
          children: [
            // Tampilkan form untuk foto, input koordinat, dan hitung jarak
            ElevatedButton(
              onPressed: () {
                // Simpan data pengiriman ke dalam database
              },
              child: Text('Kirim Barang'),
            ),
          ],
        ),
      ),
    );
  }
}
