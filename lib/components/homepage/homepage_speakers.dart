import 'package:flutter/material.dart';

class HomepageProfile extends StatelessWidget {
  final Image image;
  final String name;

  const HomepageProfile({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(.5),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50), child: image),
              ),
              const SizedBox(height: 4),
              Text(overflow: TextOverflow.ellipsis, name),
            ],
          ),
        ),
      ),
    );
  }
}
