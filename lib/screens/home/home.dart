import 'package:estagio_projeto/main.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class Home extends StatefulWidget {
  @override
  _TelaHomeState createState() => _TelaHomeState();
}

class _TelaHomeState extends State<Home> {
  String mensagem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Portfólio'),
      ),
      body: Column(
        children: [
          buildWelcomeText(),
          buildRowWithRectangles(
            context,
            [
              buildInteractiveRetctangle(context, Colors.red, 100.0, 100.0,
                  'Clique-me!', 'Retangulo Pressionado!1111'),
              buildInteractiveRetctangle(context, Colors.green, 100.0, 100.0,
                  'Clique-me!', 'Retangulo Pressionado2222!'),
              buildInteractiveRetctangle(context, Colors.blue, 100.0, 100.0,
                  'Clique-me!', 'Retangulo Pressionado33333333!'),
            ],
          ),
          //Mudar URL da imagem para as imagens corretas
          buildRowWithRectangles(
            context,
            [
              buildInteractiveRectangleWitheImage(
                  context,
                  'https://i.ibb.co/RvBdfNb/wallpaperflare-com-wallpaper.jpg',
                  //'https://i.ibb.co/1JFwnjv/saulo.jpg',
                  100.0,
                  100.0,
                  'Clique-me',
                  'Retangulo com imagem pressionado'),
              buildInteractiveRectangleWitheImage(
                  context,
                  'https://i.ibb.co/JpwN5hb/wallpaperflare-com-wallpaper-2.jpg',
                  //'https://i.ibb.co/RvBdfNb/wallpaperflare-com-wallpaper.jpg',
                  100.0,
                  100.0,
                  'Clique-me',
                  'Retangulo com imagem pressionado11111111111'),
              buildInteractiveRectangleWitheImage(
                  context,
                  'https://i.ibb.co/RvBdfNb/wallpaperflare-com-wallpaper.jpg',
                  //'https://i.ibb.co/JpwN5hb/wallpaperflare-com-wallpaper-2.jpg',
                  100.0,
                  100.0,
                  'Clique-me',
                  'Retangulo com imagem pressionado2222222222'),
            ],
          ),
          buildRowWithRectangles(
            context,
            [
              buildInteractiveRetctangle(context, Colors.blue, 100.0, 100.0,
                  'Toque!', 'Retangulo pressionado!'),
              buildInteractiveRectangleWitheImage(
                  context,
                  'https://i.ibb.co/DkFZvpH/wallpaperflare-com-wallpaper-1.jpg',
                  100.0,
                  100.0,
                  'Clique aqui!',
                  'Retangulo com imagem pressionado'),
              buildInteractiveRetctangle(context, Colors.red, 100.0, 100.0,
                  'Toque!', 'Retangulo pressionado!111111'),
            ],
          ),
          buildMessageText(mensagem),
          buildFooterText(),
        ],
      ),
    );
  }
}
