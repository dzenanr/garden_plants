part of garden_plants; 
 
// lib/gen/garden/models.dart 
 
class GardenModels extends DomainModels { 
 
  GardenModels(Domain domain) : super(domain) { 
    // fromJsonToModel function from dartling/lib/domain/model/transfer.json.dart 
 
    Model model = fromJsonToModel(gardenPlantsModelJson, domain, "Plants"); 
    PlantsModel plantsModel = new PlantsModel(model); 
    add(plantsModel); 
 
  } 
 
} 
 
