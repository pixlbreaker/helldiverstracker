import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/helldiver_planet_model.dart';

class HellDiverService {
  static const helldiverurl = "https://helldivers.io/update.json";

  HellDiverService();

  // Get Request to get the current weather from a city name
  Future<HellDiverData> getHelldiverData() async {
    final response = await http.get(Uri.parse(helldiverurl));

    if (response.statusCode == 200) {
      return HellDiverData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Helldiver API');
    }
  }
}
