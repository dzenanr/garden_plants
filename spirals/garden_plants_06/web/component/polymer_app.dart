import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  PlantsModel plantsModel;
  @observable Categories categories;
  @observable Gardens gardens;

  PolymerApp.created() : super.created() {
    var repository = new Repository(); 
    var gardenDomain = repository.getDomainModels("Garden"); 
    plantsModel = gardenDomain.getModelEntries("Plants");    
    categories = plantsModel.categories;
    gardens = plantsModel.gardens;
    
    // load data
    String json = window.localStorage['garden_plants'];
    if (json == null) {
      plantsModel.init();
    } else {
      plantsModel.fromJson(json);
    }
    // comment the following line to see that a new category does not appear in its table
    categories.internalList = toObservable(categories.internalList);
    gardens.internalList = toObservable(gardens.internalList);
  }
  
  save(Event e, var detail, Node target) {
    window.localStorage['garden_plants'] = plantsModel.toJson();
  }
}