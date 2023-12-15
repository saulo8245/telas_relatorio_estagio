import 'package:estagio_projeto/screens/home/home.dart';
import 'package:estagio_projeto/screens/promocoes/promocoesScreen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget buildRectangle(Color color, double width, double height) {
  return Container(
    width: width,
    height: height,
    color: color,
    margin: EdgeInsets.all(8.0),
  );
}

Widget buildInteractiveRetctangle(BuildContext context, Color color,
    double width, double height, String buttonText, String message) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
      Navigator.push(
        context, //ALTERAR DE HOME PARA a TELA DE PROMOÇAO
        MaterialPageRoute(builder: (context) => Home()),
      );
    },
    child: buildRectangle(color, width, height),
  );
}

Widget buildInteractiveRectangleWitheImage(
  BuildContext context,
  String imageUrl,
  double width,
  double height,
  String buttonText,
  String messsage,
) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(messsage)),
      );
      Navigator.push(
          context, //ALTERAR DE HOME PARA a TELA DE PROMOÇAO
          MaterialPageRoute(builder: (context) => PromocoesScreen()));
    },
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}

Widget buildRowWithRectangles(BuildContext context, List<Widget> rectangles) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: rectangles,
  );
}

Widget buildWelcomeText() {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Text(
      'Bem-vindo ao Meu Portfólio!',
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildMessageText(String mensagem) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Text(
      mensagem,
      style: TextStyle(fontSize: 16.0),
    ),
  );
}

Widget buildFooterText() {
  return Container(
    padding: EdgeInsets.all(16.0),
    color: Colors.grey[200],
    child: Text(
      '© 2023 Meu Portfólio. Todos os direitos reservados.',
      style: TextStyle(fontSize: 12.0),
    ),
  );
}
