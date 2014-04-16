import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-add')
class CategoryAdd extends PolymerElement {
  @published Categories categories;

  CategoryAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement latinName = shadowRoot.querySelector("#latinName");
    InputElement description = shadowRoot.querySelector("#description");
    InputElement isEdible = shadowRoot.querySelector("#isEdible");
    InputElement harvestZone = shadowRoot.querySelector("#harvestZone");
    Element message = shadowRoot.querySelector("#message");
    var error = false;
    message.text = '';
    if (latinName.value.trim() == '') {
      message.text = 'category name is mandatory; ${message.text}';
      error = true;
    }
    if (harvestZone.value.trim() != '') {
      try {
        int zone = int.parse(harvestZone.value);
      } catch(e) {
        message.text = 'zone must be integer; ${message.text}';
        error = true;
      } 
    }
    if (!error) {
      var category = new Category(categories.concept);
      category.latinName = latinName.value;
      category.description = description.value;
      if (isEdible.value == 'true') {
        category.isEdible = true;
      } else {
        category.isEdible = false;
      }
      if (harvestZone.value.trim() != '') {
        category.harvestZone = int.parse(harvestZone.value);
      }
      if (categories.add(category)) {
        message.text = 'added';
        categories.sort();
      } else {
        message.text = 'category name already in use';
      }
    }
  }
}