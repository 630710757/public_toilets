import 'package:public_toilets/models/toilet.dart';

class ToiletRepository{
  static List<Toilet> toilets = [
    Toilet(name: 'toilet 1', point: 5.0, distance: 150.0),
    Toilet(name: 'toilet 2', point: 4.5, distance: 50.0),
    Toilet(name: 'toilet 3', point: 3.7, distance: 350.0),
    Toilet(name: 'toilet 4', point: 4.0, distance: 220.0),
    Toilet(name: 'toilet 5', point: 4.8, distance: 550.0),
    Toilet(name: 'toilet 6', point: 2.5, distance: 10.0),
  ];
}