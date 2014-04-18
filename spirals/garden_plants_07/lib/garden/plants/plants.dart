part of garden_plants; 
 
// lib/garden/plants/plants.dart 
 
class Plant extends PlantGen { 
 
  Plant(Concept concept) : super(concept); 
 
  Plant.withId(Concept concept, Garden garden, String name) : 
    super.withId(concept, garden, name); 
 
  // added after code gen - begin 
 
  // added after code gen - end 
 
} 
 
class Plants extends PlantsGen { 
 
  Plants(Concept concept) : super(concept); 
 
  // added after code gen - begin 
 
  // added after code gen - end 
 
} 
 
