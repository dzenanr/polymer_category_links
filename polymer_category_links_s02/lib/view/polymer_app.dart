import 'package:polymer/polymer.dart';
import 'package:polymer_category_links/category_links.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  @observable Categories categories;

  PolymerApp.created() : super.created() {
    var categoryLinksModel = new CategoryLinksModel();
    categoryLinksModel.init();
    categories = categoryLinksModel.categories;
    categories.internalList = toObservable(categories.internalList);
  }
}