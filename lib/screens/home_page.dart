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
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.topRight,
          //   colors: [
          //     // Colors.black,
          //     Colors.white,
          //     Colors.lightBlue.shade900
          //   ],
          //   stops: [0.1, 1],
          // ),
          // ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                buildAppBar(),
                buildSearchBar(),
                buildProducts(),
                buildBestOffers(),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            //padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: const Text('Categories'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Cart'),
                onTap: () {
                  //goto cart screen
                },
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Cart'),
                onTap: () {
                  //goto cart screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text(
        "KAS Goods",
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
      actions: const [
        Card(
          elevation: 5,
          shadowColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          ),
        ),
      ],
    );
  }

  buildSearchBar() {

  }
}


buildProducts() {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TabBar(
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
          SizedBox(
            height: 250,
            child: TabBarView(
              children: [
                buildChairProducts(),
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

  buildBestOffers() {
    return Container();
  }

  buildChairProducts() {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _ChairWidget(
            productModel: Constants.chairs[index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: Constants.chairs.length);
  }


class _ChairWidget extends StatelessWidget {
  final ProductModel productModel;

  const _ChairWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
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
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '\$${productModel.price}',
                style: const TextStyle(
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
