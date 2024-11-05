import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const StyleItApp());
}

// Existing screen widgets remain unchanged
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class AddYourScreen extends StatelessWidget {
  const AddYourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add Your Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favourite Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
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

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;
  final List<String> colors;
  final bool inStock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.colors,
    required this.inStock,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cartCount = 0;
  int _selectedIndex = 0;
  int _currentCarouselIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final List<Product> featuredProducts = [
    Product(
      id: '1',
      name: 'Premium Athletic Shoes',
      description:
          'Engineered for maximum comfort and performance. Features:\n• Breathable mesh upper\n• Cushioned midsole\n• Anti-slip sole',
      price: 99.99,
      rating: 4.5,
      reviews: 128,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9eAqxljTteybiscbJymwvzUIgJKvl-zF6bw&s',
      colors: ['Black', 'White', 'Blue'],
      inStock: true,
    ),
    Product(
      id: '2',
      name: 'Smart Watch Pro',
      description:
          'Advanced features in a sleek design. Includes:\n• Heart rate monitoring\n• Sleep tracking\n• 5-day battery life',
      price: 199.99,
      rating: 4.8,
      reviews: 256,
      imageUrl: 'https://m.media-amazon.com/images/I/71-MzGdLobL.jpg',
      colors: ['Silver', 'Black', 'Rose Gold'],
      inStock: true,
    ),
    Product(
      id: '3',
      name: 'Elite Wireless Headphones',
      description:
          'Immersive audio experience with:\n• Active noise cancellation\n• 30-hour battery life\n• Quick charge',
      price: 59.99,
      rating: 4.6,
      reviews: 312,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSddIHTaQILb08u27O_xfPV7ubPhPPFqOPEwQ&s',
      colors: ['Black', 'White'],
      inStock: false,
    ),
  ];

  final List<Product> additionalProducts = [
    Product(
      id: '4',
      name: 'Backpack ',
      description: 'Durable and spacious backpack with laptop compartment',
      price: 49.99,
      rating: 4.3,
      reviews: 89,
      imageUrl:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/backpack/m/n/h/-original-imah2c45crcyv2zm.jpeg?q=90&crop=false',
      colors: ['Black', 'Navy'],
      inStock: true,
    ),
    Product(
      id: '5',
      name: 'Cozy Sweater',
      description: 'Warm and stylish winter sweater',
      price: 29.99,
      rating: 4.7,
      reviews: 156,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXV2hV8xmutZK-1GmgKtT3LeoAhV468ETdMg&s',
      colors: ['Gray', 'Blue', 'Red'],
      inStock: true,
    ),
    Product(
      id: '6',
      name: 'Elegant Dress',
      description: 'Perfect for special occasions',
      price: 79.99,
      rating: 4.9,
      reviews: 203,
      imageUrl:
          'https://faviana.com/cdn/shop/files/11023_BLACK_Alt_1_90676b54-524e-4598-bf15-ff8ffa333bcd.jpg?v=1702940690',
      colors: ['Black', 'Red', 'Navy'],
      inStock: true,
    ),
    Product(
      id: '7',
      name: 'Sunglasses',
      description: 'UV protected premium sunglasses',
      price: 99.99,
      rating: 4.4,
      reviews: 167,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbAKaZlzVUCEt7vEi-5i3jYcw7oRphJvzJPigSputVXW2SVq08eR7WDmg2_pl7DvlJn2E&usqp=CAU',
      colors: ['Black', 'Gold'],
      inStock: true,
    ),
  ];

  void _addToCart(Product product) {
    setState(() {
      cartCount++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getSelectedPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildProductDisplay();
      case 1:
        return const AddYourScreen();
      case 2:
        return const SearchScreen();
      case 3:
        return const FavouriteScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.shopping_cart),
        title: const Text('StyleIT'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Handle cart action
                },
              ),
              if (cartCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      '$cartCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add Your',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildProductDisplay() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
              const SizedBox(height: 16),
              _buildCarouselSlider(),
              const SizedBox(height: 8),
              _buildCarouselIndicators(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Additional Products',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[800],
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle see all action
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
                shrinkWrap: true, // Add this
                physics: const NeverScrollableScrollPhysics(), // Add this
                children: additionalProducts
                    .map((product) => EnhancedProductCard(
                          product: product,
                          onAddToCart: () => _addToCart(product),
                          isGridItem: true,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      carouselController: _carouselController,
      items: featuredProducts
          .map((product) => EnhancedProductCard(
                product: product,
                onAddToCart: () => _addToCart(product),
              ))
          .toList(),
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.easeInOut,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.85,
        onPageChanged: (index, reason) {
          setState(() {
            _currentCarouselIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCarouselIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => _carouselController.previousPage(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: featuredProducts.asMap().entries.map((entry) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple.withOpacity(
                  _currentCarouselIndex == entry.key ? 0.9 : 0.4,
                ),
              ),
            );
          }).toList(),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () => _carouselController.nextPage(),
        ),
      ],
    );
  }

}

class EnhancedProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final bool isGridItem;

  const EnhancedProductCard({
    required this.product,
    required this.onAddToCart,
    this.isGridItem = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  product.imageUrl,
                  height: isGridItem ? 120 : 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (!product.inStock)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Out of Stock',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700]),
                    const SizedBox(width: 4),
                    Text(
                      '${product.rating} (${product.reviews} reviews)',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: product.inStock ? onAddToCart : null,
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
