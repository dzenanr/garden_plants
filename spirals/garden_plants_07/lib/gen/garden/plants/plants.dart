part of garden_plants; 
 
// lib/gen/garden/plants/plants.dart 
 
abstract class PlantGen extends ConceptEntity<Plant> { 
 
  PlantGen(Concept concept) : super.of(concept); 
 
  PlantGen.withId(Concept concept, Garden garden, String name) : super.of(concept) { 
    setParent("garden", garden); 
    setAttribute("name", name); 
  } 
 
  Reference get gardenReference => getReference("garden"); 
  set gardenReference(Reference reference) => setReference("garden", reference); 
  
  Garden get garden => getParent("garden"); 
  set garden(Garden p) => setParent("garden", p); 
  
  Reference get categoryReference => getReference("category"); 
  set categoryReference(Reference reference) => setReference("category", reference); 
  
  Category get category => getParent("category"); 
  set category(Category p) => setParent("category", p); 
  
  String get name => getAttribute("name"); 
  set name(String a) => setAttribute("name", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  String get picture => getAttribute("picture"); 
  set picture(String a) => setAttribute("picture", a); 
  
  Plant newEntity() => new Plant(concept); 
  Plants newEntities() => new Plants(concept); 
  
  int nameCompareTo(Plant other) { 
    return name.compareTo(other.name); 
  } 
 
} 
 
abstract class PlantsGen extends Entities<Plant> { 
 
  PlantsGen(Concept concept) : super.of(concept); 
 
  Plants newEntities() => new Plants(concept); 
  Plant newEntity() => new Plant(concept); 
  
} 
 
