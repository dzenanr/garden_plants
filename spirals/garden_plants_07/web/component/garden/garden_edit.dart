import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';
import 'garden_table.dart';

@CustomTag('garden-edit')
class GardenEdit extends PolymerElement {
  @published Gardens gardens;
  @published Garden garden;
  @published String description;

  GardenEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    description = garden.description;
  }

  update(Event e, var detail, Node target) {
    garden.description = description;
    gardens.sort(); // to see a new description in the table
    var polymerApp = querySelector('#polymer-app');
    GardenTable gardenTable = polymerApp.shadowRoot.querySelector('#garden-table');
    gardenTable.showEdit = false;
  }
}