import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:country_insight/models/country.dart';

class ApiService {
  static const String url = 'https://restcountries.com/v3.1/all';

  static Future<List<Country>> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(url));
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        print('API Response: ${body.length} items fetched');
        List<Country> countries =
            body.map((dynamic item) => Country.fromJson(item)).toList();
        return countries;
      } else {
        print('Failed to load countries: ${response.statusCode}');
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load countries');
    }
  }
}
