import 'package:flutter/material.dart';
import 'package:project_3/data/data_sourses/products_data_sources.dart';

class ProductItemWidgets extends StatelessWidget {
  final int index;
  const ProductItemWidgets({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
            ProductsDataSources.mylist[index].imageURL != null
                ? Image.network(
              height: 70,
              ProductsDataSources.mylist[index].imageURL!,
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

                'name: ${ProductsDataSources.mylist[index].name ?? 'no data'}',
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
                'description: ${ProductsDataSources.mylist[index].description ?? 'no data'}',
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
                    'price: ${ProductsDataSources.mylist[index].price ?? 'no data'}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 45,),
                  Icon(
                    Icons.shop,
                    size: 22,
                    color: Colors.deepPurple.shade600,),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
