import 'package:fashiona_mobile/pages/cart.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String imagePath;
  final String id;
  const DetailsPage({
    Key? key,
    required this.imagePath,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final Image _image = Image.asset(
      widget.imagePath,
      fit: BoxFit.fitHeight,
      width: MediaQuery.of(context).size.width,
    );

    var imHight = _image.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: widget.id,
              child: _image,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30.0,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite_outline,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TweenAnimationBuilder(
                  tween: Tween(
                    begin: MediaQuery.of(context).size.height,
                    end: 0.0,
                  ),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, value, child) => Transform.translate(
                    offset: Offset(0, value as double),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: const Text(
                              'Blue-black Kaftan',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(8.0)),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Text(
                          //           'Material:',
                          //           style: TextStyle(fontSize: 20.0),
                          //         ),
                          //       ),
                          //       Expanded(
                          //         child: Container(
                          //           decoration: BoxDecoration(
                          //             border: Border.all(),
                          //             borderRadius: BorderRadius.circular(10.0),
                          //           ),
                          //           height: 50.0,
                          //         ),
                          //       ),
                          //       IconButton(
                          //         onPressed: () {},
                          //         icon: Icon(Icons.edit),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Size',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text('S'),
                                      Text('M'),
                                      Text('L'),
                                      Text('XL'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text('N 20,000'),
                                const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0)),
                                Text(
                                  'N25,000',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red.withOpacity(0.95),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () =>
                                            setState(() => _quantity -= 1),
                                        icon: const Icon(Icons.remove),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                      ),
                                      Container(
                                        height: 40,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            _quantity.toString(),
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4)),
                                      IconButton(
                                        onPressed: () =>
                                            setState(() => _quantity += 1),
                                        icon: const Icon(Icons.add),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          MaterialButton(
                            height: 55.0,
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                            minWidth: 150,
                            color: Colors.deepPurple,
                            onPressed: () {
                              //TODO: add to cart
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(-5, 0),
                            blurRadius: 5.0,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
