import 'dart:html';
import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-table')
class CategoryTable extends PolymerElement {
  @published Categories categories;
  Category category;
  @observable bool showAdd = false;
  @observable bool showEdit = false;

  show(Event e, var detail, Node target) {
    ButtonElement addCategory = shadowRoot.query("#show-add");
    if (addCategory.text == 'Show Add') {
      showAdd = true;
      addCategory.text = 'Hide Add';
    } else {
      showAdd = false;
      addCategory.text = 'Show Add';
    }
  }

  edit(Event e, var detail, Element target) {
    String code = target.attributes['category-code'];
    category = categories.find(code);
    showEdit = true;
  }
}