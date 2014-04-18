 
// test/garden/plants/garden_plants_gen.dart 
 
import "package:garden_plants/garden_plants.dart"; 
 
genCode(Repository repository) { 
  repository.gen("garden_plants"); 
} 
 
initData(Repository repository) { 
   var gardenDomain = repository.getDomainModels("Garden"); 
   var plantsModel = gardenDomain.getModelEntries("Plants"); 
   plantsModel.init(); 
   //plantsModel.display(); 
} 
 
void main() { 
  var repository = new Repository(); 
  genCode(repository); 
  //initData(repository); 
} 
 
