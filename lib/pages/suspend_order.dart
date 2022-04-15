import 'package:flutter/material.dart';

class SuspendOrderPage extends StatefulWidget {
  const SuspendOrderPage({Key? key}) : super(key: key);

  @override
  State<SuspendOrderPage> createState() => _SuspendOrderPageState();
}

class _SuspendOrderPageState extends State<SuspendOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Suspend Transaction',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Why do you want to suspend Your delivery?',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
            Text(
              'Write down a note below.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Expanded(
              child: TextFormField(
                minLines: 10,
                maxLines: 30,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Write here',
                  fillColor: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Center(
              child: MaterialButton(
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                height: 60,
                minWidth: MediaQuery.of(context).size.width * 0.7,
                onPressed: () {},
                child: Text(
                  'Send'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
