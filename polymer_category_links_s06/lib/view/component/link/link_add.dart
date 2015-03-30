import 'dart:html';
import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('link-add')
class LinkAdd extends PolymerElement {
  @published Category category;

  LinkAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement code = $['code'];
    InputElement webLink = $['url'];
    InputElement description = $['description'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (code.value.trim() == '') {
      message.text = 'web link name is mandatory; ${message.text}';
      error = true;
    }
    if (webLink.value.trim() == '') {
      message.text = 'web link is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var link = new Link();
      link.code = code.value;
      link.url = Uri.parse(webLink.value);
      link.description = description.value;
      if (category.links.add(link)) {
        message.text = 'added';
        category.links.order();
        var polymerApp = querySelector('#polymer-app');
        polymerApp.save();
      } else {
        message.text = 'web link name already in use';
      }
    }
  }
}

