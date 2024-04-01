import 'package:flutter/material.dart';
import 'package:gemstore_flutter/models/data_class.dart';
import 'package:gemstore_flutter/widgets/dresses_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
          leading:  IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        title:
            const Text(
              'Dresses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Found 152 results',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        'Filter ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.5

                ),
                itemCount: MyData.dresses.length,
                itemBuilder: (BuildContext context, int index) {
                  return DressCard(dress: MyData.dresses[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}




