import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';
import 'category_table.dart';

@CustomTag('category-edit')
class CategoryEdit extends PolymerElement {
  @published Categories categories;
  @published Category category;
  @published String description;

  CategoryEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    description = category.description;
  }

  update(Event e, var detail, Node target) {
    category.description = description;
    categories.sort(); // to see a new description in the table
    var polymerApp = querySelector('#polymer-app');
    CategoryTable categoryTable = polymerApp.shadowRoot.querySelector('#category-table');
    categoryTable.showEdit = false;
  }
}