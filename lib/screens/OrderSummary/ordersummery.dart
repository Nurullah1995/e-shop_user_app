import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('My Order')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  final titles = [
    'Jacket',
    'Cap',
    'Hoody',
    'Shirt',
  ];

  final icons = [
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
  ];
  final price = [
    '50TK',
    '100Tk',
    '400Tk',
    '300TK',
  ];
  final timedate = [
    '31/01/2020 ',
    '1/03/2020 ',
    '17/07/2020 ',
    '15/09/2020 ',
  ];
  final status = [
    'bike',
    'boat',
    'bus',
    'car',
  ];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        elevation: 10,
        //                           <-- Card widget
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                titles[index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                price[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18.00),
              ),
              Text(timedate[index]),
            ],
          ),
        ),
        //ListTile(
        //leading: Icon(icons[index]),
        //title: Text(titles[index]),
        //),
      );
    },
  );
}
