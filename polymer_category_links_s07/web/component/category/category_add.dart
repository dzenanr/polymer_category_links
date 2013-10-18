import 'dart:html';
import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-add')
class CategoryAdd extends PolymerElement {
  @published Categories categories;

  add(Event e, var detail, Node target) {
    InputElement code = $['code'];
    InputElement description = $['description'];
    Element message = $['message'];
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
        categories.order(); // to see a new category in the list
      } else {
        message.text = 'category name already in use';
      }
    }
  }
}