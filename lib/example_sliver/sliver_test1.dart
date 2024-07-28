import 'package:flutter/material.dart';

// SliverAppbar + SliverList
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("SliverAppBar1"),
            backgroundColor: Colors.transparent,
            pinned: false,
            snap: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: Opacity(
              opacity: 0.6,
              child: Image.network(
                "https://picsum.photos/id/1/200/200",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverAppBar(
          //   title: Text("SliverAppBar2"),
          //   backgroundColor: Colors.red,
          //   pinned: false,
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 30,
                  (context, index) {
                return Container(
                  height: 50,
                  color: Colors.lightBlue[100 * (index % 9)],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}