import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helloworld/gen/assets.gen.dart';
import 'package:helloworld/themes/app_colors.dart';
import 'dart:async';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      fullscreenDialog: true,
      builder: (_) => const EventDetailPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32).copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildImage(),
                const SizedBox(
                  height: 10,
                ),
                buildEventName(),
                const SizedBox(
                  height: 10,
                ),
                buildWantAndWentMembers(),
                const SizedBox(
                  height: 30,
                ),
                buildSchedule(),
                const SizedBox(
                  height: 30,
                ),
                buildFee(),
                const SizedBox(
                  height: 30,
                ),
                buildLocation(),
                const SizedBox(
                  height: 30,
                ),
                buildWebSiteButton(),
                const SizedBox(
                  height: 30,
                ),
                buildReview(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade100,
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      '行きたい！',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      '行った',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ));
  }

  Widget buildImage() {
    return Container(
      height: 172,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Assets.images.sampleEvent.path))),
    );
  }

  Widget buildEventName() {
    return const Text(
      'バンクシーって誰？展',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget buildWantAndWentMembers() {
    final wantMembers = [
      Assets.images.user.path,
      Assets.images.user.path,
      Assets.images.user.path,
      Assets.images.user.path,
      Assets.images.user.path,
      Assets.images.user.path,
    ];
    final wentMembers = [
      Assets.images.user.path,
    ];
    return Row(
      children: [
        buildMembersTile(title: '行きたい！', members: wantMembers),
        const SizedBox(
          width: 10,
        ),
        buildMembersTile(title: '行った', members: wentMembers),
      ],
    );
  }

  Widget buildMembersTile(
      {required String title, required List<String> members}) {
    const maxLength = 5;
    final isOverLength = members.length > maxLength;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$title',
              style: TextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${members.length}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 30,
          child: Row(
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: isOverLength ? maxLength : members.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: AssetImage(Assets.images.user.path),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                    );
                  }),
              isOverLength ? const Text('...') : Container()
            ],
          ),
        )
      ],
    );
  }

  Widget buildSchedule() {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '開催時間 10:00〜18:00',
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '開始日 2023年1月14日',
                ),
                Text(
                  '終了日 2023年1月15日',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFee() {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.attach_money_outlined,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    '有料。〈前売券〉販売期間:2022年9月23日(祝)〜12月16日(金) 一般1800円(土・日・祝2000円)、大学・専門学生1500円(土・日・祝1700円)、小学・中学',
                    maxLines: 2,
                  ),
                )
              ],
            ),
            const Text(
              'もっと見る',
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildLocation() {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.pin_drop_outlined,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '福岡アジア美術館',
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '福岡県福岡市博多区下川端町3-1 リバレインセンタービル7･8F',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            buildMap(),
          ],
        ),
      ),
    );
  }

  Widget buildMap() {
    return HookBuilder(builder: (context) {
      final Completer<GoogleMapController> initController = Completer();

      const CameraPosition kGooglePlex = CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962),
        zoom: 14.4746,
      );

      return SizedBox(
        height: 200,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GoogleMap(
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  initController.complete(controller);
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildWebSiteButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        onPressed: () {},
        label: const Text(
          'サイトを見にいく',
        ),
        icon: const Icon(Icons.language_outlined),
      ),
    );
  }

  Widget buildReview() {
    final reviews = ['よかった', 'よかった'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '行った人のコメント',
          style: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: reviews.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final text = reviews[index];
              return ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage(Assets.images.user.path),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                ),
                title: const Text('のり'),
                subtitle: Text(text),
              );
            })
      ],
    );
  }
}
