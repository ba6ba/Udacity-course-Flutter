// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterudacityapp/unit.dart';

import 'converter_route.dart';

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
final BorderRadius _borderRadius = BorderRadius.vertical(top : Radius.circular(20),
    bottom: Radius.circular(20)
);

class Category extends StatelessWidget {
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).

  final String name;
  final IconData iconLocation;
  final Color color;
  final double categoryHeight;
  final List<Unit> units;


  const Category(
      {Key key,
      @required this.name,
      @required this.iconLocation,
      @required this.color,
      @required this.categoryHeight,
      @required this.units
      })
      : assert(name != null),
        assert(iconLocation != null),
        assert(color != null),
        assert(categoryHeight != null),
        assert(units != null),
        super(key : key);

  /// Navigates to the [ConverterScreen].
  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(name,
              style: Theme.of(context).textTheme.headline,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterScreen(
            color : color,
            units : units
          ),
        );
      }
    ));
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
      color: color.withAlpha(80),
      borderRadius: _borderRadius,
      child: Container(
        height: this.categoryHeight,
        child: InkWell(
          splashColor: color,
          highlightColor: color,
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
                  child: Icon(iconLocation, size: 40.0, color: this.color,),
                ),
                Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black54,
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
