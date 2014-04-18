import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';
import 'plant_table.dart';

@CustomTag('plant-edit')
class PlantEdit extends PolymerElement {
  @published Plant plant;
  @published Plants plants;
  @published String description;
  @published String picture;

  PlantEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    plants = plant.garden.plants;
    plants.internalList = toObservable(plants.internalList);
    description = plant.description;
    picture = plant.picture;
  }

  update(Event e, var detail, Node target) {
    plant.description = description;
    plant.picture = picture;
    var polymerApp = querySelector('#polymer-app');
    var gardenTable = polymerApp.shadowRoot.querySelector('#garden-table');
    PlantTable plantTable = gardenTable.shadowRoot.querySelector('#plant-table');
    plantTable.showEdit = false;
  }
}

