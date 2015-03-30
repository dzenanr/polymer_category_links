import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:polymer_category_links/category_links.dart';

@CustomTag('link-table')
class LinkTable extends PolymerElement {
  @published Category category;
  @published Links links;
  @observable bool showAdd = false;

  LinkTable.created() : super.created();

  attached() {
    super.attached();
    links = category.links;
    links.internalList = toObservable(links.internalList);
  }

  show(Event e, var detail, Node target) {
    ButtonElement addLink = $['show-add'];
    if (addLink.text == 'Show Add') {
      showAdd = true;
      addLink.text = 'Hide Add';
    } else {
      showAdd = false;
      addLink.text = 'Show Add';
    }
  }
}