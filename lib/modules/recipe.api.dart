import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:khana_khajana/modules/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "180", "start": "0", "tag": "list.recipe.popular"});
    //     var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
    //     {"from": '0',
    //       "size": '20',
    //       "tags": 'under_30_minutes'});

    final response = await http.get(uri, headers: {
      //"x-rapidapi-key": "b4d9d08c77mshfa05339d25e16b8p1cf833jsn9c954d1656e3",
      "x-rapidapi-key": "b4d9d08c77mshfa05339d25e16b8p1cf833jsn9c954d1656e3",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
      // 'X-RapidAPI-Key': 'b4d9d08c77mshfa05339d25e16b8p1cf833jsn9c954d1656e3',
      // 'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
