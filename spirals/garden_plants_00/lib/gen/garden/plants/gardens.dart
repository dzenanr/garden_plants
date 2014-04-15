part of garden_plants; 
 
// lib/gen/garden/plants/gardens.dart 
 
abstract class GardenGen extends ConceptEntity<Garden> { 
 
  GardenGen(Concept concept) : super.of(concept) { 
    Concept plantConcept = concept.model.concepts.singleWhereCode("Plant"); 
    setChild("plants", new Plants(plantConcept)); 
  } 
 
  GardenGen.withId(Concept concept, String name) : super.of(concept) { 
    setAttribute("name", name); 
    Concept plantConcept = concept.model.concepts.singleWhereCode("Plant"); 
    setChild("plants", new Plants(plantConcept)); 
  } 
 
  String get name => getAttribute("name"); 
  set name(String a) => setAttribute("name", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  double get latitude => getAttribute("latitude"); 
  set latitude(double a) => setAttribute("latitude", a); 
  
  double get longiitude => getAttribute("longiitude"); 
  set longiitude(double a) => setAttribute("longiitude", a); 
  
  Plants get plants => getChild("plants"); 
  
  Garden newEntity() => new Garden(concept); 
  Gardens newEntities() => new Gardens(concept); 
  
  int nameCompareTo(Garden other) { 
    return name.compareTo(other.name); 
  } 
 
} 
 
abstract class GardensGen extends Entities<Garden> { 
 
  GardensGen(Concept concept) : super.of(concept); 
 
  Gardens newEntities() => new Gardens(concept); 
  Garden newEntity() => new Garden(concept); 
  
} 
 
