import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// SliverAppBar + SliverToBoxAdapter + SliverList(가로) + SliverList(세로)
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            title: Text("앱바"),
            pinned: false,
            //snap: true,
            //floating: true,
            expandedHeight: 250,
            flexibleSpace: Container(
              color: Colors.green,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 300,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Container(
                    width: 50,
                    color: Colors.yellow[((index % 9) + 1) * 100], // 0 ~ 8
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
                  (context, index) {
                return Container(
                  height: 50,
                  color: Colors.blue[((index % 9) + 1) * 100], // 0 ~ 8
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
