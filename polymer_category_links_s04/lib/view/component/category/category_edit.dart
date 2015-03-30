import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:polymer_category_links/category_links.dart';
import 'category_table.dart';

@CustomTag('category-edit')
class CategoryEdit extends PolymerElement {
  @published Categories categories;
  @published Category category;

  CategoryEdit.created() : super.created();

  update(Event e, var detail, Node target) {
    var polymerApp = querySelector('#polymer-app');
    CategoryTable categoryTable = polymerApp.shadowRoot.querySelector('#category-table');
    categoryTable.showEdit = false;
  }
}