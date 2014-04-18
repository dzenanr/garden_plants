import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('garden-table')
class GardenTable extends PolymerElement {
  @published Gardens gardens;
  Garden garden;
  @published Categories categories;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showPlants = false;

  GardenTable.created() : super.created();

  show(Event e, var detail, Node target) {
    ButtonElement addGarden = shadowRoot.querySelector("#show-add");
    if (addGarden.text == 'Show Add') {
      showAdd = true;
      addGarden.text = 'Hide Add';
    } else {
      showAdd = false;
      addGarden.text = 'Show Add';
    }
  }
  
  edit(Event e, var detail, Element target) {
    String gardenName = target.attributes['garden-name'];
    garden = gardens.singleWhereAttributeId('name', gardenName);
    showEdit = true;
  }
  
  delete(Event e, var detail, Element target) {
    String gardenName = target.attributes['garden-name'];
    garden = gardens.singleWhereAttributeId('name', gardenName);
    for (var plant in garden.plants) {
      if (plant.category != null) {
        plant.category.plants.remove(plant); // external
      }
    }
    gardens.remove(garden); // internal garden plants go with the garden
    showPlants = false;
  }
  
  showGardenPlants(Event e, var detail, Element target) {
    String gardenName = target.attributes['garden-name'];
    ButtonElement gardenPlants = target;
    if (!showPlants && gardenPlants.text == 'Show') {
      showPlants = true;
      garden = gardens.singleWhereAttributeId('name', gardenName);
      garden.plants.internalList = toObservable(garden.plants.internalList);
      gardenPlants.text = 'Hide';
    } else if (showPlants && gardenPlants.text == 'Hide') {
      showPlants = false;
      gardenPlants.text = 'Show';
    }
  }
}