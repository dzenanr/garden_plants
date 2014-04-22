import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';
import 'plant_table.dart';

@CustomTag('plant-edit')
class PlantEdit extends PolymerElement {
  @published Plant plant;
  @published Plants plants;

  PlantEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    plants = plant.garden.plants;
    plants.internalList = toObservable(plants.internalList);
  }

  update(Event e, var detail, Node target) {
    var polymerApp = querySelector('#polymer-app');
    var gardenTable = polymerApp.shadowRoot.querySelector('#garden-table');
    PlantTable plantTable = gardenTable.shadowRoot.querySelector('#plant-table');
    plantTable.showEdit = false;
  }
}

