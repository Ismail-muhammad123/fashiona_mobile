import 'package:fashiona_mobile/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsPage extends StatefulWidget {
  final String pageTitle;
  const ProductsPage({
    Key? key,
    required this.pageTitle,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<String> _items = [
    "assets/images/male/image1.jpg",
    "assets/images/male/image2.jpg",
    "assets/images/male/image3.jpg",
    "assets/images/male/image4.jpg",
    "assets/images/female/image3.jpg",
    "assets/images/female/image6.jpg",
    "assets/images/female/image2.jpg",
  ];

  var _filters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              var f = await showDialog(
                context: context,
                builder: (context) => const FilterCard(),
              );
              setState(() => _filters = f);
              print(f);
            },
            icon: const Icon(FontAwesomeIcons.filter, color: Colors.purple),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.pageTitle,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
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
                      const Padding(padding: EdgeInsets.only(top: 4.0)),
                      const Text(
                        'Mens dress',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 4.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'N 20,2000',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.purpleAccent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
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
      ),
    );
  }
}

class FilterCard extends StatefulWidget {
  const FilterCard({Key? key}) : super(key: key);

  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  final _sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  var _filter = {};

  final _genders = ['Male', 'Female', 'Both'];

  RangeValues _priceRange = RangeValues(100, 100000);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                color: Colors.red,
                iconSize: 40,
                onPressed: () => Navigator.of(context).pop(_filter),
                icon: Icon(Icons.clear),
              ),
            ),
            Text(
              'Filter',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Text(
                'Gender',
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _genders.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 80,
                    child: Text(
                      _genders[index],
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Size',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  _sizes.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          alignment: Alignment.center,
                          height: 40,
                          child: Text(
                            _sizes[index],
                            style: TextStyle(color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      )),
            ),
            Text(
              'Price',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            Center(
              child: RangeSlider(
                activeColor: Colors.deepPurple,
                divisions: 100,
                labels: RangeLabels(
                    'N ${_priceRange.start}', 'N ${_priceRange.end}'),
                min: 100,
                max: 100000,
                values: _priceRange,
                onChanged: (value) => setState(() => _priceRange = value),
              ),
            ),
            MaterialButton(
              color: Colors.purple,
              onPressed: () {
                //TODO: get filter before returning
                Navigator.of(context).pop(_filter);
              },
              child: Text('Apply'),
              minWidth: 300.0,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
