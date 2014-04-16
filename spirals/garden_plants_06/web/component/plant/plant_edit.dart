import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';
import 'plant_table.dart';

@CustomTag('plant-edit')
class PlantEdit extends PolymerElement {
  @published Garden garden;
  @published Plants plants;
  @published Plant plant;
  @published String name;
  @published String description;
  @published String picture;

  PlantEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    plants = garden.plants;
    plants.internalList = toObservable(plants.internalList);
    name = plant.name;
    description = plant.description;
    picture = plant.picture;
  }

  update(Event e, var detail, Node target) {
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (name.trim() == '') {
      message.text = 'plant name is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      if (plant.name != name) {
        var existingPlant = plants.singleWhereAttributeId('name', name);
        if (existingPlant != null) {
          message.text = 'plant name already in use';
        } else {
          plants.remove(plant);
          plant = new Plant(plants.concept);
          plant.name = name;
          plant.description = description;
          plant.picture = picture;
          plant.garden = garden;
          if (plants.add(plant)) {
            message.text = 'added';
          } else {
            message.text = 'not added';
          }
        }
      } else {
        plant.description = description;
        plant.picture = picture;
      }
      plants.sort(); // even if name not changed, to see the updated table
      var polymerApp = querySelector('#polymer-app');
      var gardenTable = polymerApp.shadowRoot.querySelector('#garden-table');
      PlantTable plantTable = gardenTable.shadowRoot.querySelector('#plant-table');
      plantTable.showEdit = false;
    }
  }
}

