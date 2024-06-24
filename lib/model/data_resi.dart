class DataResi {
  Summary? summary;
  Detail? detail;
  List<History>? history;

  DataResi({this.summary, this.detail, this.history});

  DataResi.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? Summary.fromJson(json['summary']) : null;
    detail = json['detail'] != null ? Detail.fromJson(json['detail']) : null;
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    if (detail != null) {
      data['detail'] = detail!.toJson();
    }
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  String? awb;
  String? courier;
  String? service;
  String? status;
  String? date;
  String? desc;
  String? amount;
  String? weight;

  Summary(
      {this.awb,
      this.courier,
      this.service,
      this.status,
      this.date,
      this.desc,
      this.amount,
      this.weight});

  Summary.fromJson(Map<String, dynamic> json) {
    awb = json['awb'];
    courier = json['courier'];
    service = json['service'];
    status = json['status'];
    date = json['date'];
    desc = json['desc'];
    amount = json['amount'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['awb'] = awb;
    data['courier'] = courier;
    data['service'] = service;
    data['status'] = status;
    data['date'] = date;
    data['desc'] = desc;
    data['amount'] = amount;
    data['weight'] = weight;
    return data;
  }
}

class Detail {
  String? origin;
  String? destination;
  String? shipper;
  String? receiver;

  Detail({this.origin, this.destination, this.shipper, this.receiver});

  Detail.fromJson(Map<String, dynamic> json) {
    origin = json['origin'];
    destination = json['destination'];
    shipper = json['shipper'];
    receiver = json['receiver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['origin'] = origin;
    data['destination'] = destination;
    data['shipper'] = shipper;
    data['receiver'] = receiver;
    return data;
  }
}

class History {
  String? date;
  String? desc;
  String? location;

  History({this.date, this.desc, this.location});

  History.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    desc = json['desc'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['desc'] = desc;
    data['location'] = location;
    return data;
  }
}
