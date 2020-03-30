// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:UnitConverterApp/unit.dart';

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.

class Category{
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).

  final String name;
  final String iconLocation;
  final ColorSwatch color;
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
        assert(units != null);
}
