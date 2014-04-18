part of garden_plants; 
 
// lib/gen/garden/plants/entries.dart 
 
class PlantsEntries extends ModelEntries { 
 
  PlantsEntries(Model model) : super(model); 
 
  Map<String, Entities> newEntries() { 
    var entries = new Map<String, Entities>(); 
    var concept; 
    concept = model.concepts.singleWhereCode("Garden"); 
    entries["Garden"] = new Gardens(concept); 
    concept = model.concepts.singleWhereCode("Category"); 
    entries["Category"] = new Categories(concept); 
    return entries; 
  } 
 
  Entities newEntities(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Garden") { 
      return new Gardens(concept); 
    } 
    if (concept.code == "Plant") { 
      return new Plants(concept); 
    } 
    if (concept.code == "Category") { 
      return new Categories(concept); 
    } 
    return null; 
  } 
 
  ConceptEntity newEntity(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Garden") { 
      return new Garden(concept); 
    } 
    if (concept.code == "Plant") { 
      return new Plant(concept); 
    } 
    if (concept.code == "Category") { 
      return new Category(concept); 
    } 
    return null; 
  } 
 
  Gardens get gardens => getEntry("Garden"); 
  Categories get categories => getEntry("Category"); 
 
} 
 
