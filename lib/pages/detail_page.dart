import 'package:app_food_delivery/core/consts.dart';
import 'package:app_food_delivery/core/flutter_icons.dart';
import 'package:app_food_delivery/models/ImageToTest.dart';
import 'package:app_food_delivery/models/product.dart';
import 'package:app_food_delivery/models/sous_categ.dart';
import 'package:app_food_delivery/models/supplement.dart';
import 'package:flutter/material.dart';
import 'package:app_food_delivery/pages/PanierPage.dart';
import 'package:app_food_delivery/pages/ExpansionList.dart';

class DetailPage extends StatefulWidget {
  final product data;
  final FoodModel imaTest;

  DetailPage(this.data,this.imaTest);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
   List<product> ListAdded = ExpansionList.food;
  String im ="1.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 400,
            delegate: SliverChildListDelegate([
              Column(children: [
                _customAppBar(),
                Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/bg.png"),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Hero(
                          tag: "image${widget.imaTest.imgPath}",
                          child: Image(
                            image: AssetImage("assets/${widget.imaTest.imgPath}"),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${widget.data.name}",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Text(
                          "\$${widget.data.price}",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.redColor,
                          ),
                        ),
                        SizedBox(width: 30),
                        _buildCounter(),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildInfo("Weight"),
                        _buildInfo(
                            "Calories  ccal"),
                        _buildInfo(
                            " Protein gm"),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Items",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Composant de ce produit",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(widget.data.sous_categ.length, (index) {
                         /* print(widget.data.sous_categ.length);
                          for(int i=0; i<widget.data.sous_categ.length;i++)
                            {try{print(widget.data.sous_categ[i].detail);}
                            catch(e) {print('error ki zebbi' + e);}
                              }*/
                          return setsscateg(widget.data.sous_categ[index]);
                        })
                    ),
                    Text(
                      "Select Supplementaire",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(widget.data.supp.length, (index) {
                          return setsupplement(widget.data.supp[index]);
                        })
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            onPressed: () {
                              addToCard();
                            },
                            padding: EdgeInsets.symmetric(vertical: 16),
                            color: AppColors.greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String title) {//, String val
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      /*  Text(
          "$val",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.redColor,
          ),
        ),*/
      ],
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              addtoListssCateg.clear();
              addtoListsupp.clear();
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Icon(
                FlutterIcons.left,
                size: 16,
              ),
            ),
          ),
          /* Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Icon(
              FlutterIcons.shop,
              size: 16,
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                if (_Count != 0) _Count--;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _Count.toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _Count++;
              });
            },
          ),
        ],
      ),
    );
  }
int _Count=0;


  void addToCard() {
    product setToCard = product(id: widget.data.id,idCategorie:widget.data.idCategorie ,name:widget.data.name  , image:widget.data.image ,price:widget.data.price);
    setToCard.supp = addtoListsupp;
    setToCard.sous_categ=addtoListssCateg;
    ListAdded.add(setToCard);
  }
 List<souscateg> addtoListssCateg=new List();
  Widget setsscateg(souscateg sous_categ) {
    bool tapped=false;
    String opt=sous_categ.detail;
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 16),
      color: sous_categ.isPressed?AppColors.redColor:AppColors.greenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: Text(
        opt,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
      onPressed: () {
        setState(() {
          sous_categ.isPressed=!sous_categ.isPressed;
          if(sous_categ.isPressed== true)
            addtoListssCateg.add(sous_categ);
          else
            addtoListssCateg.remove(sous_categ);
        });
      },
    );
  }


 List<supplement> addtoListsupp=new List();
  Widget setsupplement(supplement supp) {

    String opt=supp.detail;
   return  RaisedButton(
      onPressed: () {
        if(!supp.isPressed)
          setState(() {
            supp.isPressed=true;
            addtoListsupp.add(supp);
          });
        else{
          setState(() {
            supp.isPressed=false;
            addtoListsupp.remove(supp);
          });
        }
        for(int i=0;i<addtoListsupp.length;i++)
          print(addtoListsupp[i].detail);
      },
      padding: EdgeInsets.symmetric(vertical: 16),
      color: supp.isPressed?AppColors.redColor:AppColors.greenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: Text(
        opt,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }





}
