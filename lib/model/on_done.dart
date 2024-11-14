class Ondone {
  final String? id;
  final String name;
  final String address;
  final String phone;
  final String package;
  final String weight;
  final String amount;
  final String? dateIn;
  final String? timeIn;
  final String? dateOut;
  final String? timeOut;

  Ondone(
      {this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.weight,
      required this.amount,
      required this.package,
      this.dateIn,
      this.timeIn,
      this.dateOut,
      this.timeOut});

  factory Ondone.fromJson(Map<String, dynamic> json) {
    return Ondone(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      package: json['package'],
      weight: json['weight'],
      amount: json['amount'],
      dateIn: json['dateIn'],
      timeIn: json['timeIn'],
      dateOut: json['dateOut'],
      timeOut: json['timeOut'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'phone': phone,
    'package': package,
    'weight': weight,
    'amount': amount,
    'dateIn': dateIn,
    'timeIn': timeIn,
    'dateOut': dateOut,
    'timeOut': timeOut,
  };
}
