class RecipesOverviewController {
  String recipesDescription =
      "Oats porridge is a quick and healthy porridge made with oats,water or milk. Both quick cooking oats or roled oats can be used";
  List<Map<String, dynamic>> cookStage = [
    {'type': "Prep Time", 'time': 1},
    {'type': "Cook Time", 'time': 5},
    {'type': "Total Time", 'time': 6},
  ];
  List<Map<String, dynamic>> cookInfo = [
    {"type": "Cuisine:", "kind": "American,World"},
    {'type': "Course:", 'kind': "Breakfast"},
    {'type': "Dite:", 'kind': "Vegetarians"},
    {'type': "Defficulty Type:", 'kind': "Easy"},
  ];
}
