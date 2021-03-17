import 'package:app_food_delivery/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionList extends StatefulWidget{

  static List<product> food = new List();
  @override
  _ExpansionListState createState()=> _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList>{

  List<Item> _data = generateItems(ExpansionList.food.length);
  Widget _buildListPanel(){
    return ExpansionPanelList(
      expansionCallback :(int index,bool isExpanded){
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
          headerBuilder: (BuildContext context,bool isExpanded){
            return ListTile(
              title :Text(item.headerValue),
            );
          },
          body:ListTile(
            title: Text(item.expendedValue),
            subtitle: Text('to dealet this panel , tap the trash can icon'),
               trailing: new IconButton(
                 icon: new Icon(Icons.delete),
                 onPressed: (){
                   setState(() {
                     _data.removeWhere((currentItem)=>item == currentItem);
                   });
                 },
               )

          ),
          isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body:
         SingleChildScrollView(
               child : _buildListPanel(),
           )
         ,
      floatingActionButton:FloatingActionButton.extended(
               icon :Icon(Icons.payment),

             label:  Text('payement'),
               backgroundColor: Colors.green,
               foregroundColor: Colors.white,
               onPressed: () {
                 _paymentMethod();
                 },
             ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

         );
  }

  void _paymentMethod() {}

}
  class Item{
  String expendedValue;
  String headerValue;
  bool isExpanded;

  Item({this.expendedValue, this.headerValue, this.isExpanded = false});

}
List<Item> generateItems(int numberOfItems){
  return List.generate(numberOfItems,(index){
    return Item(expendedValue: 'this is item number$index',headerValue: 'Panel$index');
  });
}