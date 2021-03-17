class supplement {
  String detail;
  String price;
  String idProd;
   bool isPressed =false;
  supplement({this.detail, this.price, this.idProd});
  static List<supplement> supp= new List();
  supplement.fromJson(List<dynamic> json) {
    for(int i=0;i<json.length;i++) {
      supp.add(supplement(
          idProd : json[i]['id_prod'],
          detail : json[i]['detail'],
          price : json[i]['price']
      ));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['price'] = this.price;
    data['id_prod'] = this.idProd;
    return data;
  }
}