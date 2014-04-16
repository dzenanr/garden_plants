 
// test/garden/plants/garden_plants_category_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:garden_plants/garden_plants.dart"; 
 
testGardenPlantsCategories( 
    GardenDomain gardenDomain, PlantsModel plantsModel, Categories categories) { 
  DomainSession session; 
  group("Testing Garden.Plants.Category", () { 
    session = gardenDomain.newSession();  
    expect(plantsModel.isEmpty, isTrue); 
    setUp(() { 
      plantsModel.init(); 
    }); 
    tearDown(() { 
      plantsModel.clear(); 
    }); 
 
    test("Not empty model", () { 
      expect(plantsModel.isEmpty, isFalse); 
      expect(categories.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      plantsModel.clear(); 
      expect(plantsModel.isEmpty, isTrue); 
      expect(categories.isEmpty, isTrue); 
      expect(categories.errors.isEmpty, isTrue); 
    }); 
 
    test("From model to JSON", () { 
      var json = plantsModel.toJson(); 
      expect(json, isNotNull); 
 
      print(json); 
      //plantsModel.displayJson(); 
      //plantsModel.display(); 
    }); 
 
    test("From JSON to model", () { 
      var json = plantsModel.toJson(); 
      plantsModel.clear(); 
      expect(plantsModel.isEmpty, isTrue); 
      plantsModel.fromJson(json); 
      expect(plantsModel.isEmpty, isFalse); 
 
      plantsModel.display(); 
    }); 
 
    test("From model entry to JSON", () { 
      var json = plantsModel.fromEntryToJson("Category"); 
      expect(json, isNotNull); 
 
      print(json); 
      //plantsModel.displayEntryJson("Category"); 
      //plantsModel.displayJson(); 
      //plantsModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = plantsModel.fromEntryToJson("Category"); 
      categories.clear(); 
      expect(categories.isEmpty, isTrue); 
      plantsModel.fromJsonToEntry(json); 
      expect(categories.isEmpty, isFalse); 
 
      categories.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add category required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add category unique error", () { 
      var categoryConcept = categories.concept; 
      var categoryCount = categories.length; 
      var category = new Category(categoryConcept); 
      var randomCategory = categories.random(); 
      category.latinName = randomCategory.latinName; 
      var added = categories.add(category); 
      expect(added, isFalse); 
      expect(categories.length, equals(categoryCount)); 
      expect(categories.errors.length, greaterThan(0)); 
 
      categories.errors.display(title: "Add category unique error"); 
    }); 
 
    test("Not found category by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var category = categories.singleWhereOid(dartlingOid); 
      expect(category, isNull); 
    }); 
 
    test("Find category by oid", () { 
      var randomCategory = categories.random(); 
      var category = categories.singleWhereOid(randomCategory.oid); 
      expect(category, isNotNull); 
      expect(category, equals(randomCategory)); 
    }); 
 
    test("Find category by attribute id", () { 
      var randomCategory = categories.random(); 
      var category = 
          categories.singleWhereAttributeId("latinName", randomCategory.latinName); 
      expect(category, isNotNull); 
      expect(category.latinName, equals(randomCategory.latinName)); 
    }); 
 
    test("Find category by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find category by attribute", () { 
      var randomCategory = categories.random(); 
      var category = 
          categories.firstWhereAttribute("description", randomCategory.description); 
      expect(category, isNotNull); 
      expect(category.description, equals(randomCategory.description)); 
    }); 
 
    test("Select categories by attribute", () { 
      var randomCategory = categories.random(); 
      var selectedCategories = 
          categories.selectWhereAttribute("description", randomCategory.description); 
      expect(selectedCategories.isEmpty, isFalse); 
      selectedCategories.forEach((se) => 
          expect(se.description, equals(randomCategory.description))); 
 
      //selectedCategories.display(title: "Select categories by description"); 
    }); 
 
    test("Select categories by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select categories by attribute, then add", () { 
      var randomCategory = categories.random(); 
      var selectedCategories = 
          categories.selectWhereAttribute("description", randomCategory.description); 
      expect(selectedCategories.isEmpty, isFalse); 
      expect(selectedCategories.source.isEmpty, isFalse); 
      var categoriesCount = categories.length; 
 
      var category = new Category(categories.concept); 
      category.latinName = 'darts'; 
      category.description = 'beans'; 
      category.isEdible = true; 
      category.harvestZone = 7579; 
      var added = selectedCategories.add(category); 
      expect(added, isTrue); 
      expect(categories.length, equals(++categoriesCount)); 
 
      //selectedCategories.display(title: 
      //  "Select categories by attribute, then add"); 
      //categories.display(title: "All categories"); 
    }); 
 
    test("Select categories by attribute, then remove", () { 
      var randomCategory = categories.random(); 
      var selectedCategories = 
          categories.selectWhereAttribute("description", randomCategory.description); 
      expect(selectedCategories.isEmpty, isFalse); 
      expect(selectedCategories.source.isEmpty, isFalse); 
      var categoriesCount = categories.length; 
 
      var removed = selectedCategories.remove(randomCategory); 
      expect(removed, isTrue); 
      expect(categories.length, equals(--categoriesCount)); 
 
      randomCategory.display(prefix: "removed"); 
      //selectedCategories.display(title: 
      //  "Select categories by attribute, then remove"); 
      //categories.display(title: "All categories"); 
    }); 
 
    test("Sort categories", () { 
      categories.sort(); 
 
      //categories.display(title: "Sort categories"); 
    }); 
 
    test("Order categories", () { 
      var orderedCategories = categories.order(); 
      expect(orderedCategories.isEmpty, isFalse); 
      expect(orderedCategories.length, equals(categories.length)); 
      expect(orderedCategories.source.isEmpty, isFalse); 
      expect(orderedCategories.source.length, equals(categories.length)); 
      expect(orderedCategories, isNot(same(categories))); 
 
      //orderedCategories.display(title: "Order categories"); 
    }); 
 
    test("Copy categories", () { 
      var copiedCategories = categories.copy(); 
      expect(copiedCategories.isEmpty, isFalse); 
      expect(copiedCategories.length, equals(categories.length)); 
      expect(copiedCategories, isNot(same(categories))); 
      copiedCategories.forEach((e) => 
        expect(e, equals(categories.singleWhereOid(e.oid)))); 
      copiedCategories.forEach((e) => 
        expect(e, isNot(same(categories.singleWhereId(e.id))))); 
 
      //copiedCategories.display(title: "Copy categories"); 
    }); 
 
    test("True for every category", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random category", () { 
      var category1 = categories.random(); 
      expect(category1, isNotNull); 
      var category2 = categories.random(); 
      expect(category2, isNotNull); 
 
      //category1.display(prefix: "random1"); 
      //category2.display(prefix: "random2"); 
    }); 
 
    test("Update category id with try", () { 
      var randomCategory = categories.random(); 
      var beforeUpdate = randomCategory.latinName; 
      try { 
        randomCategory.latinName = 'universe'; 
      } on UpdateError catch (e) { 
        expect(randomCategory.latinName, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update category id without try", () { 
      var randomCategory = categories.random(); 
      var beforeUpdateValue = randomCategory.latinName; 
      expect(() => randomCategory.latinName = 'teaching', throws); 
      expect(randomCategory.latinName, equals(beforeUpdateValue)); 
    }); 
 
    test("Update category id with success", () { 
      var randomCategory = categories.random(); 
      var afterUpdateEntity = randomCategory.copy(); 
      var attribute = randomCategory.concept.attributes.singleWhereCode("latinName"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.latinName = 'darts'; 
      expect(afterUpdateEntity.latinName, equals('darts')); 
      attribute.update = false; 
      var updated = categories.update(randomCategory, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = categories.singleWhereAttributeId("latinName", 'darts'); 
      expect(entity, isNotNull); 
      expect(entity.latinName, equals('darts')); 
 
      //categories.display("After update category id"); 
    }); 
 
    test("Update category non id attribute with failure", () { 
      var randomCategory = categories.random(); 
      var beforeUpdateValue = randomCategory.description; 
      var afterUpdateEntity = randomCategory.copy(); 
      afterUpdateEntity.description = 'sand'; 
      expect(afterUpdateEntity.description, equals('sand')); 
      // categories.update can only be used if oid, code or id is set. 
      expect(() => categories.update(randomCategory, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomCategory = categories.random(); 
      randomCategory.display(prefix:"before copy: "); 
      var randomCategoryCopy = randomCategory.copy(); 
      randomCategoryCopy.display(prefix:"after copy: "); 
      expect(randomCategory, equals(randomCategoryCopy)); 
      expect(randomCategory.oid, equals(randomCategoryCopy.oid)); 
      expect(randomCategory.code, equals(randomCategoryCopy.code)); 
      expect(randomCategory.latinName, equals(randomCategoryCopy.latinName)); 
      expect(randomCategory.description, equals(randomCategoryCopy.description)); 
      expect(randomCategory.isEdible, equals(randomCategoryCopy.isEdible)); 
      expect(randomCategory.harvestZone, equals(randomCategoryCopy.harvestZone)); 
 
      expect(randomCategory.id, isNotNull); 
      expect(randomCategoryCopy.id, isNotNull); 
      expect(randomCategory.id, equals(randomCategoryCopy.id)); 
 
      var idsEqual = false; 
      if (randomCategory.id == randomCategoryCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomCategory.id.equals(randomCategoryCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New category action undo and redo", () { 
      var categoryConcept = categories.concept; 
      var categoryCount = categories.length; 
          var category = new Category(categories.concept); 
      category.latinName = 'time'; 
      category.description = 'oil'; 
      category.isEdible = false; 
      category.harvestZone = 7381; 
      categories.add(category); 
      expect(categories.length, equals(++categoryCount)); 
      categories.remove(category); 
      expect(categories.length, equals(--categoryCount)); 
 
      var action = new AddAction(session, categories, category); 
      action.doit(); 
      expect(categories.length, equals(++categoryCount)); 
 
      action.undo(); 
      expect(categories.length, equals(--categoryCount)); 
 
      action.redo(); 
      expect(categories.length, equals(++categoryCount)); 
    }); 
 
    test("New category session undo and redo", () { 
      var categoryConcept = categories.concept; 
      var categoryCount = categories.length; 
          var category = new Category(categories.concept); 
      category.latinName = 'darts'; 
      category.description = 'truck'; 
      category.isEdible = true; 
      category.harvestZone = 733; 
      categories.add(category); 
      expect(categories.length, equals(++categoryCount)); 
      categories.remove(category); 
      expect(categories.length, equals(--categoryCount)); 
 
      var action = new AddAction(session, categories, category); 
      action.doit(); 
      expect(categories.length, equals(++categoryCount)); 
 
      session.past.undo(); 
      expect(categories.length, equals(--categoryCount)); 
 
      session.past.redo(); 
      expect(categories.length, equals(++categoryCount)); 
    }); 
 
    test("Category update undo and redo", () { 
      var category = categories.random(); 
      var action = new SetAttributeAction(session, category, "description", 'employer'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(category.description, equals(action.before)); 
 
      session.past.redo(); 
      expect(category.description, equals(action.after)); 
    }); 
 
    test("Category action with multiple undos and redos", () { 
      var categoryCount = categories.length; 
      var category1 = categories.random(); 
 
      var action1 = new RemoveAction(session, categories, category1); 
      action1.doit(); 
      expect(categories.length, equals(--categoryCount)); 
 
      var category2 = categories.random(); 
 
      var action2 = new RemoveAction(session, categories, category2); 
      action2.doit(); 
      expect(categories.length, equals(--categoryCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(categories.length, equals(++categoryCount)); 
 
      session.past.undo(); 
      expect(categories.length, equals(++categoryCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(categories.length, equals(--categoryCount)); 
 
      session.past.redo(); 
      expect(categories.length, equals(--categoryCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var categoryCount = categories.length; 
      var category1 = categories.random(); 
      var category2 = categories.random(); 
      while (category1 == category2) { 
        category2 = categories.random();  
      } 
      var action1 = new RemoveAction(session, categories, category1); 
      var action2 = new RemoveAction(session, categories, category2); 
 
      var transaction = new Transaction("two removes on categories", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      categoryCount = categoryCount - 2; 
      expect(categories.length, equals(categoryCount)); 
 
      categories.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      categoryCount = categoryCount + 2; 
      expect(categories.length, equals(categoryCount)); 
 
      categories.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      categoryCount = categoryCount - 2; 
      expect(categories.length, equals(categoryCount)); 
 
      categories.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var categoryCount = categories.length; 
      var category1 = categories.random(); 
      var category2 = category1; 
      var action1 = new RemoveAction(session, categories, category1); 
      var action2 = new RemoveAction(session, categories, category2); 
 
      var transaction = new Transaction( 
        "two removes on categories, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(categories.length, equals(categoryCount)); 
 
      //categories.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to category actions", () { 
      var categoryConcept = categories.concept; 
      var categoryCount = categories.length; 
 
      var reaction = new CategoryReaction(); 
      expect(reaction, isNotNull); 
 
      gardenDomain.startActionReaction(reaction); 
          var category = new Category(categories.concept); 
      category.latinName = 'theme'; 
      category.description = 'children'; 
      category.isEdible = false; 
      category.harvestZone = 5700; 
      categories.add(category); 
      expect(categories.length, equals(++categoryCount)); 
      categories.remove(category); 
      expect(categories.length, equals(--categoryCount)); 
 
      var session = gardenDomain.newSession(); 
      var addAction = new AddAction(session, categories, category); 
      addAction.doit(); 
      expect(categories.length, equals(++categoryCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, category, "description", 'right'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      gardenDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class CategoryReaction implements ActionReactionApi { 
  bool reactedOnAdd    = false; 
  bool reactedOnUpdate = false; 
 
  react(BasicAction action) { 
    if (action is EntitiesAction) { 
      reactedOnAdd = true; 
    } else if (action is EntityAction) { 
      reactedOnUpdate = true; 
    } 
  } 
} 
 
void main() { 
  var repository = new Repository(); 
  var gardenDomain = repository.getDomainModels("Garden");   
  assert(gardenDomain != null); 
  var plantsModel = gardenDomain.getModelEntries("Plants");  
  assert(plantsModel != null); 
  var categories = plantsModel.categories; 
  testGardenPlantsCategories(gardenDomain, plantsModel, categories); 
} 
 
