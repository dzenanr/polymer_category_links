import 'dart:html';
import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-edit')
class CategoryEdit extends PolymerElement {
  @published Categories categories;
  @published Category category;

  update(Event e, var detail, Node target) {
    InputElement description = shadowRoot.query('#${category.code}-description');
    category.description = description.value;
    //categories.order(); // to see a new description in the list ?
    var polymerApp = query('#polymer-app');
    var categoryTable = polymerApp.shadowRoot.query('#category-table').xtag;
    categoryTable.showEdit = false;
  }
}