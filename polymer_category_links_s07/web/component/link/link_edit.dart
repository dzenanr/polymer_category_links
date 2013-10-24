import 'dart:html';
import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('link-edit')
class LinkEdit extends PolymerElement {
  @published Category category;
  @published Links links;
  @published Link link;
  @published String code;
  @published String url;
  @published String description;

  LinkEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    links = category.links;
    links.internalList = toObservable(links.internalList);
    code = link.code;
    url = link.url.toString();
    description = link.description;
  }

  update(Event e, var detail, Node target) {
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (code.trim() == '') {
      message.text = 'web link name is mandatory; ${message.text}';
      error = true;
    }
    if (url.trim() == '') {
      message.text = 'web link is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      if (link.code != code) {
        var existingLink = links.find(code);
        if (existingLink != null) {
          message.text = 'web link name already in use';
        } else {
          links.remove(link);
          var link = new Link();
          link.code = code;
          link.url = Uri.parse(url);
          link.description = description;
          if (links.add(link)) {
            message.text = 'added';
          } else {
            message.text = 'not added';
          }
        }
      } else {
        link.url = Uri.parse(url);
        link.description = description;
      }
      links.order(); // even if code not changed, to see the updated list
      var polymerApp = querySelector('#polymer-app');
      var categoryTable = polymerApp.shadowRoot.querySelector('#category-table');
      var linkTable = categoryTable.shadowRoot.querySelector('#link-table');
      linkTable.showEdit = false;
    }
  }
}

