import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eduatlas/models/model.dart';

class UniversityService {
  static Future<List<University>> fetchUniversities(String country) async {
    try {
      final response = await http.get(
        Uri.parse('http://universities.hipolabs.com/search?country=$country'),
      ).timeout(const Duration(seconds: 10)); // Add timeout

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => University.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load universities. Server error: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('Connection timeout. Please check your internet connection.');
    } catch (e) {
      throw Exception('Failed to fetch universities. Please try again later.');
    }
  }

  static Future<List<String>> fetchCountries() async {
    try {
      final response = await http.get(
        Uri.parse('https://restcountries.com/v3.1/all'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<String> countries = data
            .map((country) => country['name']['common'] as String)
            .toList();
        countries.sort();
        return countries;
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      // Return a default list of popular countries if API fails
      return [
        'United States', 'United Kingdom', 'Canada', 'Australia', 'Germany',
        'France', 'Japan', 'China', 'India', 'Brazil'
      ];
    }
  }
}