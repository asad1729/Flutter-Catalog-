import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class homeDetailPage extends StatelessWidget {
  final Item catalog;

  const homeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Mythemes.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl4.make(),
                ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Mythemes.darkBluish),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                        child: "Add to cart".text.make())
                    .wh(130, 50)
              ]).pOnly(right: 8).p32(),
        ),
        body: SafeArea(
          bottom: false,
          child: Center(
            child: Column(
              children: [
                Hero(
                        tag: Key(catalog.id.toString()),
                        child: Image.network(catalog.image))
                    .h40(context),
                Expanded(
                    child: VxArc(
                        height: 30.0,
                        edge: VxEdge.TOP,
                        arcType: VxArcType.CONVEY,
                        child: Container(
                            color: Colors.white,
                            width: context.screenWidth,
                            child: Column(
                              children: [
                                catalog.name.text.lg
                                    .color(Mythemes.darkBluish)
                                    .bold
                                    .xl4
                                    .make(),
                                catalog.desc.text.light.xl.light.make(),
                                10.heightBox,
                                """
The phone comes with a 128 GB internal memory. The phone is also decked with Rear Camera for your images and videos. For power, the Phone reliable. """
                                    .text
                                    .light
                                    .make()
                                    .p16(),
                              ],
                            ).py64())))
              ],
            ),
          ),
        ));
  }
}
