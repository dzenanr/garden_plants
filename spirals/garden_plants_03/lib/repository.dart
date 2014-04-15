part of garden_plants; 
 
// lib/repository.dart 
 
class Repository extends Repo { 
 
  static const REPOSITORY = "Repository"; 
 
  Repository([String code=REPOSITORY]) : super(code) { 
    var domain = new Domain("Garden"); 
    domains.add(domain); 
    add(new GardenDomain(domain)); 
 
  } 
 
} 
 
