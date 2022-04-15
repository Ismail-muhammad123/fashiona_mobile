import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../details.dart';

class FavouritesTab extends StatefulWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  State<FavouritesTab> createState() => _FavouritesTabState();
}

class _FavouritesTabState extends State<FavouritesTab> {
  List _colors = [
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
  ];

  final List<Map<String, dynamic>> _saved = [
    {
      'url': "assets/images/male/image1.jpg",
      'selected': false,
    },
    {
      'url': "assets/images/male/image2.jpg",
      'selected': false,
    },
    {
      'url': "assets/images/male/image3.jpg",
      'selected': false,
    },
    {
      'url': "assets/images/male/image4.jpg",
      'selected': false,
    },
    {
      'url': "assets/images/female/image3.jpg",
      'selected': false,
    },
    {
      'url': "assets/images/female/image6.jpg",
      'selected': false,
    },
    {
      'url': "assets/images/female/image2.jpg",
      'selected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: List.generate(
              _saved.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    if (_saved.any((element) => element['selected'] == true)) {
                      setState(() {
                        _saved[index]['selected'] = !_saved[index]['selected'];
                      });
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            imagePath: _saved[index]['url'],
                            id: index.toString(),
                          ),
                        ),
                      );
                    }
                  },
                  onLongPress: () {
                    setState(() {
                      _saved[index]['selected'] = true;
                    });
                  },
                  child: StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: Random().nextInt(2) + 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              _saved[index]['url'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          _saved[index]['selected']
                              ? Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.deepPurple.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                )
                              : Container(),
                          _saved[index]['selected']
                              ? Icon(
                                  Icons.check_rounded,
                                  size: 50.0,
                                  color: Colors.white,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        _saved.any(
          (element) => element['selected'] == true,
        )
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: Colors.deepPurple,
                        // TODO: Remove from favurites funtionality
                        onPressed: () {},
                        child: const Text(
                          'Remove',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        minWidth: 300,
                      ),
                    ],
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
