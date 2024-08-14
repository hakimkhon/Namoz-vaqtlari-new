import 'package:flutter/material.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:namozvaqtlari/core/resources/asset_resources.dart';
import 'package:namozvaqtlari/routes/all_routes.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.regionName});
  final String regionName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.location_on_outlined),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AllRoutesNames.home, (settings) => false);
              },
              child: Text(
                regionName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  // color: Colors.black,
                ),
              ),
            ),
            // const Spacer(),
            // const Text(
            //   "Safar 3",
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
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
              ),fit: BoxFit.cover
            ),
          ),
          // child: const Image(
          //   image: AssetImage(ImageAssets.swimmerImage),
          //   fit: BoxFit.cover,
          // ),
        )
      ],
    );
  }
}
