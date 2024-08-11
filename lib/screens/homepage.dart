import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:urep/backend/api.dart';
import 'package:urep/screens/view_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> filters = ['Fruits', 'Vegetables', 'Dairy', 'Bakery'];
  Map<String, bool> selectedFilters = {};

  List<dynamic> _groceryItems = [];

  // List<dynamic> get groceryItems => _groceryItems;

  Future<void> fetchGroceryItems() async {
    final response = await http.get(Uri.parse('${apiUrl}/api/products'));
    print(response); // Replace with your API URL
    final data = json.decode(response.body) as List<dynamic>;
    print(data);
    setState(() {
      _groceryItems = data as List;
    });
    // notifyListeners();
  }

  List<dynamic> get filteredGroceryItems {
    if (selectedFilters.values.every((isSelected) => isSelected == false)) {
      // If no filter is selected, return all items
      return _groceryItems;
    } else {
      // If a filter is selected, return only the items that match the selected filters
      return _groceryItems.where((item) {
        return selectedFilters[item['category']] ?? false;
      }).toList();
    }
  }

  @override
  void initState() {
    super.initState();
    filters.forEach((filter) {
      selectedFilters[filter] = false;
    });
    fetchGroceryItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //       child: Text('urep',
      //           style: GoogleFonts.manrope(
      //               color: Colors.black, fontWeight: FontWeight.w500))),
      // ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Transform.scale(
                scale: 0.9,
                child: Wrap(
                  spacing: 2.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: filters.map((String filter) {
                    return FilterChip(
                      label: Text(filter),
                      selected: selectedFilters[filter]!,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedFilters[filter] = selected;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredGroceryItems.length,
                  itemBuilder: (context, index) {
                    var item = filteredGroceryItems[index];
                    return GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewPage(
                              name: item['name'],
                              price: item['price'],
                              stocks: item['stocks'],
                            ),
                          ),
                        )
                      },
                      child: Card(
                        child: ListTile(
                          leading:
                              Image.asset(item['image']), // Load image from URL
                          title: Text(item['name']), // Display the name
                          subtitle: Text(
                              'Stock: ${item['stock']}'), // Display the stock
                          trailing: Text(
                              '\$${item['price'].toStringAsFixed(2)}'), // Display the price
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
