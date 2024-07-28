import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kurly"),
        ),
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(delegate: TabBarDelegate(), pinned: false)
        ];
      },
      body: TabBarView(
        children: [
          ScreenA(),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
        ],
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 300,
            color: Colors.greenAccent,
          ),
        ),
        SliverPersistentHeader(delegate: CategoryBreadcrumbs(), pinned: true),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 40,
                (context, index) {
              return Container(
                height: 40,
                // 보는 재미를 위해 인덱스에 아무 숫자나 곱한 뒤 255로
                // 나눠 다른 색이 보이도록 함.
                color: Color.fromRGBO(
                    (index * 45) % 255, (index * 70) % 255, (index * 25), 1.0),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryBreadcrumbs extends SliverPersistentHeaderDelegate {
  const CategoryBreadcrumbs();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Text("총 239개", style: TextStyle(color: Colors.black)),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Center(child: Text("필터")),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  // final String text;  // 상태를 나타내는 필드가 있다면, 그리고 그 상태가 상위위젯의 리렌더링에 의해 변할수 있다면
  // shouldRebuild -> true 를 해야 한다.
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return TabBar(
      tabs: [
        Tab(child: Text("컬리추천")),
        Tab(child: const Text("신상품")),
        Tab(child: const Text("베스트")),
      ],
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}