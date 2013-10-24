import 'package:polymer_category_links/category_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('category-table')
class CategoryTable extends PolymerElement {
  @published Categories categories;

  CategoryTable.created() : super.created();
}