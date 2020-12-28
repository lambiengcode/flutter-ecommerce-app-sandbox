import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Access {
  final String title;
  final IconData icon;
  final Color color;
  Access({this.title, this.icon, this.color});
}

List<Access> actions = [
  new Access(
    title: 'Burger',
    icon: FontAwesomeIcons.hamburger,
    color: Colors.blueAccent.shade400,
  ),
  new Access(
    title: 'Pizza',
    icon: FontAwesomeIcons.pizzaSlice,
    color: Colors.redAccent,
  ),
  new Access(
    title: 'Hot Dog',
    icon: FontAwesomeIcons.hotdog,
    color: Colors.red.shade300,
  ),
  new Access(
    title: 'Drink',
    icon: FontAwesomeIcons.wineGlass,
    color: Colors.deepOrange.shade400,
  ),
  new Access(
    title: 'Wine',
    icon: FontAwesomeIcons.wineBottle,
    color: Colors.green.shade600,
  ),
  new Access(
      title: 'Coffee',
      icon: FontAwesomeIcons.mugHot,
      color: Colors.brown.shade400),
  new Access(
    title: 'Cocktail',
    icon: FontAwesomeIcons.cocktail,
    color: Colors.deepPurple.shade400,
  ),
  new Access(
    title: 'Beer',
    icon: FontAwesomeIcons.beer,
    color: Colors.amber,
  ),
  new Access(
    title: 'Cheese',
    icon: FontAwesomeIcons.cheese,
    color: Colors.pink.shade300,
  ),
  new Access(
    title: 'Fruit',
    icon: FontAwesomeIcons.appleAlt,
    color: Colors.red,
  ),
];
