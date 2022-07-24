import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aiqal/details.dart';
import 'package:aiqal/model/data.dart';

class CardTwo extends StatefulWidget {
  const CardTwo({Key? key}) : super(key: key);

  @override
  _CardTwoState createState() => _CardTwoState();
}

class _CardTwoState extends State<CardTwo> {
  final data = Blogs.listItem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            var item = data[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(
                              des: data[index].des,
                              time: data[index].time,
                              title: data[index].title,
                              imgUrl: data[index].imgUrl,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  height: 180,
                  child: Card(
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                item.imgUrl,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.title,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        item.time,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 2,
            );
          },
          itemCount: data.length),
    );
  }
}
