import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  // List of categories with their names and image URLs
  List<Map<String, String>> categories = [
    {'name': 'Electronics', 'image': 'https://tinyurl.com/5d5bwe8a'},
    {
      'name': 'Clothing',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWII2CuzVUQw1Ydm2srGx6zhjczn-UFM1zgQ&s'
    },
    {'name': 'Shoes', 'image': 'https://tinyurl.com/3b5reu78'},
    {'name': 'Books', 'image': 'https://tinyurl.com/56ketjmw'},
    {
      'name': 'Home & Kitchen',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/cool-kitchen-gadgets-65566c82b2c29.jpg?crop=1.00xw:1.00xh;0,0&resize=640:*'
    },
    {'name': 'Toys', 'image': 'https://tinyurl.com/mbdc4nt9'},
  ];

  List<Map<String, String>> displayedCategories = [];

  @override
  void initState() {
    super.initState();
    displayedCategories = List.from(categories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ernest Ecommerce'),
        actions: <Widget>[
          Container(
            width: 200,
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Categories...',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              onChanged: _filterCategories,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemCount: displayedCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                        product: displayedCategories[index]['name']!, imageUrl: '', description: '', price: '',)),
              );
            },
            child: Card(
              elevation: 3.0,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      displayedCategories[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      displayedCategories[index]['name']!,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
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

  // Method to filter categories based on search query
  void _filterCategories(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedCategories = List.from(categories);
      });
      return;
    }
    final filtered = categories.where((category) {
      final categoryName = category['name']!.toLowerCase();
      final searchLower = query.toLowerCase();
      return categoryName.contains(searchLower);
    }).toList();

    setState(() {
      displayedCategories = filtered;
    });
  }
}
