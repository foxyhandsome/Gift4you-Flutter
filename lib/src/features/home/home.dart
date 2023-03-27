import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/CustomBorder.dart';
import '../../utils/CustomColors.dart';
import '../../utils/CustomTextStyle.dart';
import '../../utils/CustomUtils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listImage = [];
  List<String> listShoesImage = [];
  int selectedSliderPosition = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderImage();
    shoesImage();
  }

  void sliderImage() {
    listImage.add(
        "https://postfamily.thailandpost.com/wp-content/uploads/2019/12/post-3-10.jpg");
    listImage.add(
        "https://postfamily.thailandpost.com/wp-content/uploads/2019/12/post-3-10.jpg");
    listImage.add(
        "https://postfamily.thailandpost.com/wp-content/uploads/2019/12/post-3-10.jpg");
  }

  void shoesImage() {
    listShoesImage.add(
        "https://png.pngtree.com/png-clipart/20210128/ourmid/pngtree-color-flat-gift-box-png-image_2805845.jpg");
    listShoesImage.add(
        "https://png.pngtree.com/png-clipart/20210128/ourmid/pngtree-color-flat-gift-box-png-image_2805845.jpg");
    listShoesImage.add(
        "https://png.pngtree.com/png-clipart/20210128/ourmid/pngtree-color-flat-gift-box-png-image_2805845.jpg");
    listShoesImage.add(
        "https://png.pngtree.com/png-clipart/20210128/ourmid/pngtree-color-flat-gift-box-png-image_2805845.jpg");
    listShoesImage.add(
        "https://png.pngtree.com/png-clipart/20210128/ourmid/pngtree-color-flat-gift-box-png-image_2805845.jpg");
    listShoesImage.add(
        "https://png.pngtree.com/png-clipart/20210128/ourmid/pngtree-color-flat-gift-box-png-image_2805845.jpg");
    listShoesImage.add(
        "https://png.pngtree.com/png-clipart/20210128/ourmid/pngtree-color-flat-gift-box-png-image_2805845.jpg");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      color: CustomColors.COLOR_GREEN,
                      height: height / 4,
                    ),
                    /*Search Section*/

                    /*Slider Section*/
                    Container(
                        height: (height / 4) + 75,
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: height / 5,
                          child: PageView.builder(
                            itemBuilder: (context, position) {
                              return createSlider(listImage[position]);
                            },
                            controller: PageController(viewportFraction: .8),
                            itemCount: listImage.length,
                            onPageChanged: (position) {
                              /*setState(() {
                              selectedSliderPosition = position;
                            });*/
                            },
                          ),
                        ))
                  ],
                ),
                Utils.getSizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(new MaterialPageRoute(
                    //     builder: (context) => SeeAllProductPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Text(
                          "GROUP BY",
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text("SEE ALL",
                                style: CustomTextStyle.textFormFieldSemiBold
                                    .copyWith(color: Colors.grey.shade700)),
                            Icon(Icons.arrow_forward),
                            Utils.getSizedBox(width: 16),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Utils.getSizedBox(height: 10),
                /*Group By Product Listing*/
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return createGroupBuyListItem(
                          listShoesImage[index], index);
                    },
                    itemCount: listShoesImage.length,
                  ),
                ),

                /*Most Big Product Listing*/
                Utils.getSizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16),
                      child: Text(
                        "MOST BIG",
                        style: CustomTextStyle.textFormFieldSemiBold
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: <Widget>[
                          Text("SEE ALL",
                              style: CustomTextStyle.textFormFieldSemiBold
                                  .copyWith(color: Colors.grey.shade700)),
                          Icon(Icons.arrow_forward),
                          Utils.getSizedBox(width: 16),
                        ],
                      ),
                    )
                  ],
                ),
                Utils.getSizedBox(height: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return createMostBigListItem(
                          listShoesImage[index], index, context);
                    },
                    itemCount: listShoesImage.length,
                  ),
                ),
                Utils.getSizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }

  createSlider(String image) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      ),
    );
  }

  createGroupBuyListItem(String image, int index) {
    double leftMargin = 0;
    double rightMargin = 0;
    if (index != listShoesImage.length - 1) {
      leftMargin = 10;
    } else {
      leftMargin = 10;
      rightMargin = 10;
    }
    return Container(
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                  ),
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
            ),
            flex: 75,
          ),
          Expanded(
            flex: 25,
            child: Container(
              padding: EdgeInsets.only(left: leftMargin, right: rightMargin),
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Utils.getSizedBox(height: 8),
                  Text(
                    "NIKE Kyire II",
                    style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                        color: Colors.black.withOpacity(.7), fontSize: 12),
                  ),
                  Utils.getSizedBox(height: 4),
                  Text(
                    "Exquisite you need him",
                    style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                        color: Colors.black.withOpacity(.7), fontSize: 10),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
            ),
          )
        ],
      ),
    );
  }

  createMostBigListItem(String image, int index, BuildContext context) {
    double leftMargin = 0;
    double rightMargin = 0;
    double radius = 16;
    if (index != listShoesImage.length - 1) {
      leftMargin = 10;
    } else {
      leftMargin = 10;
      rightMargin = 10;
    }
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: "$image,$index",
                child: Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                      ),
                      color: Colors.teal.shade200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(radius),
                          topRight: Radius.circular(radius))),
                ),
                transitionOnUserGestures: true,
              ),
              flex: 75,
            ),
            Expanded(
              flex: 25,
              child: Container(
                padding: EdgeInsets.only(left: leftMargin, right: rightMargin),
                width: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Utils.getSizedBox(height: 8),
                    Text(
                      "NIKE Kyire II",
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          color: Colors.black.withOpacity(.7), fontSize: 12),
                    ),
                    Utils.getSizedBox(height: 4),
                    Text(
                      "Exquisite you need him",
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          color: Colors.black.withOpacity(.7), fontSize: 10),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius))),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        // Navigator.of(context).push(new MaterialPageRoute(
        //     builder: (context) => ProductDetailsPage("$image,$index")));
      },
    );
  }
}
