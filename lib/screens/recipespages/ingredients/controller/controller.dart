class IngredientsController {
  int number = 1;
  List<Content> ingredientAdd = [
    Content(
        ingredient: "1 Packet rolled oats", isCorrect: true, isRequire: false),
    Content(
      ingredient: "Half kg Lequid milk",
      isCorrect: true,
      isRequire: false,
    ),
    Content(
      ingredient: "100 gm suger (optional)",
      isCorrect: false,
      isRequire: true,
    ),
  ];
  void add(int num) {
    num++;
  }

  void minus(int num) {
    num--;
  }

  void cheakRequire(int i, val) {
    if (ingredientAdd[i].isRequire == false) {
      ingredientAdd[i].isCorrect = true;
    } else if (ingredientAdd[i].isRequire == true) {
      ingredientAdd[i].isCorrect = val;
    }
  }
}

class Content {
  final String? ingredient;
  bool? isCorrect;
  final bool? isRequire;
  Content({this.ingredient, this.isCorrect, this.isRequire});
}
