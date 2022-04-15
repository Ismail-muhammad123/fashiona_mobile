import 'package:fashiona_mobile/pages/cheqout.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextStyle _primaryStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.grey.withOpacity(0.9),
  );

  TextStyle _secondaryStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              children: [
                cartTiles(),
                cartTiles(),
                cartTiles(),
                cartTiles(),
                cartTiles(),
                cartTiles(),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(-3, 0),
                  blurRadius: 15.0,
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal(NGN)',
                      style: _primaryStyle,
                    ),
                    Text(
                      '3000',
                      style: _secondaryStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax (NGN)',
                      style: _primaryStyle,
                    ),
                    Text(
                      '3000',
                      style: _secondaryStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping/Transport (NGN)',
                      style: _primaryStyle,
                    ),
                    Text(
                      '3000',
                      style: _secondaryStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total (NGN)',
                      style: _primaryStyle,
                    ),
                    Text(
                      '3000',
                      style: _secondaryStyle,
                    ),
                  ],
                ),
                MaterialButton(
                  color: Colors.deepPurple,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CheckoutPage(),
                    ),
                  ),
                  child: Text(
                    'checkout'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minWidth: 150,
                  height: 50.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class cartTiles extends StatelessWidget {
  const cartTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: double.maxFinite,
        height: 100.0,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 90,
              height: 90,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Some random item',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    Row(
                      children: [
                        Text('Size: M'),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0)),
                        Text('Color: blue'),
                      ],
                    ),
                    Text(
                      'N25,000',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.clear),
                Text('1x'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
