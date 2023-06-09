import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant/constants.dart';

import '../../../constant/constants.dart';
import '../model/product.dart';

class ProductHeader extends StatelessWidget {
  final ProductModel? item;
  const ProductHeader({
    Key? key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 15, top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: kSecondaryColor,
          ),
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.chevron_left,
                            color: kBlackColor, size: 40),
                      ),
                      // SvgPicture.asset('assets/images/icons/share.svg'),
                    ],
                  ),
                  Hero(
                      tag: item.hashCode,
                      child: Image.memory(
                        Base64Decoder().convert(item!.image.toString()),
                        width: constraints.maxWidth * 0.65,
                        height: constraints.maxHeight * 0.65,
                        fit: BoxFit.contain,
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
