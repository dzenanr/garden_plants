 
// web/garden/plants/garden_plants_web.dart 
 
import "dart:html"; 
 
import "package:dartling_default_app/dartling_default_app.dart"; 
import "package:garden_plants/garden_plants.dart"; 
 
initData(Repository repository) { 
   var gardenDomain = repository.getDomainModels("Garden"); 
   var plantsModel = gardenDomain.getModelEntries("Plants"); 
   plantsModel.init(); 
   //plantsModel.display(); 
} 
 
showData(Repository repository) { 
   var mainView = new View(document, "main"); 
   mainView.repo = repository; 
   new RepoMainSection(mainView); 
} 
 
void main() { 
  var repository = new Repository(); 
  initData(repository); 
  showData(repository); 
} 
 
