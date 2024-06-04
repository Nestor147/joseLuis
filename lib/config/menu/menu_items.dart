


import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required  this.icon
  });
}

const List<MenuItem> appMenuItems=[
  MenuItem(title: 'Momento gracioso', subTitle: 'Varios botones de flutter', link: '/funnyMoment', icon: Icons.photo_album),
  MenuItem(title: 'Anécdotas graciosas', subTitle: 'un contenedor estilizado', link: '/anecdotas', icon: Icons.read_more_outlined),
  MenuItem(title: 'Crea Imagenes', subTitle: 'generales y controlados', link: '/imageScreen', icon: Icons.image),
  MenuItem(title: 'Crea Canciones', subTitle: 'snackbars and dialogs', link: '/musicScreen', icon: Icons.music_video),
  MenuItem(title: 'Recetas de Comida', subTitle: 'animated', link: '/recetasScreen', icon: Icons.food_bank_outlined),
  MenuItem(title: 'Decide por tí', subTitle: 'ui controlers', link: '/decidePorti', icon: Icons.hourglass_empty_sharp),
  MenuItem(title: 'Usuario', subTitle: 'pequeño tutorial de la aplicacion', link: '/userProfile', icon: Icons.person),
  MenuItem(title: 'Favoritos', subTitle: 'scroll Infinite', link: '/userFavorite', icon: Icons.favorite),
  MenuItem(title: 'Búsquedas', subTitle: 'cunter riverpod', link: '/userSearch', icon: Icons.search),
  MenuItem(title: 'Configuración', subTitle: 'Theme Changer view', link: '/userSetting', icon: Icons.settings),
];