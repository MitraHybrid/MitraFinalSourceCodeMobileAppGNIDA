// ignore: camel_case_types
class finalValue {
  String name;
  String quantity;

  finalValue({this.name, this.quantity});

  finalValue.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    return data;
  }
}