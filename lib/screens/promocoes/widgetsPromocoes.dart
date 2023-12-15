import 'dart:ffi';

import 'package:estagio_projeto/routes.dart';
import 'package:estagio_projeto/screens/promocoes/cardProdutos.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:estagio_projeto/models/productDiscount.dart';

Widget buildProductCarousel(List<String> images) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 200.0,
      aspectRatio: 4 / 3,
      viewportFraction: 1.0,
      enableInfiniteScroll: true,
      autoPlay: true,
    ),
    items: images.map((image) {
      return Builder(
        builder: (BuildContext context) {
          return Image.network(
            image,
            fit: BoxFit.cover,
          );
        },
      );
    }).toList(),
  );
}

Widget buildProductHeaderBar(String discount) {
  return Container(
    height: 40.0,
    color: Colors.green,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildInfoIconButton(),
        buildDiscountText(discount),
        Spacer(),
        buildSharedIconButton(),
      ],
    ),
  );
}

Widget buildTabContent(
    String category,
    List<productDiscount> products,
    ScrollController scrollController,
    bool loading,
    Future<void> Function() loadProducts) {
  return RefreshIndicator(
    onRefresh: () async {
      // Lógica de recarregamento ao puxar para baixo
      products.clear();
      await loadProducts();
    },
    child: ListView.builder(
      controller: scrollController,
      itemCount: products.length + (loading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < products.length) {
          return ProductCard(products[index]);
        } else {
          return loading ? buildLoadingIndicator() : Container();
        }
      },
    ),
  );
}

Widget buildInfoIconButton() {
  return IconButton(
    onPressed: () {
      // Lógica para adicionar AS INFORMAÇOES
    },
    icon: Icon(Icons.info),
    color: Colors.white,
  );
}

Widget buildDiscountText(String discount) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      'Desconto: ${discount} % OFF',
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildSharedIconButton() {
  return IconButton(
    onPressed: () {
      // Lógica para o compartilhamento
    },
    icon: Icon(Icons.share),
    color: Colors.white,
  );
}

Widget buildProductDetails(
  String name,
  double normalPrice,
  double discountedPrice,
  bool available,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        name,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8.0),
      Text(
        'R\$ ${normalPrice.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 16.0,
          decoration: TextDecoration.lineThrough,
          color: Colors.grey,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      buildDiscountedPriceText(discountedPrice),
      SizedBox(
        height: 8.0,
      ),
      buildAvailabilityRow(available),
    ],
  );
}

Widget buildDiscountedPriceText(double discountedPrice) {
  return Row(
    children: [
      Text(
        'R\$ ${discountedPrice.toStringAsFixed(2)}',
        style: TextStyle(fontSize: 16.0, color: Colors.green),
      )
    ],
  );
}

Widget buildAvailabilityRow(bool available) {
  return Row(
    children: [
      Text(
        'Estoque:',
        style: TextStyle(fontSize: 16.0),
      ),
      buildAvailabilityIcon(available),
    ],
  );
}

Widget buildAvailabilityIcon(bool available) {
  return available
      ? Icon(
          Icons.check,
          color: Colors.green,
        )
      : Icon(
          Icons.clear,
          color: Colors.red,
        );
}

Widget buildLoadingIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

AppBar buildPromocoesAppBar() {
  return AppBar(
    title: Text('Promoções'),
    backgroundColor: Colors.green,
    bottom: TabBar(
      isScrollable: true,
      tabs: [
        Tab(text: 'Limpeza'),
        Tab(text: 'Carnes'),
        Tab(text: 'Bebidas'),
        Tab(text: 'Congelados'),
        Tab(text: 'Açougue'),
      ],
    ),
  );
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        buildDrawerItem(
          'Tela Home',
          () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, Routes.home);
          },
        ),
        buildDrawerItem(
          'Tela Login',
          () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, Routes.login);
          },
        ),
        buildDrawerItem(
          'Tela Ofertas',
          () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, Routes.promocoes);
          },
        ),
      ],
    ),
  );
}

Widget buildDrawerItem(String title, VoidCallback onTap) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    onTap: onTap,
  );
}

Widget buildBottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Colors.black),
        label: "Inicio",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.local_offer, color: Colors.black),
        label: "Ofertas",
      ),
    ],
    selectedItemColor: Colors.green,
    onTap: (int index) {
      // Adicione um switch para lidar com as diferentes seleções do BottomNavigationBar
      switch (index) {
        case 0:
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.home, (route) => false);
          break;
        case 1:
          Navigator.pushReplacementNamed(context, Routes.promocoes);
          break;
        // Adicione mais casos conforme necessário para outros itens
      }
    },
  );
}
