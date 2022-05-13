class Payment {
  int? id;
  String? paidAt;
  String? type;

  Payment({this.id, this.paidAt, this.type});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paidAt = json['paid_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['paid_at'] = paidAt;
    data['type'] = type;
    return data;
  }
}
