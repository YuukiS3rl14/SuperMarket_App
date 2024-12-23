import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildProductCards(
    Map<String, List<Map<String, String>>> supermarketProducts,
    Map<String, Color> supermarketColors) {
  List<Widget> supermarketCarousels = [];

  supermarketProducts.forEach((supermarket, products) {
    supermarketCarousels.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/logo_$supermarket.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(width: 8),
                Text(supermarket,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: supermarketColors[supermarket],
                    child: Container(
                      width: 120,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/img/${product['img']}'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product['name']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Marca: ${product['brand']}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Precio: ${product['price']}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  });

  return ListView(children: supermarketCarousels);
}

Widget buildProductLists(
    Map<String, List<Map<String, String>>> supermarketProducts) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Supermercado',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Total',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: ListView(
            children: supermarketProducts.entries.map((entry) {
              int total = _calculateTotal(entry.value);
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: ExpansionTile(
                  title: Text(entry.key),
                  trailing: Text(
                    NumberFormat('#,##0', 'en_US').format(total),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: entry.value.map((product) {
                    return ListTile(
                      title: Text(product['name']!),
                      subtitle: Text(
                          'Marca: ${product['brand']} - Precio: ${product['price']}'),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}

int _calculateTotal(List<Map<String, String>> products) {
  int total = 0;
  for (var product in products) {
    int price =
        int.parse(product['price']!.replaceAll('\$', '').replaceAll('.', ''));
    total += price;
  }
  return total;
}
