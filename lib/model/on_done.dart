class Ondone {
  final String? id;
  final String name;
  final String address;
  final String phone;
  final String package;
  final String weight;
  final String summary;
  final String? date;

  Ondone(
      {this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.weight,
      required this.summary,
      required this.package,
      this.date});
}
