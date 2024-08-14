import 'package:flutter/material.dart';
import 'package:namozvaqtlari/core/constants/const_sizes.dart';
import 'package:namozvaqtlari/mocks/mock_data_region.dart';
import 'package:namozvaqtlari/routes/all_routes.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> _foundSitys = [];
  @override
  void initState() {
    // _foundSitys = MockDataRegion.regions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Home page"),
        // ),
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(ConstSizes.width(3, context)),
            child: const Text(
              "Select a Country",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(ConstSizes.width(3, context)),
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(10)),
            child: const TextField(
              // onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: MockDataRegion.regions.length,
              itemBuilder: (context, index) {
                return ZoomTapAnimation(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AllRoutesNames.mainPage,
                      (settings) => false,
                      arguments: MockDataRegion.regions[index],
                    );
                  },
                  child: Container(
                    height: ConstSizes.height(5, context),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    child: Center(
                      child: Text(
                        MockDataRegion.regions[index],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

// void _runFilter(String enterKeyword) {
//   List<String> result = [];
//   if (enterKeyword.isEmpty) {
//     result = MockDataRegion.regions;
//   } else {
//     // result = MockDataRegion.regions.where(title){
      
//     // } 
//   }
// }
