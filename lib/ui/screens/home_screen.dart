
import 'package:flutter/material.dart';
import 'package:project_3/data/data_sourses/products_data_sources.dart';
import 'package:project_3/ui/widgets/Error_Widgets.dart';
import 'package:project_3/ui/widgets/Loading_Widgets.dart';
import 'package:project_3/ui/widgets/Product_Item_Widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    super.initState();
    if(ProductsDataSources.mylist.isEmpty){
      ProductsDataSources.getProductData().then((value){
        setState(() {

        });
        if(value){
          print('data is retrieved successfully');
        }
        else{
          print('Erorrrrrr');
        }
      });
    }
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
    body: ProductsDataSources.isLoading
        ?const LoadingWidgets()
    :ProductsDataSources.isError
      ?MyErrorWidgets(
        errorMeg:ProductsDataSources.errorMessage,
    )
        : GridView.builder(
    itemCount: ProductsDataSources.mylist.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    ),
    itemBuilder: (context, index) {
    return ProductItemWidgets(index: index);
    },
    )
    );
  }
}