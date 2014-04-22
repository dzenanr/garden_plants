import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';
import 'category_table.dart';

@CustomTag('category-edit')
class CategoryEdit extends PolymerElement {
  @published Categories categories;
  @published Category category;

  CategoryEdit.created() : super.created();

  update(Event e, var detail, Node target) {
    categories.sort(); // to see a new description in the table
    var polymerApp = querySelector('#polymer-app');
    CategoryTable categoryTable = polymerApp.shadowRoot.querySelector('#category-table');
    categoryTable.showEdit = false;
  }
}