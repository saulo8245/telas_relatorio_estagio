import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:estagio_projeto/models/productDiscount.dart';

class ProductCard extends StatelessWidget {
  final productDiscount product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    double normalPrice = double.parse(product.price);
    double discountedPrice =
        normalPrice - (normalPrice * double.parse(product.discount) / 100);

    return Card(
      elevation: 4.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    aspectRatio: 4 / 3,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                  ),
                  items: product.images.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.network(
                          image,
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  height: 40.0,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          _showInformationPopup(context);
                        },
                        icon: Icon(Icons.info),
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Desconto: ${product.discount}% OFF',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          // Adicione a lógica de compartilhamento
                        },
                        icon: Icon(Icons.share),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 8.0),
                Text(
                  'R\$ ${normalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      'R\$ ${discountedPrice.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16.0, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text('Estoque: ', style: TextStyle(fontSize: 16.0)),
                    product.available
                        ? Icon(Icons.check, color: Colors.green)
                        : Icon(Icons.clear, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showInformationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informações do Produto'),
          content: Text('Adicione aqui as informações detalhadas do produto.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
