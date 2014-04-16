part of garden_plants; 
 
// lib/gen/garden/plants/categories.dart 
 
abstract class CategoryGen extends ConceptEntity<Category> { 
 
  CategoryGen(Concept concept) : super.of(concept) { 
    Concept plantConcept = concept.model.concepts.singleWhereCode("Plant"); 
    setChild("plants", new Plants(plantConcept)); 
  } 
 
  CategoryGen.withId(Concept concept, String latinName) : super.of(concept) { 
    setAttribute("latinName", latinName); 
    Concept plantConcept = concept.model.concepts.singleWhereCode("Plant"); 
    setChild("plants", new Plants(plantConcept)); 
  } 
 
  String get latinName => getAttribute("latinName"); 
  set latinName(String a) => setAttribute("latinName", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  bool get isEdible => getAttribute("isEdible"); 
  set isEdible(bool a) => setAttribute("isEdible", a); 
  
  int get harvestZone => getAttribute("harvestZone"); 
  set harvestZone(int a) => setAttribute("harvestZone", a); 
  
  Plants get plants => getChild("plants"); 
  
  Category newEntity() => new Category(concept); 
  Categories newEntities() => new Categories(concept); 
  
  int latinNameCompareTo(Category other) { 
    return latinName.compareTo(other.latinName); 
  } 
 
} 
 
abstract class CategoriesGen extends Entities<Category> { 
 
  CategoriesGen(Concept concept) : super.of(concept); 
 
  Categories newEntities() => new Categories(concept); 
  Category newEntity() => new Category(concept); 
  
} 
 
