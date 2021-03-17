import 'package:app_food_delivery/models/product.dart';

class Category {
  String id;
  String name;

  Category({this.id, this.name});
  static List<Category> setCategory = new List();
  Category.fromJson(List<dynamic> json) {
    for(int i=0;i<json.length;i++){
      setCategory.add(Category(
          id : json[i]['id'] ,name: json[i]['name'].toString()
      ));
    }
  }

List<product> listProd = new List();
    setList()
  {
    for(int i=0;i<product.prod.length;i++)
      {
        if(product.prod[i].idCategorie==this.id)
          listProd.add(product.prod[i]);
      }
  }


  }


