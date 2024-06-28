import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'ttps://horoscopes-ai.p.rapidapi.com/get_horoscope/%7Bsign%7D/%7Bperiod%7D/general/%7Blanguage%7D';
  static const String _apiKey = '076667834amsh95d3e56662fb196p1395b8jsne26bfe33887d';

  // Example method to fetch data from the API
  static Future<dynamic> fetchData() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  // Add more methods for other API calls as needed
}
