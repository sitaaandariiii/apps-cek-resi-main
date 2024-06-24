import 'package:aplikasi_cek_resi/view/detail_resi_screen.dart';
import 'package:flutter/material.dart';

class CekResiScreen extends StatefulWidget {
  final String expedisi;
  const CekResiScreen({super.key, required this.expedisi});

  @override
  State<CekResiScreen> createState() => _CekResiScreenState();
}

class _CekResiScreenState extends State<CekResiScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _resiCtrl;

  @override
  void initState() {
    _resiCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _resiCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Masukan Nomor Resi yang tertera di Surat yang diberikan",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _resiCtrl,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Masukan nomor resi",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Harap isi nomor resi";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 25,
                  ),
                  backgroundColor: Color(0xff113948),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailResiScreen(
                                expedisi: widget.expedisi,
                                nomorResi: _resiCtrl.text)));
                  }
                },
                child: Text("CEK RESI"))
          ],
        ),
      ),
    );
  }
}
