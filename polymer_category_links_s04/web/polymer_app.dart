import 'dart:html';
import 'dart:convert';
import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  Categories categories;

  PolymerApp() {
    var categoryLinksModel = new CategoryLinksModel();
    categories = categoryLinksModel.categories;

    // load data
    String json = window.localStorage['polymer_category_links'];
    if (json == null) {
      categoryLinksModel.init();
    } else {
      categories.fromJson(JSON.decode(json));
    }

    categories.internalList = toObservable(categories.internalList);
  }

  save(Event e, var detail, Node target) {
    window.localStorage['polymer_category_links'] =
        JSON.encode(categories.toJson());
  }
}