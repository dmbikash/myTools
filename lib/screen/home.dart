import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fav_screen_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    debugPrint("build");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Consumer<FavScreenProvider>(
                      builder: (context, favScreenProvider, child) {
                    return ListTile(
                      title:  Text("A----B----C----$index"),
                      trailing: Icon(
                        Icons.favorite,
                        color: favScreenProvider.likedItems.contains(index)
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onTap: () {
                        favScreenProvider.addLikes(index);
                        //print(likes);
                      },
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
