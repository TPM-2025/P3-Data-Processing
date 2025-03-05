import 'package:asisten_tpm_3/model/game_model.dart';
import 'package:asisten_tpm_3/pages/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome, $username")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) => _gameList(context, index),
        itemCount: gameList.length,
      ),
    );
  }

  Widget _gameList(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(index: index)),
        );
      },
      child: Column(
        children: [
          Image.network(gameList[index].imageUrls[0]),
          Text(gameList[index].name),
        ],
      ),
    );
  }
}
