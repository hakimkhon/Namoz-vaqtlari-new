import 'package:flutter/material.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ButtonsTime extends StatelessWidget {
  const ButtonsTime({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });
  final Function onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          myButton(context, "Bugun", currentIndex ==1?  Colors.green : Colors.white, 1),
          myButton(context, "Shu Xafta", currentIndex ==2?  Colors.green : Colors.white, 2),
          myButton(context, "Oylik", currentIndex ==3?  Colors.green : Colors.white, 3),
        ],
      ),
    );
  }

  myButton(context, String title, Color color, int index) {
    return ZoomTapAnimation(
      onTap: () {
        onTap(index);
        // if(index==3){}
      },
      child: SizedBox(
        width: ConstSizes.width(30, context),
        height: ConstSizes.height(5, context),
        child: Card(
          color: color,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
