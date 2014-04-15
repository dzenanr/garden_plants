import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-table')
class CategoryTable extends PolymerElement {
  @published Categories categories;
  @observable bool showAdd = false;

  CategoryTable.created() : super.created();

  show(Event e, var detail, Node target) {
    ButtonElement addCategory = shadowRoot.querySelector("#show-add");
    if (addCategory.text == 'Show Add') {
      showAdd = true;
      addCategory.text = 'Hide Add';
    } else {
      showAdd = false;
      addCategory.text = 'Show Add';
    }
  }
}