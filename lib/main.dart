import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const StyleItApp());
}

class StyleItApp extends StatelessWidget {
  const StyleItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StyleIT - E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.shopping_cart),
        title: const Text('StyleIT'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Products',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[800],
              ),
            ),
            const SizedBox(height: 19),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 380,
                    child: CarouselSlider(
                      items: const [
                        ProductCard(
                          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9eAqxljTteybiscbJymwvzUIgJKvl-zF6bw&s',
                          productName: 'Trendy Shoes',
                          productDescription: 'Comfortable and stylish shoes for all occasions.',
                          price: '\$99.99',
                        ),
                        ProductCard(
                          imageUrl: 'https://m.media-amazon.com/images/I/71-MzGdLobL.jpg',
                          productName: 'Smart Watch',
                          productDescription: 'Stay connected with this feature-packed watch.',
                          price: '\$199.99',
                        ),
                        ProductCard(
                          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSddIHTaQILb08u27O_xfPV7ubPhPPFqOPEwQ&s',
                          productName: 'Wireless Headphones',
                          productDescription: 'High-quality sound with noise cancellation.',
                          price: '\$59.99',
                        ),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Additional Products',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800],
                    ),
                  ),
                  const SizedBox(height: 26),
                  GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.7, // Adjust this value to increase the size of the cards
                    children: const [
                      ProductCard(
                        imageUrl: 'https://rukminim2.flixcart.com/image/850/1000/xif0q/backpack/m/n/h/-original-imah2c45crcyv2zm.jpeg?q=90&crop=false',
                        productName: 'Stylish Backpack',
                        productDescription: 'Durable and fashionable backpack for everyday use.',
                        price: '\$49.99',
                      ),
                      ProductCard(
                        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXV2hV8xmutZK-1GmgKtT3LeoAhV468ETdMg&s',
                        productName: 'Cozy Sweater',
                        productDescription: 'Warm and comfortable sweater for the colder months.',
                        price: '\$29.99',
                      ),
                      ProductCard(
                        imageUrl: 'https://faviana.com/cdn/shop/files/11023_BLACK_Alt_1_90676b54-524e-4598-bf15-ff8ffa333bcd.jpg?v=1702940690',
                        productName: 'Elegant Dress',
                        productDescription: 'Stylish and versatile dress for any occasion.',
                        price: '\$79.99',
                      ),
                      ProductCard(
                        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbAKaZlzVUCEt7vEi-5i3jYcw7oRphJvzJPigSputVXW2SVq08eR7WDmg2_pl7DvlJn2E&usqp=CAU',
                        productName: 'Designer Sunglasses',
                        productDescription: 'High-quality sunglasses with UV protection.',
                        price: '\$99.99',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action for the button
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productDescription;
  final String price;

  const ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.productDescription,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
              
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              productName,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(productDescription),
            const SizedBox(height: 8),
            Text(
              price,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}