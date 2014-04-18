import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-table')
class CategoryTable extends PolymerElement {
  @published Categories categories;
  Category category;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showPlants = false;

  CategoryTable.created() : super.created();

  show(Event e, var detail, Node target) {
    ButtonElement addCategory = shadowRoot.querySelector("#show-add");
    if (addCategory.text == 'Show Add') {
      showAdd = true;
      addCategory.text = 'Hide Add';
    } else {
      showAdd = false;
      addCategory.text = 'Show Add';
    }
  }
  
  edit(Event e, var detail, Element target) {
    String categoryLatinName = target.attributes['category-latin-name'];
    category = categories.singleWhereAttributeId('latinName', categoryLatinName);
    showEdit = true;
  }
  
  delete(Event e, var detail, Element target) {
    String categoryLatinName = target.attributes['category-latin-name'];
    category = categories.singleWhereAttributeId('latinName', categoryLatinName);
    for (var plant in category.plants) {
      plant.garden.plants.remove(plant); // internal
    }
    categories.remove(category); // external category plants go with the category
  }
  
  showCategoryPlants(Event e, var detail, Element target) {
    String categoryLatinName = target.attributes['category-latin-name'];
    ButtonElement categoryPlants = target;
    if (!showPlants && categoryPlants.text == 'Show') {
      showPlants = true;
      category = categories.singleWhereAttributeId('latinName', categoryLatinName);
      category.plants.internalList = toObservable(category.plants.internalList);
      category.plants.sort();
      categoryPlants.text = 'Hide';
    } else if (showPlants && categoryPlants.text == 'Hide') {
      showPlants = false;
      categoryPlants.text = 'Show';
    }
  }
}