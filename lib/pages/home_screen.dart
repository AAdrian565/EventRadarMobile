import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final user = FirebaseAuth.instance.currentUser!;

  //sign out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final CarouselController carouselController = CarouselController();
  final TextEditingController _searchController = TextEditingController();
  int adIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // flexibleSpace: Container(
        //   width: 378,
        //   height: 37,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        // ),
        actions: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
        ],
        // title: TextField(
        //   controller: _searchController,
        //   style: TextStyle(
        //     fontFamily: 'Poppins',
        //     fontSize: 12,
        //     fontWeight: FontWeight.w600,
        //     color: Colors.grey,
        //   ),
        //   decoration: InputDecoration(
        //     prefixIcon: Image.asset('asset/img/homepage/search_icon.png'),
        //     hintText: 'Search public speaking webinar',
        //     hintStyle: TextStyle(
        //       fontFamily: 'Poppins',
        //       fontSize: 12,
        //       fontWeight: FontWeight.w600,
        //       color: Colors.grey,
        //     ),
        //     border: InputBorder.none,
        //   ),
        //   onChanged: (value) {},
        // ),
      ),
    );
  }

  Widget carousel() {
    return Stack(
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
                    color: adIndex == entry.key ? Colors.blue : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget homepageComunities() {
    return SizedBox(
      width: 400,
      height: 100,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return HomepageProfile(
              image: Image.asset('asset/img/homepage/comunity1.png'),
              name: "John Doe $index",
            );
          },
        ),
      ),
    );
  }

  Widget homepageEvents() {
    return SizedBox(
      height: 310,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3, // Number of items you want to display
          itemBuilder: (context, index) {
            return HomepageEventCard(
              title: "Public Speaking Webinar",
              image: Image.asset('asset/img/homepage/event1.png'),
              lastRegistrationDate: DateTime.now(),
              eventDate: DateTime.now(),
              eventType: "Webinar",
              eventCategory: ["Public Speaking", "Webinar"],
            );
          },
        ),
      ),
    );
  }

  Widget homepageSpeakers() {
    return SizedBox(
      width: 400,
      height: 100,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return HomepageProfile(
              image: Image.asset('asset/img/homepage/speaker1.png'),
              name: "John Doe $index",
            );
          },
        ),
      ),
    );
  }

  Widget sectionTitle(String text, Image image) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 22, bottom: 20),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          image,
        ],
      ),
    );
  }
}
