 import 'package:flutter/cupertino.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/src/flutter/container.dart';
import 'package:velocity_x/src/flutter/padding.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  final Item catalog;

  const CatalogImage({Key? key, required this.image, required this.catalog})
      : assert(image != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(catalog.image)
        .box
        .rounded
        .p8
        .color(Mythemes.creamColor)
        .make()
        .p16();
  }
}
