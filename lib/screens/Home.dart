import 'package:api_implementation/Utilities/NavigatorUtil.dart';
import 'package:api_implementation/screens/AddEdit.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              NavigationUtil.navigateTo(
                context,
                const AddEdit(isEdit: false),
              );
            },
            icon: const Icon(
              Icons.add_box_rounded,
              color: Color.fromRGBO(233, 99, 108, 25),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromRGBO(233, 99, 108, 25),
            margin: const EdgeInsets.all(10), // Adds margin around the card
            elevation: 4, // Elevation for the shadow effect
            child: ListTile(
              leading: const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              title: const Text(
                'Rating',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: const Text('Movie Name',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {
                NavigationUtil.navigateTo(
                  context,
                  const AddEdit(
                    isEdit: true,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
