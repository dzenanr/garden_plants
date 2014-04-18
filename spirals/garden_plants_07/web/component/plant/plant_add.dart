import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('plant-add')
class PlantAdd extends PolymerElement {
  @published Garden garden;
  @published Categories categories;
  Category category;

  PlantAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    SelectElement categoryLookup = $['category-lookup'];
    InputElement name = $['name'];
    InputElement description = $['description'];
    InputElement picture = $['picture'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (name.value.trim() == '') {
      message.text = 'plant name is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var plant = new Plant(garden.plants.concept);
      plant.name = name.value;
      plant.description = description.value;
      plant.picture = picture.value;
      plant.garden = garden;
      String categoryName = categoryLookup.value;
      if (categoryName != '') {
        category = categories.singleWhereAttributeId('latinName', categoryName);
        if (category != null) {
          plant.category = category;
        }
      }
      // garden.plants internal; category.plants external
      if (garden.plants.add(plant)) {
        message.text = '; garden plant added';
        garden.plants.sort();
        if (category != null && plant.category.plants.add(plant)) {
          message.text = 'category plant added ${message.text}';
          plant.category.plants.sort();
        }
      } else {
        message.text = 'plant name already in use';
      }
    }
  }
}

