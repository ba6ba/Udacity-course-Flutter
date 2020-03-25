import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterudacityapp/category.dart';
import 'unit_converter.dart';

final BorderRadius _borderRadius = BorderRadius.vertical(
    top: Radius.circular(20), bottom: Radius.circular(20));

class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged<Category> onTap;

  const CategoryTile({Key key, @required this.category, @required this.onTap})
      : assert(category != null),
        assert(onTap != null),
        super(key: key);

  /// Navigates to the [UnitConverter].
  void _navigateToConverter(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(
            category.name,
            style: Theme.of(context).textTheme.headline,
          ),
          centerTitle: true,
          backgroundColor: category.color,
        ),
        body: UnitConverter(category: category),
        // This prevents the attempt to resize the screen when the keyboard
        // is opened
        resizeToAvoidBottomPadding: false,
      );
    }));
  }

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    return Material(
      color: category.color.withAlpha(80),
      borderRadius: _borderRadius,
      child: Container(
        height: category.categoryHeight,
        child: InkWell(
          splashColor: category.color['splash'],
          highlightColor: category.color['highlight'],
          borderRadius: _borderRadius,
          onTap: () {
            _navigateToConverter(context);
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    category.iconLocation,
                    size: 40.0,
                    color: category.color,
                  ),
                ),
                Center(
                    child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black54,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
