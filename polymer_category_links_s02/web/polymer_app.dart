import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  Categories categories;

  PolymerApp() {
    var categoryLinksModel = new CategoryLinksModel();
    categoryLinksModel.init();
    categories = categoryLinksModel.categories;
    categories.internalList = toObservable(categories.internalList);
  }
}