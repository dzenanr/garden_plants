import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-table')
class CategoryTable extends PolymerElement {
  @published Categories categories;

  CategoryTable.created() : super.created();
}