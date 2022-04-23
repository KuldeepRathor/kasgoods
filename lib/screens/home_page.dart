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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [

              Colors.purple,
              Colors.black26,

              // Color(0xFF4F359B)
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
      actions: const [
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Best Offers',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 20,
            width: 10,
          ),
          Column(
            children: List.generate(
              Constants.bestoffers.length,
              (index) {
                return _bestofferWidget(
                  productModel: Constants.bestoffers[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  buildChairProducts() {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
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
}

class _bestofferWidget extends StatelessWidget {
  final ProductModel productModel;

  const _bestofferWidget({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(productModel.imagePath),
      title: Text(productModel.name),
      trailing: Text(
        'Rs${productModel.price}',
      ),
    );
  }
}

class _ChairWidget extends StatelessWidget {
  final ProductModel productModel;

  const _ChairWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: 150,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white38,
                        Colors.white38,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.1,
                        1,
                      ],
                    ),
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        productModel.imagePath,
                        height: 120,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Rs${productModel.price}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: -10,
          right: 20,
          child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart,
              )),
        )
      ],
    );
  }
}
