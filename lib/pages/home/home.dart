import 'package:fashiona_mobile/pages/account/authenticate.dart';
import 'package:fashiona_mobile/pages/account/profile.dart';
import 'package:fashiona_mobile/pages/items.dart';
import 'package:flutter/material.dart';
import '../cart.dart';
import 'explore.dart';
import 'favourites.dart';
import 'search.dart';
import '../order.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = const [
    SearchTab(),
    HomeTab(),
    FavouritesTab(),
  ];

  int _selectedNav = 1;
  bool _menuShown = false;

  final _cartegories = const [
    'Men Fashion',
    'Female Fashion',
    'Fabrics and Textiles',
    'Walets',
    'Shoes',
    'Hats',
    'Bags',
    'Wearables',
  ];
  bool _cartegoriesExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedNav,
            onTap: (value) => setState(() {
              _selectedNav = value;
            }),
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite),
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: 'Favourites',
              ),
            ],
          ),
          appBar: _selectedNav != 0
              ? AppBar(
                  title: Text(
                    _selectedNav == 2 ? 'Favourites' : "",
                    style: TextStyle(color: Colors.black),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    onPressed: () => setState(() {
                      _menuShown = true;
                    }),
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      ),
                      icon: const Icon(
                        Icons.shopping_bag,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              : null,
          body: _tabs[_selectedNav],
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          child: _menuShown
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() {
                                _menuShown = false;
                              }),
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfilePage())),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.deepPurple,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: GestureDetector(
                                  onTap: () => setState(
                                    () {
                                      _cartegoriesExpanded =
                                          !_cartegoriesExpanded;
                                    },
                                  ),
                                  child: const Text(
                                    "Cartegories >",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.deepPurple,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              ...List.generate(
                                _cartegories.length,
                                (index) => _cartegoriesExpanded
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            top: 14.0,
                                            bottom: 14.0,
                                            left: 20.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            //TODO: get page items
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (conext) =>
                                                    ProductsPage(
                                                  pageTitle:
                                                      _cartegories[index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            _cartegories[index],
                                            style: const TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Colors.purpleAccent,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: GestureDetector(
                                  onTap: () {
                                    //TODO: get page items
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductsPage(
                                                pageTitle: 'On Sale'),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "On Sale",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.deepPurple,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _menuShown = false;
                                    });
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OrdersPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "My Order",
                                    style: TextStyle(
                                      color: Colors.deepPurple,
                                      decoration: TextDecoration.none,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Authenticate(),
                              ),
                            ),
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.none,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 14.0))
                      ],
                    ),
                  ),
                )
              : null,
          height: _menuShown ? double.maxFinite : 0,
          width: _menuShown ? double.maxFinite : 0,
          decoration: BoxDecoration(
            // backgroundBlendMode: BlendMode.srcOut,
            color: Colors.black.withOpacity(0.85),
          ),
        ),

        // : Container(),
      ],
    );
  }
}
