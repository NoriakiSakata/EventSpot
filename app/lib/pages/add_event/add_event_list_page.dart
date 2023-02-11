import 'package:flutter/material.dart';
import 'package:helloworld/gen/assets.gen.dart';
import 'package:helloworld/pages/add_event/add_event_page.dart';
import 'package:helloworld/pages/edit_event/edit_event_page.dart';
import 'package:helloworld/themes/app_colors.dart';

class AddEventListPage extends StatelessWidget {
  const AddEventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.primaryColor.shade100,
            icon: const Icon(
              Icons.add,
              color: AppColors.text1,
            ),
            label: const Text(
              '新規イベントを追加',
              style: TextStyle(
                  color: AppColors.text1, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(context, AddEventPage.route());
            }),
        appBar: AppBar(title: const Text('追加したイベント')),
        body: ListView.builder(itemBuilder: (context, index) {
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
                child: const Text('編集'),
                onPressed: () {
                  Navigator.push(context, EditEventPage.route());
                },
              ));
        }));
  }
}
