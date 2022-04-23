import 'package:flutter/material.dart';
import 'package:kasgoods/constants.dart';
import 'package:kasgoods/screens/product_model.dart';

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
      title: const Text(
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
        const Card(
          elevation: 5,
          child: const Padding(
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
          const TabBar(
            unselectedLabelColor: Colors.black54,
            labelColor: Colors.white,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600),
            isScrollable: true,
            indicator: const UnderlineTabIndicator(
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
              const Tab(
                text: "Tables",
              ),
            ],
          ),
          Container(
            height: 250,
            child: TabBarView(
              children: [
                _buildChairProducts(),
                //Container(),
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

  _buildChairProducts() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _ChairWidget(
            productModel: Constants.chairs[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10,
          );
        },
        itemCount: Constants.chairs.length);
  }
}

class _ChairWidget extends StatelessWidget {
  final ProductModel productModel;

  const _ChairWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        width: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                productModel.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '\$${productModel.price}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
