import 'package:flutter/material.dart';
import 'package:aiqal/model/travel.dart';

const dummy =
    "We have so many things that we have to do better... and certainly ipsum is one of them. An 'extremely credible source' has called my office and told me that Lorem Ipsum's birth certificate is a fraud. I have a 10 year old son. He has words. He is so good with these words it's unbelievable. I write the best placeholder text, and I'm the biggest developer on the web by far... While that's mock-ups and this is politics, are they really so different? Be careful, or I will spill the beans on your placeholder text. You know, it really doesn’t matter what you write as long as you’ve got a young, and beautiful, piece of text. I’m the best thing that ever happened to placeholder text. Look at that text! Would anyone use that? Can you imagine that, the text of your next webpage?! An ‘extremely credible source’ has called my office and told me that Barack Obama’s placeholder text is a fraud. The concept of Lorem Ipsum was created by and for the Chinese in order to make U.S. design jobs non-competitive. Lorem Ispum is a choke artist. It chokes! That other text? Sadly, it’s no longer a 10.";

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.travel}) : super(key: key);

  final Travel travel;
  final double expandedHeight = 350;
  final double roundedContainerHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _builtSilverHead(),
              SliverToBoxAdapter(
                child: _builtDetail(),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              right: 15,
              left: 15,
            ),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Icon(Icons.menu, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builtSilverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        travel: travel,
        expandedHeight: expandedHeight,
        roundedContainerHeight: roundedContainerHeight,
      ),
    );
  }

  Widget _builtDetail() => Container(
        color: Colors.white,
        child: Column(
          children: [
            _builtUserInfo(),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                dummy,
                style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Featured',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'View More',
                    style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: FeaturedWidget(),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                dummy,
                style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
              ),
            ),
          ],
        ),
      );

  Widget _builtUserInfo() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                travel.imageUrl!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    travel.name!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    travel.location!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.share,
              color: Colors.grey,
            ),
          ],
        ),
      );
}

class FeaturedWidget extends StatelessWidget {
  FeaturedWidget({
    Key? key,
  }) : super(key: key);

  final _list = Travel.generateMostPopularBlog();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      scrollDirection: Axis.horizontal,
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) {
        var travel = _list[index];
        return SizedBox(
          width: 120,
          child: Image.asset(
            travel.imageUrl!,
            fit: BoxFit.cover,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10);
      },
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  DetailSliverDelegate(
      {required this.roundedContainerHeight,
      required this.expandedHeight,
      required this.travel});

  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            travel.imageUrl!,
            width: MediaQuery.of(context).size.width,
            height: expandedHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - shrinkOffset - 120,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                travel.name!,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                travel.location!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
