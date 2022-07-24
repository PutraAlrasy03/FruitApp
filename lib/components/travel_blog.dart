import 'package:flutter/material.dart';
import 'package:aiqal/detail_page.dart';
import 'package:aiqal/model/travel.dart';

class TravelBlog extends StatelessWidget {
  TravelBlog({Key? key}) : super(key: key);

  final _list = Travel.generateTravelBlog();
  final _pageCtrl = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: _list.length,
      controller: _pageCtrl,
      itemBuilder: (BuildContext context, int index) {
        var travel = _list[index];
        return GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 20, bottom: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    travel.imageUrl!,
                    fit: BoxFit.cover,
                    width: 1300,
                    height: 1300,
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        travel.location!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        travel.name!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
