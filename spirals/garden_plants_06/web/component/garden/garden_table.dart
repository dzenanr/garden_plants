import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('garden-table')
class GardenTable extends PolymerElement {
  @published Gardens gardens;
  Garden garden;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showGardenPlants = false;

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
    gardens.remove(garden);
    showGardenPlants = false;
  }
  
  showPlants(Event e, var detail, Element target) {
    String gardenName = target.attributes['garden-name'];
    ButtonElement gardenPlants = target;
    if (!showGardenPlants && gardenPlants.text == 'Show') {
      showGardenPlants = true;
      garden = gardens.singleWhereAttributeId('name', gardenName);
      gardenPlants.text = 'Hide';
    } else if (showGardenPlants && gardenPlants.text == 'Hide') {
      showGardenPlants = false;
      gardenPlants.text = 'Show';
    }
  }
}