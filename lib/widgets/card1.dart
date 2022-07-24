import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aiqal/details.dart';
import 'package:aiqal/model/data.dart';

class CardOne extends StatefulWidget {
  const CardOne({Key? key}) : super(key: key);

  @override
  _CardOneState createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
  final data = Blogs.listItem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = data[index];

            return Container(
              //height: 200,
              width: 150,
              child: Card(
                elevation: 8,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Ink.image(
                      image: AssetImage(item.imgUrl),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                        des: data[index].des,
                                        title: data[index].title,
                                        time: data[index].time,
                                        imgUrl: data[index].imgUrl,
                                      )));
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        children: [
                          Text(
                            item.title,
                            maxLines: 3,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: data.length),
    );
  }
}
