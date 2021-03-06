import 'dart:html';
import 'dart:convert';
import 'package:polymer/polymer.dart';
import 'package:polymer_category_links/category_links.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  static const String NAME = 'polymer-category-links';
  @observable Categories categories;

  PolymerApp.created() : super.created() {
    var categoryLinksModel = new CategoryLinksModel();
    categories = categoryLinksModel.categories;

    // load data
    String json = window.localStorage[NAME];
    if (json == null) {
      categoryLinksModel.init();
    } else {
      categories.fromJson(JSON.decode(json));
    }

    categories.internalList = toObservable(categories.internalList);
  }

  save() {
    window.localStorage[NAME] = JSON.encode(categories.toJson());
  }
}