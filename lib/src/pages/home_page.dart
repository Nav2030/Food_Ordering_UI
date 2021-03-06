import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../widgets/home_top_info.dart';
import '../widgets/food_category.dart';
import '../widgets/search_field.dart';
import '../widgets/bought_food.dart';
import '../data/food_data.dart';
import '../models/food_model.dart';

const url = '';
const email = 'juniorvilanculo95@gmail.com';
const phone = '+258 848 396 068';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food> _foods = foods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 20.0),
          SearchField(),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Frequentes",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Ver Todos",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Column(
            children: _foods.map(_buildFoodItens).toList(),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        overlayOpacity: 0.1,
        overlayColor: Colors.deepOrange,
        backgroundColor: Colors.green,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              backgroundColor: Colors.green,
              child: Icon(
                FeatherIcons.phoneCall,
              ),
              label: "Linha de Cliente", 
              onTap: () async {
                {
                  String removeSpaceFromPhoneNumber =
                      phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                  final phoneCall = 'tel:$removeSpaceFromPhoneNumber';

                  if (await canLaunch(phoneCall)) {
                    await launch(phoneCall);
                  }
                }
              }),
          SpeedDialChild(
              backgroundColor: Colors.green,
              child: Icon(
                FeatherIcons.messageSquare,
              ),
              label: "Mensagem",
              onTap: () async {
                {
                  String removeSpaceFromPhoneNumber =
                      phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                  final phoneCall = 'sms:$removeSpaceFromPhoneNumber';

                  if (await canLaunch(phoneCall)) {
                    await launch(phoneCall);
                  }
                }
              })
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () async{
             String removeSpaceFromPhoneNumber = phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                final phoneCall = 'tel:$removeSpaceFromPhoneNumber';

                if (await canLaunch(phoneCall)) {
                  await launch(phoneCall);
                } 
          },
          child: Icon(FeatherIcons.phoneCall, ),
          backgroundColor: Colors.green,
          
        )*/
    );
  }

  Widget _buildFoodItens(Food food) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: BoughtFoods(
        id: food.id,
        name: food.name,
        price: food.price,
        imagePath: food.imagePath,
        ratings: food.ratings,
        category: food.category,
        details: food.details,
      ),
    );
  }
}
