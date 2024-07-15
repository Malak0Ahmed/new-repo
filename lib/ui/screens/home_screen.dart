import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_3/data/data_models/product_data_model.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductDataModel> mylist=[];

  Future<void> getProductData() async{
    var response= await http.get(Uri.parse('http://dummyjson.com/products'));
    if(response.statusCode==200){
      Map<String,dynamic> data=jsonDecode(response.body);

      List<dynamic> productsList= data['products'];

      for(Map<String,dynamic> item in productsList){
        ProductDataModel p=ProductDataModel.fromMapJason(item);
        mylist.add(p);
      }

      setState(() {

      });
    }
    else{
      print('Error${response.statusCode}');
      print('Error${response.body}');
    }
  }

  @override
  void initState(){
    super.initState();
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Products',
          textAlign: TextAlign.center,
        ),
      ),
      body: GridView.builder(
        itemCount: mylist.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Card(
            child:Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),

            ),
            padding: const EdgeInsets.all(8.0),
              constraints: BoxConstraints(
                maxHeight: 200, // Set the maximum height for the card
              ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                mylist[index].imageURL != null
                    ? Image.network(
                  height: 70,
                  mylist[index].imageURL!,
                  width: double.infinity,
                  fit:BoxFit.contain,
                )
                    : Image.asset(
                  'assets/img.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'name: ${mylist[index].name ?? 'no data'}',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    'description: ${mylist[index].description ?? 'no data'}',
                    maxLines: 2,
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                  Text(
                  'price: ${mylist[index].price ?? 'no data'}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                      SizedBox(width: 50,),
                      Icon(
                          Icons.shop,
                        size: 22,
                        color: Colors.deepPurple.shade600,
                        
                      ),
                    ],
                  ),

                ),
              ],
            ),
          ),
          );
        },
      ),
    );
  }
}
