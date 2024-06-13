import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromRGBO(233, 99, 108, 25),
            margin: EdgeInsets.all(10), // Adds margin around the card
            elevation: 4, // Elevation for the shadow effect
            child: ListTile(
              leading: Icon(Icons.star,color: Colors.yellow,),
              title: Text('Rating',style: TextStyle(color: Colors.white,),),
              subtitle: Text('Movie Name',style: TextStyle(color: Colors.white,)),
              onTap: () {
                // Add your onTap logic here if needed
              },
            ),
          );
        },
      ),
    );
  }
}