// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:kasgoods/screens/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              // Colors.black,
              Colors.white,
              Colors.lightBlue.shade900
            ],
            stops: [0.1, 1],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(),
              _buildProducts(),
              _buildBestOffers(),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        "Our Products",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),

      // title: Text(
      //   'Our Products',
      //   style: GoogleFonts.varelaRound(
      //     color: Color(0xff2A2D31),fontWeight: FontWeight.w600,
      //   ),
      // ),
      actions: [
        Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ),
      ],
    );
  }

  _buildProducts() {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            unselectedLabelColor: Colors.black54,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w600),
            isScrollable: true,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.greenAccent,
                  width: 2,
                ),
                insets: EdgeInsets.symmetric(horizontal: 45)),
            tabs: [
              Tab(
                text: "Armchairs",
              ),
              Tab(
                text: "Chairs",
              ),
              Tab(
                text: "Sofas",
              ),
              Tab(
                text: "Tables",
              ),
            ],
          ),
          Container(
            height: 250,
            child: TabBarView(
              children: [
                // _buildChairProducts(),
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildBestOffers() {
    return Container();
  }

// _buildChairProducts() {
//   return _ChairWidget(productModel: null,);
// }
}

// class _ChairWidget extends StatelessWidget {
//   final ProductModel productModel;
//
//   const _ChairWidget({Key? key, required this.productModel}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
