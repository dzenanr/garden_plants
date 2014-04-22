import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';
import 'garden_table.dart';

@CustomTag('garden-edit')
class GardenEdit extends PolymerElement {
  @published Gardens gardens;
  @published Garden garden;

  GardenEdit.created() : super.created();

  update(Event e, var detail, Node target) {
    gardens.sort(); // to see a new description in the table
    var polymerApp = querySelector('#polymer-app');
    GardenTable gardenTable = polymerApp.shadowRoot.querySelector('#garden-table');
    gardenTable.showEdit = false;
  }
}