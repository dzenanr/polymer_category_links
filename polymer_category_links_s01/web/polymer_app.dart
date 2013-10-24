import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  // Categories categories; // does not work wout @observable
  @observable Categories categories;

  PolymerApp.created() : super.created() {
    var categoryLinksModel = new CategoryLinksModel();
    categoryLinksModel.init();
    categories = categoryLinksModel.categories;
  }
}