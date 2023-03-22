import 'package:latlong2/latlong.dart';

class Country{
  Country({required this.id, required this.name, required this.code, required this.location});
  
  final int id;
  final String name;
  final String code;
  final LatLng location;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      location: LatLng.fromJson(json['location']),
    );
  }
}