class souscateg {
  String idProd;
  String detail;
  String exist;

  // special value
  bool isPressed=false;

  souscateg({this.idProd, this.detail, this.exist});
  static List<souscateg> sous_categorie = new List();
  souscateg.fromJson(List<dynamic> json) {
    for(int i=0;i<json.length;i++){
      sous_categorie.add(souscateg(
        idProd : json[i]['id_prod'],
        detail : json[i]['detail'],
        exist : json[i]['exist'],
      ));

    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_prod'] = this.idProd;
    data['detail'] = this.detail;
    data['exist'] = this.exist;
    return data;
  }
}
