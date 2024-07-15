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
        title: Text('Products'),
      ),
      body: GridView.builder(
        itemCount: mylist.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Card(
            child:Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mylist[index].imageURL != null
                    ? Image.network(
                  mylist[index].imageURL!,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.fitHeight,
                )
                    : Image.asset(
                  'assets/img.jpg',
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'name: ${mylist[index].name ?? 'no data'}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'description: ${mylist[index].description ?? 'no data'}',
                    maxLines: 2,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'price: ${mylist[index].price ?? 'no data'}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
