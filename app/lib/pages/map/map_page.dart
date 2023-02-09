import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helloworld/gen/assets.gen.dart';
import 'package:helloworld/themes/app_colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => MapSampleState();
}

class MapSampleState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          SafeArea(
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: buildFilterButtomArea()),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: buildEventPageView())
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFilterButtomArea() {
    final filterButtons = ['開催予定', '今日', '明日', '今週', '来週'];
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filterButtons.length,
          itemBuilder: (context, index) {
            final text = filterButtons[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    text,
                    style: const TextStyle(color: AppColors.text1),
                  )),
            );
          }),
    );
  }

  Widget buildEventPageView() {
    final pageViewTiles = [buildPageViewTile(), buildPageViewTile()];
    final PageController controller = PageController();
    return SizedBox(
      height: 220,
      child: PageView(
        controller: controller,
        children: pageViewTiles,
      ),
    );
  }

  Widget buildPageViewTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'バンクシーって誰？展',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('福岡アジア美術館'),
                        Text('10:00〜18:00'),
                      ],
                    ),
                    Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Assets.images.sampleEvent.path))),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '期間 2022年1月10日〜2022年1月11日',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColors.text1,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('行きたい 25')),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColors.text1,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('行った 12'))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
