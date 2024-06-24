import "dart:convert";

import "package:aplikasi_cek_resi/config/constant.dart";
import "package:aplikasi_cek_resi/model/data_resi.dart";
import "package:http/http.dart";
import "package:http/http.dart" as http;

class CekResi {
  Future<DataResi> cekResi({
    String? expedisi,
    String? nomor_resi,
  }) async {
    Uri url = Uri.parse(
        "https://api.binderbyte.com/v1/track?courier=$expedisi&awb=$nomor_resi&api_key=$apiKey");
    print(url);
    Response response = await http.get(url);
    print(response.body);

    final result = jsonDecode(response.body)['data'];

    DataResi dataResi = DataResi.fromJson(result);

    return dataResi;
  }
}
