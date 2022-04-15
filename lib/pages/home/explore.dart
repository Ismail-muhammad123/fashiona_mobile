import 'dart:math';

import 'package:fashiona_mobile/pages/details.dart';
import 'package:fashiona_mobile/pages/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _sortBy = 0;

  final List<String> _items = [
    "assets/images/male/image1.jpg",
    "assets/images/male/image2.jpg",
    "assets/images/male/image3.jpg",
    "assets/images/male/image4.jpg",
    "assets/images/female/image3.jpg",
    "assets/images/female/image6.jpg",
    "assets/images/female/image2.jpg",
  ];

  final _banners = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discover',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Explore the best of our products',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _banners.isNotEmpty
                ? SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Center(
                            child: Text(index.toString()),
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8.0,
                                offset: Offset(3, 3),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: get all products from explore page
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductsPage(
                            pageTitle: 'For You',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StaggeredGrid.count(
                mainAxisSpacing: 14,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                children: List.generate(
                  _items.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _items[index],
                              id: index.toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Hero(
                                tag: index.toString(),
                                child: Image.asset(
                                  _items[index],
                                  fit: BoxFit.scaleDown,
                                  filterQuality: FilterQuality.low,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 4.0)),
                            Text(
                              'Mens dress',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 4.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'N 20,2000',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.purpleAccent,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'N 25,000',
                                    style: TextStyle(
                                      // color: Colors.redAccent,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
