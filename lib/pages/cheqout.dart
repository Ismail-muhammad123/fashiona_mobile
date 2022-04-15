import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController _voucherCodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _voucherCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 6)),
            Text(
              'Delivery Address',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Address of the customer from anywhere in the world',
                    style: TextStyle(fontSize: 18.0),
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  child: Text(
                    'Change',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  width: 150.0,
                )
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
            Row(
              children: [
                Icon(
                  Icons.timelapse_outlined,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                Expanded(
                  child: Text(
                    'Delivery in the next 5 days. For addresses within kano state.',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
            MaterialButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actions: [
                      MaterialButton(
                        color: Colors.red,
                        child: Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(''),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        child: Text('Insert'),
                        onPressed: () => Navigator.of(context)
                            .pop(_voucherCodeController.text),
                      )
                    ],
                    title: Text('Insert Voucher Code'),
                    content: Container(
                      child: Expanded(
                        child: TextFormField(
                          controller: _voucherCodeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 60.0,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                ).then((value) => print(value.toString()));
              },
              child: Text(
                'Add Voucher',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              minWidth: MediaQuery.of(context).size.width * 0.7,
              color: Colors.purple,
              height: 50.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Note:'.toUpperCase(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'lorr rjurvn ruvn ufnrdm vurfvj rmnv ujr fvjenrjv me svjwesnviwekv jernv iesv jwnsv wrenvjrvs dvud',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Voucher:',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '- N500',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'N2,500',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onPressed: () {},
              child: Text(
                'Pay Now',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.deepPurple,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              height: 55.0,
            )
          ],
        ),
      ),
    );
  }
}
