import 'package:flutter/material.dart';
import 'package:flutterudacityapp/backdrop.dart';
import 'package:flutterudacityapp/category.dart';
import 'package:flutterudacityapp/category_tile.dart';
import 'package:flutterudacityapp/unit.dart';
import 'package:flutterudacityapp/unit_converter.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen();

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _categories = <Category>[];
  Category _defaultCategory;
  Category _currentCategory;

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

  static const _baseColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFF6AB7A8),
      'splash': Color(0xFF0ABC9B),
      'background': Color(0xFFE0FFF9),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFFFFD28E),
      'splash': Color(0xFFFFA41C),
      'background': Color(0xFFFFF1DB),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFFFFB7DE),
      'splash': Color(0xFFF94CBF),
      'background': Color(0xFFFFE6DF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF8899A8),
      'splash': Color(0xFFA9CAE8),
      'background': Color(0xFFBADEFF),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFFEAD37E),
      'splash': Color(0xFFFFE070),
      'background': Color(0xFFFFF1BD),
    }),
    ColorSwatch(0xFF81A56F, {
      'highlight': Color(0xFF81A56F),
      'splash': Color(0xFF7CC159),
      'background': Color(0xFFD6FFC2),
    }),
    ColorSwatch(0xFFD7C0E2, {
      'highlight': Color(0xFFD7C0E2),
      'splash': Color(0xFFCA90E5),
      'background': Color(0xFFD7C0E2),
    }),
    ColorSwatch(0xFFCE9A9A, {
      'highlight': Color(0xFFCE9A9A),
      'splash': Color(0xFFF94D56),
      'background': Color(0xFFFF9CA1),
      'error': Color(0xFF912D2D),
    }),
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length; i++) {
      var category = Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        categoryHeight: 100.0,
        iconLocation: Icons.four_k,
        units: _retrieveUnitList(_categoryNames[i]),
      );
      if (i == 0) {
        _defaultCategory = category;
      }
      _categories.add(category);
    }
  }

  /// Function to call when a [Category] is tapped.
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(name: "$categoryName Unit $i", conversion: i.toDouble());
    });
  }

  Widget _categoryWidgets(Orientation deviceOrientation) {
    if(Orientation.portrait == deviceOrientation) {
      return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(
            category: _categories[index],
            onTap: _onCategoryTap,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 12,
          );
        },
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        physics: BouncingScrollPhysics(),
        itemCount: _categories.length,
      );
    }
    else {
      return GridView.count(
          crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: _categories.map((Category category) {
            return Container(
              padding: EdgeInsets.all(5.0),
              child: CategoryTile(
                category: category,
                onTap: _onCategoryTap,
              ),
            );
      }).toList(),
        physics: BouncingScrollPhysics(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final listView = Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 48.0),
      child: _categoryWidgets(MediaQuery.of(context).orientation),
    );
    return Backdrop(
      currentCategory:
          _currentCategory == null ? _defaultCategory : _currentCategory,
      frontPanel: _currentCategory == null
          ? UnitConverter(
              category: _defaultCategory,
            )
          : UnitConverter(
              category: _currentCategory,
            ),
      backPanel: listView,
      frontTitle: Text('Unit Converter'),
      backTitle: Text('Select a category'),
    );
  }
}
