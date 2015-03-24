import 'dart:html';
import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';
import 'category_table.dart';

@CustomTag('category-edit')
class CategoryEdit extends PolymerElement {
  @published Categories categories;
  @published Category category;
  @published String description;

  CategoryEdit.created() : super.created();

  attached() {
    super.attached();
    description = category.description;
  }

  update(Event e, var detail, Node target) {
    category.description = description;
    categories.order(); // to see a new description in the list
    var polymerApp = querySelector('#polymer-app');
    CategoryTable categoryTable =
        polymerApp.shadowRoot.querySelector('#category-table');
    categoryTable.showEdit = false;
  }
}