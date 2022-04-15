import 'package:fashiona_mobile/pages/items.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final List<String> _recentSearchs = [
    'men',
    'female',
    'babbar riga',
    'kaftan',
    'after dress',
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                  GestureDetector(
                    onTap: () {
                      // TODO: add search functionality
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductsPage(
                            pageTitle: 'Search: ${_searchController.text}',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 50.0,
                      width: 60.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.arrow_forward),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: Row(
                children: [
                  const Text(
                    'Recent Search',
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: List.generate(
                    _recentSearchs.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _searchController.text = _recentSearchs[index];
                          });
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.timer),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.0)),
                            Text(
                              _recentSearchs[index],
                              style: const TextStyle(fontSize: 18.0),
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
