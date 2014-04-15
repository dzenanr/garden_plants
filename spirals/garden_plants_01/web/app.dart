import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  @observable Categories categories;

  PolymerApp.created() : super.created() {
    var repository = new Repository(); 
    var gardenDomain = repository.getDomainModels("Garden"); 
    var plantsModel = gardenDomain.getModelEntries("Plants"); 
    plantsModel.init();
    categories = plantsModel.categories;
  }
}