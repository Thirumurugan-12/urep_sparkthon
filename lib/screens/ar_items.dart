import 'package:flutter/material.dart';
import 'package:urep/screens/ar_view.dart';


class ARItemsPage extends StatefulWidget {
  ARItemsPage({Key? key}) : super(key: key);

  @override
  _ARItemsPageState createState() => _ARItemsPageState();
}

class _ARItemsPageState extends State<ARItemsPage> {
  final List<dynamic> _arItems = [
    {"name": "Sofa", "stock": 20, "price": 100.0 , "path": 'assets/3d/wooden_sofa.glb'},
    {"name": "Table", "stock": 10, "price": 50.0, "path": 'assets/3d/simple_dining_table.glb'},
    {"name": "Chair", "stock": 15, "price": 30.0, "path": 'assets/3d/gothic_chair.glb'},
    {"name": "Refrigerator", "stock": 5, "price": 200.0, "path": 'assets/3d/refrigerator.glb'},
    // {"name": "Table", "stock": 10, "price": 50.0},
    // {"name": "Chair", "stock": 15, "price": 30.0},
    // {"name": "Refrigerator", "stock": 5, "price": 200.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Items'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: _arItems.length,
          itemBuilder: (context, index) {
            var item = _arItems[index];
            return GestureDetector(
              onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArScreen(path: item['path'] ,),
                          ),
                        )
                      },
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.image), // Replace this with your actual image
                  title: Text(item['name']), // Display the name
                  subtitle: Text('Stock: ${item['stock']}'), // Display the stock
                  trailing: Text('\$${item['price'].toStringAsFixed(2)}'), // Display the price
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}