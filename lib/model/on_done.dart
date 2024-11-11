class Ondone {
  final String? id;
  final String name;
  final String address;
  final String phone;
  final String package;
  final String weight;
  final String amount;
  final String? date;
  final String? time;

  Ondone(
      {this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.weight,
      required this.amount,
      required this.package,
      this.date,
      this.time
    });

  factory Ondone.fromJson(Map<String, dynamic> json) {
    return Ondone(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      package: json['package'],
      weight: json['weight'],
      amount: json['amount'],
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'phone': phone,
        'package': package,
        'weight': weight,
        'amount': amount,
        'date': date,
        'time': time,
      };
}
