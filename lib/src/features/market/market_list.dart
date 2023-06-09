import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:giftforyou/src/features/market/widget/products.dart';
import '../../constant/constants.dart';
import '../../utils/CustomColors.dart';
import '../../utils/CustomTextStyle.dart';
import '../../utils/CustomUtils.dart';
import '../auth/model/product_list.dart';
import 'market_add.dart';
import 'model/product.dart';
import 'navigation_drawer_widget.dart';

class MarketList extends StatefulWidget {
  const MarketList({super.key});

  @override
  State<MarketList> createState() => _MarketListState();
}

class _MarketListState extends State<MarketList> {
  final dio = Dio();
  List<ProductList>? productData = [];
  List<ProductList> data = [];
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  // List<ProductList> productPrice = [];
  // List<ProductList> productName= [];
  // List<ProductList> productDetail = [];
  productload() async {
    setState(() {
      products.clear();
      products = [];
      data.clear();
      data = [];
    });
    final username = await storageToken.read(key: 'username');
    final response =
        await dio.get('${host}/get-product-byusername/${username}');
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        data.add(ProductList.fromJson(element));
      });
      setState(() {
        productData = data;
      });
      for (var i = 0; i < productData!.length; i++) {
        products.add(ProductModel(
            image: productData![i].picture,
            size: "",
            name: productData![i].productName,
            description: productData![i].productDetail,
            price: doubleFormatCheckZero(productData![i].productPrice!)));
      }
      // for (var i = 0; i < productData!.length; i++) {
      //   listShoesImage.add(productData![i].picture.toString());
      // }
    }

    // print(response);
  }

  @override
  void initState() {
    productload();
    super.initState();
  }

  double? doubleFormatCheckZero(String number) {
    if (number == 'null' || number.isEmpty) return 0;
    List<String> splitted = number.split('.');
    if (splitted.length == 1) return double.parse(splitted[0]);
    return double.parse(number);
  }

  List<String> listImage = [];
  List<String> listShoesImage = [];
  List<ProductModel> products = [
    // ProductModel(
    // size: productData[0].productPrice.toString(),

    // image: "https://www.salana.co.th/img/shop/rice-green.png",
    // name: "ข้าวหอมอินทรีย์ 5 สายพันธุ์",
    // price: 90.00),
    // Product(
    //     size: "1 กิโลกรัม",
    //     id: "1",
    //     image: "https://www.salana.co.th/img/shop/rice-red.png",
    //     name: "ข้าวหอมมะลิแดงอินทรีย์",
    //     price: 110.00),
    // Product(
    //     size: "1 กิโลกรัม",
    //     id: "1",
    //     image: "https://www.salana.co.th/img/shop/rice-gray.png",
    //     name: "ข้าวหอมมะลิ 105 อินทรีย์",
    //     price: 90.00),
    // Product(
    //     size: "2 กิโลกรัม",
    //     id: "1",
    //     image: "https://www.salana.co.th/img/shop/rice-green.png",
    //     name: "Giftset ข้าวหอมอินทรีย์ 5 สายพันธุ์",
    //     price: 380.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Builder(builder: (context) {
          return AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(1),
              ),
            ),
            leading: InkWell(
              onTap: () => {Scaffold.of(context).openDrawer()},
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 34,
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MarketAdd()),
                    ).then((value) => productload());
                  }),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      Color.fromARGB(255, 162, 6, 152),
                      Color.fromARGB(255, 162, 6, 152),
                    ]),
              ),
            ),
            title: const Text(
              'ร้านค้าของคุณ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          );
        }),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "สินค้า",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
            child: ProductsWidget(
          data: products,
        ))
      ],
    );
  }
}
