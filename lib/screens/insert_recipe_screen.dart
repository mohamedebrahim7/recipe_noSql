import 'package:flutter/material.dart';
import 'package:isar_db_tutorial/data/ingredients.dart';

import '../data/isar_service.dart';
import '../data/recipe.dart';
import '../widget/add_ingredient_card.dart';


class InsertRecipeScreen extends StatefulWidget {
  const InsertRecipeScreen({Key? key}) : super(key: key);

  @override
  State<InsertRecipeScreen> createState() => _InsertRecipeScreenState();
}

class _InsertRecipeScreenState extends State<InsertRecipeScreen> {
  final recipeTitleController = TextEditingController();
  final recipeImageController = TextEditingController();
  final List<TextEditingController> _namecontrolers = [];
  final List<TextEditingController> _weightcontrolers = [];
  final List<AddIngredientCard> _addIngredientWidgetList = [];


  @override
  void dispose() {

    recipeTitleController.dispose();
    recipeImageController.dispose();

    for (final controller in _namecontrolers ) {
      controller.dispose();
    }
    for (final controller in _weightcontrolers ) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("insert recipe screen built once");
    final service = IsarService();

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Recipe App")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: recipeTitleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your recipe title',
                      label: Text("recipe title")),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextField(
                  controller: recipeImageController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter an image url',
                      label: Text("Image url")),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: (){

                        final TextEditingController nameCtrl = TextEditingController();
                        final TextEditingController weightCtrl = TextEditingController();
                        final addIngredient = AddIngredientCard(weightController: weightCtrl, nameController: nameCtrl,);

                        setState((){
                          _addIngredientWidgetList.add(addIngredient);
                          _namecontrolers.add(nameCtrl);
                          _weightcontrolers.add(weightCtrl);
                        }); },
                      child: Text("add ingredient"),
                      style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(height*0.1),
                              )))),

                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _addIngredientWidgetList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: _addIngredientWidgetList[index],
                      );
                    },
                  ),
                ],
              ),
                ElevatedButton(
                    onPressed: () => InsertRecipe(service, context),
                    child: Text("Insert")),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void InsertRecipe(IsarService service, BuildContext context) {
    final label = recipeTitleController.value.text;
    final image = recipeImageController.value.text;
    final List<Ingredients> ingredients = [];
    final Recipe recipe ;
    final ingredentNamesIsnotEmpty = _namecontrolers.every((element) => element.text.isNotEmpty);
    final ingredentWeightsIsnotEmpty = _weightcontrolers.every((element) => element.text.isNotEmpty);

    if(label.isNotEmpty && image.isNotEmpty && ingredentWeightsIsnotEmpty && ingredentNamesIsnotEmpty){

      for(int i =0 ; i <_namecontrolers.length ;i++){
          final name = _namecontrolers[i].text ;
          final weight =  double.parse( _weightcontrolers[i].text) ;
          ingredients.add(Ingredients()..name=name..weight=weight);}

        recipe = Recipe()..label=label..url=image..ingredients.addAll(ingredients);
        service.insertRecipe(recipe);
        Navigator.pop(context);

    }
    else {
      print(ingredentNamesIsnotEmpty);
      const snackBar = SnackBar(
        content: Text('All Recipe fields must be filled'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

