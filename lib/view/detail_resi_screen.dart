import 'package:aplikasi_cek_resi/controller/cek_resi.dart';
import 'package:aplikasi_cek_resi/model/data_resi.dart';
import 'package:flutter/material.dart';

class DetailResiScreen extends StatefulWidget {
  final String expedisi;
  final String nomorResi;
  const DetailResiScreen({
    super.key,
    required this.expedisi,
    required this.nomorResi,
  });

  @override
  State<DetailResiScreen> createState() => _DetailResiScreenState();
}

class _DetailResiScreenState extends State<DetailResiScreen>
    with TickerProviderStateMixin {
  late PageController _pageCtrl;
  late TabController _tabCtrl;
  int _index = 0;

  @override
  void initState() {
    _pageCtrl = PageController();
    _tabCtrl = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Data Detail Resi",
        ),
        bottom: TabBar(
            controller: _tabCtrl,
            onTap: (index) {
              _pageCtrl.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
              // setState(() {
              //   _index = index;
              // });
            },
            tabs: [
              Text("Detail Resi"),
              Text("Riwayat Perjalanan"),
            ]),
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: CekResi().cekResi(
                expedisi: widget.expedisi,
                nomor_resi: widget.nomorResi,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                DataResi data = snapshot.data!;
                List<History> history = data.history!;

                return PageView(
                  physics: FixedExtentScrollPhysics(),
                  onPageChanged: (page) {},
                  controller: _pageCtrl,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              "Nama Barang",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data.summary!.desc!,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                            title: const Text(
                              "Nomor Resi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data.summary!.awb!,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                            title: const Text(
                              "Tanggal",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data.summary!.date!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          const SizedBox(height: 5),
                          ListTile(
                            title: const Text(
                              "Harga",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Rp.${data.summary!.amount!}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                            title: const Text(
                              "Berat",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data.summary!.weight!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          const SizedBox(height: 5),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "STATUS : ${data.summary!.status!.toUpperCase()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Pengirim",
                                      textAlign: TextAlign.center,
                                    ),
                                    subtitle: Text(data.detail!.shipper!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  const Icon(Icons.arrow_downward_rounded),
                                  ListTile(
                                    title: Text(
                                      "Penerima",
                                      textAlign: TextAlign.center,
                                    ),
                                    subtitle: Text(data.detail!.receiver!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: List.generate(history.length, (index) {
                          History data = history[index];
                          return Card(
                            child: ListTile(
                              title: Text(
                                data.desc!,
                                style: const TextStyle(color: Color(0xff113948)),
                              ),
                              subtitle: const Icon(Icons.arrow_upward),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
