import 'package:app_food_delivery/models/sous_categ.dart';
import 'package:app_food_delivery/models/supplement.dart';
class product {
  String id;
  String idCategorie;
  String name;
  String image;
  String price;

  product({this.id, this.idCategorie, this.name, this.image, this.price});
  static List<product> prod = new List();
  product.fromJson(List<dynamic> json) {
    print(json.length.toString());
    for(int i=0;i<json.length;i++){
      prod.add(product(
        id : json[i]['id'],
        idCategorie : json[i]['id_categorie'],
        name : json[i]['name'],
        image : json[i]['image'],
        price : json[i]['price'],
      ));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_categorie'] = this.idCategorie;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
List<souscateg> sous_categ = new List();
List<supplement> supp = new List();
addsouscateg(){
    for(int i=0;i<souscateg.sous_categorie.length;i++)
    {
      if(this.id== souscateg.sous_categorie[i].idProd)
        sous_categ.add(souscateg.sous_categorie[i]);
    }
  }
 addsupplementaire(){
    for(int i=0;i<supplement.supp.length;i++)
    {
      if(this.id== supplement.supp[i].idProd)
        supp.add(supplement.supp[i]);
    }
  }




}

