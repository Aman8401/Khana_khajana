import 'package:flutter/material.dart';
import 'dart:async';
import 'package:khana_khajana/views/widgets/recipe_card.dart';
import '../modules/recipe.api.dart';
import '../modules/recipe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }


  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.menu),
          onSelected: (String result) {
            if (result == 'Home') {
              print('Home selected');
              // Handle Home action
            } else if (result == 'Veg Food') {
              print('Veg Food selected');
              // Handle Veg Food action
            } else if (result == 'Non-Veg') {
              print('Non-Veg selected');
              // Handle Non-Veg action
            } else if (result == 'Contact') {
              print('Contact selected');
              // Handle Contact action
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Home',
              child: Text('Home'),
            ),
            PopupMenuItem<String>(
              value: 'Veg Food',
              child: Text('Veg Food'),
            ),
            PopupMenuItem<String>(
              value: 'Non-Veg',
              child: Text('Non-Veg'),
            ),
            PopupMenuItem<String>(
              value: 'Contact',
              child: Text('Contact'),
            ),
          ],
        ),
    title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 25),
          Text('Khana Khajana'),
        ],
      ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => null,
          ),
        ],
      ),



        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
                title: _recipes[index].name,
                cookTime: _recipes[index].totalTime,
                rating: _recipes[index].rating.toString(),
                thumbnailUrl: _recipes[index].images);
          },
        ),
    );
  }

}


