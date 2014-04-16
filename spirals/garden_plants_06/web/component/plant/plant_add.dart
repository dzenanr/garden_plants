import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('plant-add')
class PlantAdd extends PolymerElement {
  @published Garden garden;

  PlantAdd.created() : super.created();

  add(Event e, var detail, Node target) {
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
      if (garden.plants.add(plant)) {
        message.text = 'added';
        garden.plants.sort();
      } else {
        message.text = 'plant name already in use';
      }
    }
  }
}

