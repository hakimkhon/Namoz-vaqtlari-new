import 'package:flutter/material.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LeftRightWidget extends StatelessWidget {
  const LeftRightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ConstSizes.height(10, context),
      // color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZoomTapAnimation(
            onTap: () {},
            child: const Row(
              children: [
                Icon(Icons.arrow_back),
                Text("Back", style: TextStyle(fontSize: 22))
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Juma", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              Text("2024-08-09", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.green)),
            ],
          ),
          ZoomTapAnimation(
            onTap: () {},
            child: const Row(
              children: [
                Text("Next", style: TextStyle(fontSize: 22)),
                Icon(Icons.arrow_forward)
              ],
            ),
          )
        ],
      ),
    );
  }
}
