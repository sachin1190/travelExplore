import 'dart:convert';

Trip tripFromJson(String str, bool b) {
  final jsonData = json.decode(str);

  return Trip.fromJson(jsonData);
}

List<Trip> allTripsFromJson(String str) {
  final jsonData = json.decode(str);

  return new List<Trip>.from(jsonData.map((x) => Trip.fromJson(x)))
      .toList(growable: true);
}

class Trip {
  int id;
  bool fooding;
  bool lodging;
  bool activities;
  bool flight;
  dynamic name;
  dynamic price;
  dynamic img;
  int days;

  Trip(
      {this.flight,
      this.id,
      this.fooding,
      this.activities,
      this.img,
      this.days,
      this.lodging,
      this.name,
      this.price});

  factory Trip.fromJson(Map<dynamic, dynamic> json) => new Trip(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        activities: json['activities'],
        flight: json['flight'],
        lodging: json['lodging'],
        days: json['days'],
        fooding: json['fooding'],
        img: json['img'],
      );
}
