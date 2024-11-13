class Ondone {
  final String? id;
  final String name;
  final String address;
  final String phone;
  final String package;
  final String weight;
  final String amount;
  final String? date_in;
  final String? time_in;
  final String? date_out;
  final String? time_out;

  Ondone(
      {this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.weight,
      required this.amount,
      required this.package,
      this.date_in,
      this.time_in,
      this.date_out,
      this.time_out});

  factory Ondone.fromJson(Map<String, dynamic> json) {
    return Ondone(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      package: json['package'],
      weight: json['weight'],
      amount: json['amount'],
      date_in: json['date_in'],
      time_in: json['time_in'],
      date_out: json['date_out'],
      time_out: json['time_out'],
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
    'date_in': date_in,
    'time_in': time_in,
    'date_out': date_out,
    'time_out': time_out,
  };
}
