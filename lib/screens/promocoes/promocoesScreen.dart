import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart';
import 'package:estagio_projeto/models/productDiscount.dart';
import 'widgetsPromocoes.dart';

class PromocoesScreen extends StatefulWidget {
  @override
  _PromocoesScreen createState() => _PromocoesScreen();
}

class _PromocoesScreen extends State<PromocoesScreen> {
  final Faker _faker = Faker();
  ScrollController _scrollController = ScrollController();
  List<productDiscount> _products = [];
  int _itemsPerPage = 3;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadProducts();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadProducts();
    }
  }

  String _getRandomImageUrl() {
    return 'https://source.unsplash.com/random/${_faker.randomGenerator.integer(800, min: 300)}x${_faker.randomGenerator.integer(800, min: 300)}';
  }

  Future<void> _loadProducts() async {
    if (!_loading) {
      setState(() {
        _loading = true;
      });

      await Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _products.addAll(
            List.generate(
              _itemsPerPage,
              (index) => productDiscount(
                List.generate(
                  4,
                  (i) => _getRandomImageUrl(),
                ).toList(),
                _faker.food.dish(),
                (_faker.randomGenerator.decimal() * 100).toStringAsFixed(2),
                _faker.randomGenerator.integer(15, min: 5).toString(),
                _faker.randomGenerator.boolean(),
              ),
            ),
          );
          _loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: buildPromocoesAppBar(),
        drawer: buildDrawer(context),
        body: TabBarView(
          children: List.generate(
            5,
            (index) => buildTabContent('Categoria ${index + 1}', _products,
                _scrollController, _loading, _loadProducts),
          ),
        ),
        bottomNavigationBar: buildBottomNavigationBar(context),
      ),
    );
  }
}
