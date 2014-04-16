import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('garden-table')
class GardenTable extends PolymerElement {
  @published Gardens gardens;
  Garden garden;
  @observable bool showAdd = false;
  @observable bool showEdit = false;

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
  }
}