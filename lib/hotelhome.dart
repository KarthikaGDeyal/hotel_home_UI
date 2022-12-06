

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: HotelHomePage(),));
}
final List rooms = [
  {
    "image":"assets/images/room.jpg",
    "title": "Awesome room near Bouddha"
  },
];
class HotelHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 180.0,
            backgroundColor: Colors.cyan,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white,),
              onPressed: (){},
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.white,),
                onPressed: (){},
              ),
            ],
            floating: true,
            flexibleSpace: ListView(
              children: <Widget>[
                const SizedBox(height: 70.0,),
                const Text("Type your Location", textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Bouddha ,Kathmandu",
                      border: InputBorder.none,
                      icon: IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                    ),
                  ),
                ),
              ],
            ) ,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10.0,),),
          SliverToBoxAdapter(
            child: _buildCategories(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return _buildRooms(context,index);
                },
                childCount: 100
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRooms(BuildContext context, int index) {
    var room = rooms[index%rooms.length];
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(room["image"]),

                    Positioned(
                      bottom: 10.0,
                      right: 10.0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: const Text("\$40"),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(room['title'], style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 5.0,),
                      const Text("Bouddha,Kathmandu"),
                      const SizedBox(height: 10.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.star, color: Colors.green,),
                          SizedBox(width: 5.0,),
                          Text("(220 reviews)", style: TextStyle(color: Colors.grey),)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(width: 15.0,),
          Category(
            backgroundColor: Colors.pink,
            icon: Icons.hotel,
            title: "Hotel",
          ),
          SizedBox(width: 15.0,),
          Category(
            backgroundColor: Colors.blue,
            title: "Restaurant",
            icon: Icons.restaurant,
          ),
          SizedBox(width: 15.0,),
          Category(
            icon: Icons.local_cafe,
            backgroundColor: Colors.orange,
            title: "Cafe",
          )
        ],
      ),
    );
  }
}


class Category extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? backgroundColor;

  const Category({
    Key? key,
    required this.icon,
    required this.title,
    this.backgroundColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(5.0))
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(10.0),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.white,),
            const SizedBox(height: 5.0,),
            Text(title, style: const TextStyle(
                color: Colors.white
            ))
          ],
        ),
      ),
    );
  }
}