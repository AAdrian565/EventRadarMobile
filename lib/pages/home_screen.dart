import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    {"id": 1, "image_path": 'asset/img/homepage/adpage1.png'},
    {"id": 2, "image_path": 'asset/img/homepage/adpage2.png'},
  ];

  final CarouselController carouselController = CarouselController();
  final TextEditingController _searchController = TextEditingController();
  int adIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          width: 378,
          height: 37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        title: TextField(
          controller: _searchController,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          decoration: InputDecoration(
            prefixIcon: Image.asset('asset/img/homepage/search_icon.png'),
            hintText: 'Search public speaking webinar',
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            border: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  print(adIndex);
                },
                child: CarouselSlider(
                    items: imageList
                        .map(
                          (item) => Image.asset(
                            item["image_path"],
                            fit: BoxFit.fill,
                            width: 430,
                            height: 196,
                          ),
                        )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            adIndex = index;
                          });
                        })),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    print(entry);
                    print(entry.key);
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              adIndex == entry.key ? Colors.blue : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 22),
            child: Row(
              children: [
                Text(
                  "Trending Events",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                Image.asset('asset/img/homepage/fire_icon.png'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
