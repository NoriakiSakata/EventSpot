import 'package:flutter/material.dart';
import 'package:helloworld/gen/assets.gen.dart';
import 'package:helloworld/pages/widgets/custom_text_field.dart';
import 'package:helloworld/themes/app_colors.dart';

class EditEventPage extends StatelessWidget {
  const EditEventPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      fullscreenDialog: true,
      builder: (_) => const EditEventPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('イベント編集')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 30,
              ),
              buildImage(),
              const SizedBox(
                height: 30,
              ),
              buildEventName(),
              const SizedBox(
                height: 30,
              ),
              buildTime(),
              const SizedBox(
                height: 30,
              ),
              buildPeriod(),
              const SizedBox(
                height: 30,
              ),
              buildFee(),
              const SizedBox(
                height: 30,
              ),
              buildAddress(),
              const SizedBox(
                height: 30,
              ),
              buildUrl(),
              const SizedBox(
                height: 30,
              ),
              buildDescription(),
              const SizedBox(
                height: 30,
              ),
              buildAddButton(),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'イベント名',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          maxLines: 2,
        )
      ],
    );
  }

  Widget buildTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '開催時間',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('開始'),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(children: const [
                    Flexible(
                        flex: 1,
                        child: CustomTextField(
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text('時'),
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        flex: 1,
                        child: CustomTextField(
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text('分'),
                          ),
                        ))
                  ]),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('終了'),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Flexible(
                          flex: 1,
                          child: CustomTextField(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text('時'),
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          flex: 1,
                          child: CustomTextField(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text('分'),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPeriod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '開催期間',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('開始'),
                    CustomTextField(
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                  ],
                )),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('終了'),
                    CustomTextField(
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }

  Widget buildFee() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '料金',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          maxLines: 2,
        )
      ],
    );
  }

  Widget buildPlaceName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '開催地名',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          maxLines: 2,
        )
      ],
    );
  }

  Widget buildAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '住所',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        buildPostCode(),
        const SizedBox(
          height: 30,
        ),
        buildPrefectureAndCity(),
        const SizedBox(
          height: 30,
        ),
        buildAfterAdress()
      ],
    );
  }

  Widget buildPostCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '郵便番号',
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField()
      ],
    );
  }

  Widget buildPrefectureAndCity() {
    return Row(
      children: [
        Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('県'),
                CustomTextField(),
              ],
            )),
        const SizedBox(
          width: 10,
        ),
        Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('市区町村'),
                CustomTextField(),
              ],
            )),
      ],
    );
  }

  Widget buildAfterAdress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'それ以降の住所',
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField()
      ],
    );
  }

  Widget buildUrl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'サイトURL',
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField()
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '詳細情報',
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          maxLines: 4,
        )
      ],
    );
  }

  Widget buildAddButton() {
    return Builder(builder: (context) {
      return SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor.shade300),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '編集を保存する',
              style: TextStyle(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            )),
      );
    });
  }
}
