 
// test/garden/plants/garden_plants_garden_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:garden_plants/garden_plants.dart"; 
 
testGardenPlantsGardens( 
    GardenDomain gardenDomain, PlantsModel plantsModel, Gardens gardens) { 
  DomainSession session; 
  group("Testing Garden.Plants.Garden", () { 
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
      expect(gardens.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      plantsModel.clear(); 
      expect(plantsModel.isEmpty, isTrue); 
      expect(gardens.isEmpty, isTrue); 
      expect(gardens.errors.isEmpty, isTrue); 
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
      var json = plantsModel.fromEntryToJson("Garden"); 
      expect(json, isNotNull); 
 
      print(json); 
      //plantsModel.displayEntryJson("Garden"); 
      //plantsModel.displayJson(); 
      //plantsModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = plantsModel.fromEntryToJson("Garden"); 
      gardens.clear(); 
      expect(gardens.isEmpty, isTrue); 
      plantsModel.fromJsonToEntry(json); 
      expect(gardens.isEmpty, isFalse); 
 
      gardens.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add garden required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add garden unique error", () { 
      var gardenConcept = gardens.concept; 
      var gardenCount = gardens.length; 
      var garden = new Garden(gardenConcept); 
      var randomGarden = gardens.random(); 
      garden.name = randomGarden.name; 
      var added = gardens.add(garden); 
      expect(added, isFalse); 
      expect(gardens.length, equals(gardenCount)); 
      expect(gardens.errors.length, greaterThan(0)); 
 
      gardens.errors.display(title: "Add garden unique error"); 
    }); 
 
    test("Not found garden by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var garden = gardens.singleWhereOid(dartlingOid); 
      expect(garden, isNull); 
    }); 
 
    test("Find garden by oid", () { 
      var randomGarden = gardens.random(); 
      var garden = gardens.singleWhereOid(randomGarden.oid); 
      expect(garden, isNotNull); 
      expect(garden, equals(randomGarden)); 
    }); 
 
    test("Find garden by attribute id", () { 
      var randomGarden = gardens.random(); 
      var garden = 
          gardens.singleWhereAttributeId("name", randomGarden.name); 
      expect(garden, isNotNull); 
      expect(garden.name, equals(randomGarden.name)); 
    }); 
 
    test("Find garden by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find garden by attribute", () { 
      var randomGarden = gardens.random(); 
      var garden = 
          gardens.firstWhereAttribute("description", randomGarden.description); 
      expect(garden, isNotNull); 
      expect(garden.description, equals(randomGarden.description)); 
    }); 
 
    test("Select gardens by attribute", () { 
      var randomGarden = gardens.random(); 
      var selectedGardens = 
          gardens.selectWhereAttribute("description", randomGarden.description); 
      expect(selectedGardens.isEmpty, isFalse); 
      selectedGardens.forEach((se) => 
          expect(se.description, equals(randomGarden.description))); 
 
      //selectedGardens.display(title: "Select gardens by description"); 
    }); 
 
    test("Select gardens by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select gardens by attribute, then add", () { 
      var randomGarden = gardens.random(); 
      var selectedGardens = 
          gardens.selectWhereAttribute("description", randomGarden.description); 
      expect(selectedGardens.isEmpty, isFalse); 
      expect(selectedGardens.source.isEmpty, isFalse); 
      var gardensCount = gardens.length; 
 
      var garden = new Garden(gardens.concept); 
      garden.name = 'walking'; 
      garden.description = 'coffee'; 
      garden.latitude = 58.91220569683633; 
      garden.longiitude = 94.37786658543014; 
      var added = selectedGardens.add(garden); 
      expect(added, isTrue); 
      expect(gardens.length, equals(++gardensCount)); 
 
      //selectedGardens.display(title: 
      //  "Select gardens by attribute, then add"); 
      //gardens.display(title: "All gardens"); 
    }); 
 
    test("Select gardens by attribute, then remove", () { 
      var randomGarden = gardens.random(); 
      var selectedGardens = 
          gardens.selectWhereAttribute("description", randomGarden.description); 
      expect(selectedGardens.isEmpty, isFalse); 
      expect(selectedGardens.source.isEmpty, isFalse); 
      var gardensCount = gardens.length; 
 
      var removed = selectedGardens.remove(randomGarden); 
      expect(removed, isTrue); 
      expect(gardens.length, equals(--gardensCount)); 
 
      randomGarden.display(prefix: "removed"); 
      //selectedGardens.display(title: 
      //  "Select gardens by attribute, then remove"); 
      //gardens.display(title: "All gardens"); 
    }); 
 
    test("Sort gardens", () { 
      gardens.sort(); 
 
      //gardens.display(title: "Sort gardens"); 
    }); 
 
    test("Order gardens", () { 
      var orderedGardens = gardens.order(); 
      expect(orderedGardens.isEmpty, isFalse); 
      expect(orderedGardens.length, equals(gardens.length)); 
      expect(orderedGardens.source.isEmpty, isFalse); 
      expect(orderedGardens.source.length, equals(gardens.length)); 
      expect(orderedGardens, isNot(same(gardens))); 
 
      //orderedGardens.display(title: "Order gardens"); 
    }); 
 
    test("Copy gardens", () { 
      var copiedGardens = gardens.copy(); 
      expect(copiedGardens.isEmpty, isFalse); 
      expect(copiedGardens.length, equals(gardens.length)); 
      expect(copiedGardens, isNot(same(gardens))); 
      copiedGardens.forEach((e) => 
        expect(e, equals(gardens.singleWhereOid(e.oid)))); 
      copiedGardens.forEach((e) => 
        expect(e, isNot(same(gardens.singleWhereId(e.id))))); 
 
      //copiedGardens.display(title: "Copy gardens"); 
    }); 
 
    test("True for every garden", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random garden", () { 
      var garden1 = gardens.random(); 
      expect(garden1, isNotNull); 
      var garden2 = gardens.random(); 
      expect(garden2, isNotNull); 
 
      //garden1.display(prefix: "random1"); 
      //garden2.display(prefix: "random2"); 
    }); 
 
    test("Update garden id with try", () { 
      var randomGarden = gardens.random(); 
      var beforeUpdate = randomGarden.name; 
      try { 
        randomGarden.name = 'present'; 
      } on UpdateError catch (e) { 
        expect(randomGarden.name, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update garden id without try", () { 
      var randomGarden = gardens.random(); 
      var beforeUpdateValue = randomGarden.name; 
      expect(() => randomGarden.name = 'craving', throws); 
      expect(randomGarden.name, equals(beforeUpdateValue)); 
    }); 
 
    test("Update garden id with success", () { 
      var randomGarden = gardens.random(); 
      var afterUpdateEntity = randomGarden.copy(); 
      var attribute = randomGarden.concept.attributes.singleWhereCode("name"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.name = 'chairman'; 
      expect(afterUpdateEntity.name, equals('chairman')); 
      attribute.update = false; 
      var updated = gardens.update(randomGarden, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = gardens.singleWhereAttributeId("name", 'chairman'); 
      expect(entity, isNotNull); 
      expect(entity.name, equals('chairman')); 
 
      //gardens.display("After update garden id"); 
    }); 
 
    test("Update garden non id attribute with failure", () { 
      var randomGarden = gardens.random(); 
      var beforeUpdateValue = randomGarden.description; 
      var afterUpdateEntity = randomGarden.copy(); 
      afterUpdateEntity.description = 'holiday'; 
      expect(afterUpdateEntity.description, equals('holiday')); 
      // gardens.update can only be used if oid, code or id is set. 
      expect(() => gardens.update(randomGarden, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomGarden = gardens.random(); 
      randomGarden.display(prefix:"before copy: "); 
      var randomGardenCopy = randomGarden.copy(); 
      randomGardenCopy.display(prefix:"after copy: "); 
      expect(randomGarden, equals(randomGardenCopy)); 
      expect(randomGarden.oid, equals(randomGardenCopy.oid)); 
      expect(randomGarden.code, equals(randomGardenCopy.code)); 
      expect(randomGarden.name, equals(randomGardenCopy.name)); 
      expect(randomGarden.description, equals(randomGardenCopy.description)); 
      expect(randomGarden.latitude, equals(randomGardenCopy.latitude)); 
      expect(randomGarden.longiitude, equals(randomGardenCopy.longiitude)); 
 
      expect(randomGarden.id, isNotNull); 
      expect(randomGardenCopy.id, isNotNull); 
      expect(randomGarden.id, equals(randomGardenCopy.id)); 
 
      var idsEqual = false; 
      if (randomGarden.id == randomGardenCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomGarden.id.equals(randomGardenCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New garden action undo and redo", () { 
      var gardenConcept = gardens.concept; 
      var gardenCount = gardens.length; 
          var garden = new Garden(gardens.concept); 
      garden.name = 'corner'; 
      garden.description = 'cream'; 
      garden.latitude = 89.83201895489576; 
      garden.longiitude = 40.583077224142485; 
      gardens.add(garden); 
      expect(gardens.length, equals(++gardenCount)); 
      gardens.remove(garden); 
      expect(gardens.length, equals(--gardenCount)); 
 
      var action = new AddAction(session, gardens, garden); 
      action.doit(); 
      expect(gardens.length, equals(++gardenCount)); 
 
      action.undo(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      action.redo(); 
      expect(gardens.length, equals(++gardenCount)); 
    }); 
 
    test("New garden session undo and redo", () { 
      var gardenConcept = gardens.concept; 
      var gardenCount = gardens.length; 
          var garden = new Garden(gardens.concept); 
      garden.name = 'notch'; 
      garden.description = 'concern'; 
      garden.latitude = 42.695042943107765; 
      garden.longiitude = 91.40529652111016; 
      gardens.add(garden); 
      expect(gardens.length, equals(++gardenCount)); 
      gardens.remove(garden); 
      expect(gardens.length, equals(--gardenCount)); 
 
      var action = new AddAction(session, gardens, garden); 
      action.doit(); 
      expect(gardens.length, equals(++gardenCount)); 
 
      session.past.undo(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      session.past.redo(); 
      expect(gardens.length, equals(++gardenCount)); 
    }); 
 
    test("Garden update undo and redo", () { 
      var garden = gardens.random(); 
      var action = new SetAttributeAction(session, garden, "description", 'instruction'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(garden.description, equals(action.before)); 
 
      session.past.redo(); 
      expect(garden.description, equals(action.after)); 
    }); 
 
    test("Garden action with multiple undos and redos", () { 
      var gardenCount = gardens.length; 
      var garden1 = gardens.random(); 
 
      var action1 = new RemoveAction(session, gardens, garden1); 
      action1.doit(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      var garden2 = gardens.random(); 
 
      var action2 = new RemoveAction(session, gardens, garden2); 
      action2.doit(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(gardens.length, equals(++gardenCount)); 
 
      session.past.undo(); 
      expect(gardens.length, equals(++gardenCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      session.past.redo(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var gardenCount = gardens.length; 
      var garden1 = gardens.random(); 
      var garden2 = gardens.random(); 
      while (garden1 == garden2) { 
        garden2 = gardens.random();  
      } 
      var action1 = new RemoveAction(session, gardens, garden1); 
      var action2 = new RemoveAction(session, gardens, garden2); 
 
      var transaction = new Transaction("two removes on gardens", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      gardenCount = gardenCount - 2; 
      expect(gardens.length, equals(gardenCount)); 
 
      gardens.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      gardenCount = gardenCount + 2; 
      expect(gardens.length, equals(gardenCount)); 
 
      gardens.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      gardenCount = gardenCount - 2; 
      expect(gardens.length, equals(gardenCount)); 
 
      gardens.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var gardenCount = gardens.length; 
      var garden1 = gardens.random(); 
      var garden2 = garden1; 
      var action1 = new RemoveAction(session, gardens, garden1); 
      var action2 = new RemoveAction(session, gardens, garden2); 
 
      var transaction = new Transaction( 
        "two removes on gardens, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(gardens.length, equals(gardenCount)); 
 
      //gardens.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to garden actions", () { 
      var gardenConcept = gardens.concept; 
      var gardenCount = gardens.length; 
 
      var reaction = new GardenReaction(); 
      expect(reaction, isNotNull); 
 
      gardenDomain.startActionReaction(reaction); 
          var garden = new Garden(gardens.concept); 
      garden.name = 'photo'; 
      garden.description = 'message'; 
      garden.latitude = 65.43080395955889; 
      garden.longiitude = 34.389216904491605; 
      gardens.add(garden); 
      expect(gardens.length, equals(++gardenCount)); 
      gardens.remove(garden); 
      expect(gardens.length, equals(--gardenCount)); 
 
      var session = gardenDomain.newSession(); 
      var addAction = new AddAction(session, gardens, garden); 
      addAction.doit(); 
      expect(gardens.length, equals(++gardenCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, garden, "description", 'privacy'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      gardenDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class GardenReaction implements ActionReactionApi { 
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
  var gardens = plantsModel.gardens; 
  testGardenPlantsGardens(gardenDomain, plantsModel, gardens); 
} 
 
