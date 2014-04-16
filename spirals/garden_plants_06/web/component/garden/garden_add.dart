import 'dart:html';
import 'package:garden_plants/garden_plants.dart';
import 'package:polymer/polymer.dart';

@CustomTag('garden-add')
class GardenAdd extends PolymerElement {
  @published Gardens gardens;

  GardenAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement name = shadowRoot.querySelector("#name");
    InputElement description = shadowRoot.querySelector("#description");
    InputElement latitude = shadowRoot.querySelector("#latitude");
    InputElement longitude = shadowRoot.querySelector("#longitude");
    Element message = shadowRoot.querySelector("#message");
    var error = false;
    message.text = '';
    if (name.value.trim() == '') {
      message.text = 'garden name is mandatory; ${message.text}';
      error = true;
    }
    if (latitude.value.trim() != '') {
      try {
        double.parse(latitude.value);
      } catch(e) {
        message.text = 'latitude must be double; ${message.text}';
        error = true;
      } 
    }
    if (longitude.value.trim() != '') {
      try {
        double.parse(longitude.value);
      } catch(e) {
        message.text = 'longitude must be double; ${message.text}';
        error = true;
      } 
    }
    if (!error) {
      var garden = new Garden(gardens.concept);
      garden.name = name.value;
      garden.description = description.value;
      if (latitude.value.trim() != '') {
        garden.latitude = double.parse(latitude.value);
      }
      if (longitude.value.trim() != '') {
        garden.longitude = double.parse(longitude.value);
      }
      if (gardens.add(garden)) {
        message.text = 'added';
        gardens.sort();
      } else {
        message.text = 'garden name already in use';
      }
    }
  }
}