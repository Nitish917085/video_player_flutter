import 'package:flutter/material.dart';
import 'Model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState()=> _HomePage();
}

class _HomePage extends State<HomePage>{

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff286768),
        title: Text("Yellow Class",style:TextStyle(fontSize: 20,color:Color.fromARGB(
            255, 245, 209, 120),fontWeight: FontWeight.bold)),

//******************* Actions ***************************
        actions: <Widget>[
         Container(
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: (){},
            ),
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Color.fromARGB(233, 244, 208, 120),
              radius: 13,
            ),
            onPressed: () {},
          ),
        ],
      ),

        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                    .loadString('assets/data/dataset.json'),
            builder: (context, snapshot) {
              return Container(
                  color: const Color(0xff121b22),
                  child: Model(snapshot.data),
          );
        },
    ),

//****************** Bottom Navigation Bar **************************
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff286768),
        unselectedItemColor: Color(0xffb2ff59),
        selectedItemColor: Colors.yellowAccent,
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 23),
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        currentIndex: myIndex,
        onTap: (int currentIndex) {
          setState(() {
            myIndex = currentIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Container(
              margin: EdgeInsets.only(top: 4),
              child: Icon(Icons.home),
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            activeIcon: Container(
              margin: EdgeInsets.only(top: 4),
              child: Icon(Icons.trending_up),

            ),
            label: 'Trending'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            activeIcon: Container(
              margin: EdgeInsets.only(top: 4),
              child: Icon(Icons.subscriptions),

            ),
            label: 'Subscription'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Container(
              margin: EdgeInsets.only(top: 4),
              child: Icon(Icons.settings),
            ),
          label: 'Settings',
          ),
        ],
      ),
    );
  }
}
