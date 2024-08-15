import 'package:flutter/material.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:namozvaqtlari/core/resources/asset_resources.dart';
import 'package:namozvaqtlari/routes/all_routes.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.regionName});
  final String regionName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ZoomTapAnimation(
              onTap: () {
                showMyDialog(
                  context,
                  "O'ylab ko'ring",
                  "Haqiqatdan ham hududni o'zgartirmoqchimisiz?",
                  "Ha",
                  () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AllRoutesNames.home, (settings) => false);
                  },
                  "Yo'q",
                  () {
                    Navigator.pop(context);
                  },
                  Colors.amber,
                );
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 24,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    regionName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Nimadur",
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
        Container(
          padding: const EdgeInsets.all(2),
          width: double.infinity,
          height: ConstSizes.height(20, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage(
                  ImageAssets.swimmerImage,
                ),
                fit: BoxFit.cover),
          ),
        )
      ],
    );
  }

  Future showMyDialog(BuildContext context, String title, String content,
      String yesBtn, Function yes, String noBtn, Function no, Color color) {
    return showDialog(
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        content: Text(
          content,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
        ),
        actions: [
          FloatingActionButton(
            onPressed: () {
              yes();
            },
            foregroundColor: Colors.blue[800],
            child: Text(
              yesBtn,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              no();
            },
            foregroundColor: Colors.red,
            child: Text(
              noBtn,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      context: context,
    );
  }
}
