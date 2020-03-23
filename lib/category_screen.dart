import 'package:flutter/material.dart';
import 'package:flutterudacityapp/category.dart';
import 'package:flutterudacityapp/unit.dart';

const _backgroundColor = Colors.white;

class CategoryScreen extends StatefulWidget {
  const CategoryScreen();

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categories = <Category>[];

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        categoryHeight: 100.0,
        iconLocation: Icons.access_alarm,
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(name: "$categoryName Unit $i", conversion: i.toDouble());
    });
  }

  Widget _categoryWidgets(List<Widget> categoriesList) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categoriesList[index],
      itemCount: categoriesList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _categoryWidgets(categories),
    );

    final appBar = AppBar(
      elevation: 0.0,
      backgroundColor: _backgroundColor,
      title: Text(
        'Unit Converter',
        style: TextStyle(color: Colors.black26, fontSize: 26.0),
      ),
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
