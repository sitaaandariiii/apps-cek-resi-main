import 'package:aplikasi_cek_resi/view/cek_resi_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: 100,
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("asset/nira.png"),
          ),
        ),
        actions: [
          Center(
            child: Text("Aplikasi",
                style: TextStyle(
                  fontSize: 24,
                )),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ListTile(
                  tileColor: Colors.white,
                  title: Text(
                    'Cek Resi Sekarang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff113948),
                    ),
                  ),
                ),
                ListTile(
                  tileColor: Colors.white,
                  title: Text(
                    'Paket Anda',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff113948),
                    ),
                  ),
                  subtitle: Text(
                    'Paket yang sedang  dalam tujuan dan proses',
                    style: TextStyle(
                      color: Color(0xff113948),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Divider(),
                Text(
                  "Pilih Expedisi",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Divider(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CekResiScreen(expedisi: "jne"),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      color: Color(0xff006289),
                      child: Image.asset(
                        'asset/jne.png',
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CekResiScreen(expedisi: "jnt"),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff006289),
                      child: Image.asset(
                        'asset/j&t.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0xff006289),
                    child: Image.asset(
                      'asset/ninja.png',
                      color: Colors.white,
                    ),
                  ),
                  Card(
                    color: Color(0xff006289),
                    child: Image.asset(
                      'asset/id.png',
                      fit: BoxFit.cover,
                      color: Colors.white,
                    ),
                  ),
                  Card(
                    color: Color(0xff006289),
                    child: Image.asset(
                      'asset/sicepat.png',
                      color: Colors.white,
                    ),
                  ),
                  Card(
                    color: Color(0xff006289),
                    child: Image.asset(
                      'asset/anteraja.png',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
              child: Text("API Public @ binderbyte",
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
