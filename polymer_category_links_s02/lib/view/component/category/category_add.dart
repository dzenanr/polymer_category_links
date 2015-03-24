import 'dart:html';
import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-add')
class CategoryAdd extends PolymerElement {
  @published Categories categories;

  CategoryAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement code = shadowRoot.querySelector("#code");
    InputElement description = shadowRoot.querySelector("#description");
    Element message = shadowRoot.querySelector("#message");
    var error = false;
    message.text = '';
    if (code.value.trim() == '') {
      message.text = 'category name is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var category = new Category();
      category.code = code.value;
      category.description = description.value;
      if (categories.add(category)) {
        message.text = 'added';
        categories.order();
      } else {
        message.text = 'category name already in use';
      }
    }
  }
}