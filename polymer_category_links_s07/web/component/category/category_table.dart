import 'dart:html';
import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-table')
class CategoryTable extends PolymerElement {
  @published Categories categories;
  Category category;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showCategoryLinks = false;

  show(Event e, var detail, Node target) {
    ButtonElement addCategory = $['show-add'];
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

  delete(Event e, var detail, Element target) {
    String code = target.attributes['category-code'];
    category = categories.find(code);
    categories.remove(category);
    showCategoryLinks = false;
  }

  showLinks(Event e, var detail, Element target) {
    String code = target.attributes['category-code'];
    ButtonElement categoryLinks = target;
    if (!showCategoryLinks && categoryLinks.text == 'Show') {
      showCategoryLinks = true;
      category = categories.find(code);
      categoryLinks.text = 'Hide';
    } else if (showCategoryLinks && categoryLinks.text == 'Hide') {
      showCategoryLinks = false;
      categoryLinks.text = 'Show';
    }
  }
}