import 'package:flutter/material.dart';
import 'package:helloworld/gen/assets.gen.dart';
import 'package:helloworld/themes/app_colors.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.text1,
              tabs: <Widget>[
                Tab(
                  text: '行きたい',
                ),
                Tab(
                  text: '行った',
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            buildTabBody(),
            buildTabBody(),
          ],
        ),
      ),
    );
  }

  Widget buildTabBody() {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
          leading: Container(
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(Assets.images.sampleEvent.path))),
          ),
          title: const Text('バンクシーって誰？展'),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('開始日 2023/1/10（金）'),
                Text('終了日 2023/1/11（土）'),
              ]),
          trailing: ElevatedButton(
            child: const Text('行った'),
            onPressed: () {},
          ));
    });
  }
}
