import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/hits.dart';

class Recipie {
  List<Hits> hits = [];

  Future<void> getReceipe() async {
    String url =
        "https://api.edamam.com/search?q=banana&app_id=6b393edf&app_key=3080066b218ac42fbff6c49dfdeef470";
    Uri u = Uri.parse(url);
    var response = await http.get(u);

    var jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((element) {
      Hits hits = Hits(
        recipeModel: element['recipe'],
      );
      // hits.recipeModel = add(Hits.fromMap(hits.recipeModel));
    });
  }
}
