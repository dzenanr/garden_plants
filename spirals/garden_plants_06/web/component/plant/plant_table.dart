import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('plant-table')
class PlantTable extends PolymerElement {
  @published Garden garden;
  @published Plants plants;
  Plant plant;
  @observable bool showAdd = false;
  @observable bool showEdit = false;

  PlantTable.created() : super.created();

  enteredView() {
    super.enteredView();
    plants = garden.plants;
    plants.internalList = toObservable(plants.internalList);
  }

  show(Event e, var detail, Node target) {
    ButtonElement addLink = $['show-add'];
    if (addLink.text == 'Show Add') {
      showAdd = true;
      addLink.text = 'Hide Add';
    } else {
      showAdd = false;
      addLink.text = 'Show Add';
    }
  }

  edit(Event e, var detail, Element target) {
    String plantName = target.attributes['plant-name'];
    plant = plants.firstWhereAttribute('name', plantName);
    showEdit = true;
  }

  delete(Event e, var detail, Element target) {
    String plantName = target.attributes['plant-name'];
    plant = plants.firstWhereAttribute('name', plantName);
    plants.remove(plant);
  }
}