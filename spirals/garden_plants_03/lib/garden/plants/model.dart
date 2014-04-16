 
part of garden_plants; 
 
// lib/garden/plants/model.dart 
 
class PlantsModel extends PlantsEntries { 
 
  PlantsModel(Model model) : super(model); 
 
  fromJsonToGardenEntry() { 
    fromJsonToEntry(gardenPlantsGardenEntry); 
  } 
 
  fromJsonToCategoryEntry() { 
    fromJsonToEntry(gardenPlantsCategoryEntry); 
  } 
 
  fromJsonToModel() { 
    fromJson(gardenPlantsModel); 
  } 
 
  init() { 
    initCategories(); 
    initGardens(); 
  } 
 
  initGardens() { 
    var garden1 = new Garden(gardens.concept); 
      garden1.name = 'sun'; 
      garden1.description = 'series'; 
      garden1.latitude = 20.977314271756033; 
      garden1.longitude = 50.93861381025506; 
      gardens.add(garden1); 
 
    var garden1plants1 = new Plant(garden1.plants.concept); 
      garden1plants1.name = 'walking'; 
      garden1plants1.description = 'accident'; 
      garden1plants1.picture = 'book'; 
    garden1plants1.garden = garden1; 
    garden1.plants.add(garden1plants1); 
 
    var garden1plants2 = new Plant(garden1.plants.concept); 
      garden1plants2.name = 'interest'; 
      garden1plants2.description = 'crisis'; 
      garden1plants2.picture = 'time'; 
    garden1plants2.garden = garden1; 
    garden1.plants.add(garden1plants2); 
 
    var garden2 = new Garden(gardens.concept); 
      garden2.name = 'phone'; 
      garden2.description = 'water'; 
      garden2.latitude = 18.343101498382087; 
      garden2.longitude = 68.36866823209898; 
      gardens.add(garden2); 
 
    var garden2plants1 = new Plant(garden2.plants.concept); 
      garden2plants1.name = 'dog'; 
      garden2plants1.description = 'edition'; 
      garden2plants1.picture = 'algorithm'; 
    garden2plants1.garden = garden2; 
    garden2.plants.add(garden2plants1); 
 
    var garden2plants2 = new Plant(garden2.plants.concept); 
      garden2plants2.name = 'flower'; 
      garden2plants2.description = 'chemist'; 
      garden2plants2.picture = 'video'; 
    garden2plants2.garden = garden2; 
    garden2.plants.add(garden2plants2); 
 
    var garden3 = new Garden(gardens.concept); 
      garden3.name = 'deep'; 
      garden3.description = 'distance'; 
      garden3.latitude = 13.105025828967708; 
      garden3.longitude = 6.52102331037171; 
      gardens.add(garden3); 
 
    var garden3plants1 = new Plant(garden3.plants.concept); 
      garden3plants1.name = 'center'; 
      garden3plants1.description = 'time'; 
      garden3plants1.picture = 'wife'; 
    garden3plants1.garden = garden3; 
    garden3.plants.add(garden3plants1); 
 
    var garden3plants2 = new Plant(garden3.plants.concept); 
      garden3plants2.name = 'flower'; 
      garden3plants2.description = 'saving'; 
      garden3plants2.picture = 'text'; 
    garden3plants2.garden = garden3; 
    garden3.plants.add(garden3plants2); 
 
  } 
 
  initCategories() { 
    var category1 = new Category(categories.concept); 
      category1.latinName = 'dvd'; 
      category1.description = 'saving'; 
      category1.isEdible = true; 
      category1.harvestZone = 2938; 
      categories.add(category1); 
 
    var category2 = new Category(categories.concept); 
      category2.latinName = 'mile'; 
      category2.description = 'election'; 
      category2.isEdible = false; 
      category2.harvestZone = 3408; 
      categories.add(category2); 
 
    var category3 = new Category(categories.concept); 
      category3.latinName = 'undo'; 
      category3.description = 'cream'; 
      category3.isEdible = true; 
      category3.harvestZone = 6715; 
      categories.add(category3); 
 
  } 
 
  // added after code gen - begin 
 
  // added after code gen - end 
 
} 
 
