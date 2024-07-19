 import 'package:project_3/data/data_models/product_data_model.dart';
 import 'package:http/http.dart' as http;
 import 'dart:convert';

class ProductsDataSources{

   static bool isLoading = true;
   static bool isError = false;
   static String errorMessage ='';
   static List<ProductDataModel> mylist=[];
   static Future <bool> getProductData() async{
     var response= await http.get(Uri.parse('http://dummyjson.com/products'));
     if(response.statusCode==200){
       try{
         Map<String,dynamic> data=jsonDecode(response.body);

         List<dynamic> productsList= data['products'];

         for(Map<String,dynamic> item in productsList){
           ProductDataModel p=ProductDataModel.fromMapJason(item);
           mylist.add(p);
         }
           isLoading = false;
         return true;
       }
       catch(e){
         print('Error${response.statusCode}');
         print('Error${response.body}');
           isLoading= false;
           isError= true;
           errorMessage=e.toString();
           return false;
       }
     }

     else{
       print('Error${response.statusCode}');
       print('Error${response.body}');

       isLoading=false;
       isError=true;
       errorMessage='${response.statusCode}\n${response.body}';
       return false;
     }
   }
 }