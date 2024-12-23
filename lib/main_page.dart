import 'package:flutter/material.dart';
import 'product_views.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final Map<String, List<Map<String, String>>> supermarketProducts = {
    'Lider': [
      {
        'name': 'Arroz',
        'brand': 'Miraflores',
        'price': '\$2.290',
        'img': 'arroz_miraflores.png'
      },
      {
        'name': 'Azucar',
        'brand': 'Iansa',
        'price': '\$2.690',
        'img': 'azucar_iansa.png'
      },
      {
        'name': 'Huevos',
        'brand': 'Lider',
        'price': '\$3.790',
        'img': 'huevo_lider.png'
      },
      {
        'name': 'Sal',
        'brand': 'Lobos',
        'price': '\$600',
        'img': 'sal_lobos.png'
      },
    ],
    'Jumbo': [
      {
        'name': 'Arroz',
        'brand': 'Miraflores',
        'price': '\$2.890',
        'img': 'arroz_miraflores.png'
      },
      {
        'name': 'Azucar',
        'brand': 'Iansa',
        'price': '\$1.490',
        'img': 'azucar_iansa.png'
      },
      {
        'name': 'Huevos',
        'brand': 'Jumbo',
        'price': '\$3.889',
        'img': 'huevo_lider.png'
      },
      {
        'name': 'Sal',
        'brand': 'Lobos',
        'price': '\$700',
        'img': 'sal_lobos.png'
      },
    ],
    'Santa Isabel': [
      {
        'name': 'Arroz',
        'brand': 'Miraflores',
        'price': '\$2.790',
        'img': 'arroz_miraflores.png'
      },
      {
        'name': 'Azucar',
        'brand': 'Iansa',
        'price': '\$1.470',
        'img': 'azucar_iansa.png'
      },
      {
        'name': 'Huevos',
        'brand': 'Santa Isabel',
        'price': '\$3.919',
        'img': 'huevo_lider.png'
      },
      {
        'name': 'Sal',
        'brand': 'Lobos',
        'price': '\$650',
        'img': 'sal_lobos.png'
      },
    ],
  };

  final Map<String, Color> supermarketColors = {
    'Lider': const Color.fromARGB(255, 105, 208, 255),
    'Jumbo': const Color.fromARGB(255, 190, 255, 115),
    'Santa Isabel': const Color.fromARGB(255, 255, 110, 110),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Canasta Basica de Productos',
                style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: _selectedIndex == 0
            ? buildProductCards(supermarketProducts, supermarketColors)
            : buildProductLists(supermarketProducts),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.expand_more),
            label: 'Listas',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
