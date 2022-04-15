import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _currentFilter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Order',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Filter:',
                  style: TextStyle(fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    elevation: 0,
                    value: _currentFilter,
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child: Text('In progress'),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text('Recieved'),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text('Suspended'),
                      ),
                    ],
                    onChanged: (val) => setState(
                      () {
                        _currentFilter = int.parse(val.toString());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                      Text('Recieved'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                      Text('In Progress'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                      Text('Suspended'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
              child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) => ListTile(
              title: Text('Zanna bukar and 3 more.'),
              subtitle: Text("25,000(NGN) - 3 march, 2022"),
              trailing: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
