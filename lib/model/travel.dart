class Travel {
  String? name, location, imageUrl;

  Travel({this.name, this.location, this.imageUrl});

  static List<Travel> generateTravelBlog() {
    return [
      Travel(
          name: 'Pine Hill'
              "\r\n"
              '(8:00 AM - 12:00 PM &'
              "\r\n"
              '3:00 PM - 7:00 PM)',
          location: "Kelulut, Marang, Terengganu",
          imageUrl: 'assets/images/redv2.jpg'),
      Travel(
          name: 'Pine Hill'
              "\r\n"
              '(8:00 AM - 12:00 PM &'
              "\r\n"
              '3:00 PM - 7:00 PM)',
          location: "Kelulut, Marang, Terengganu",
          imageUrl: 'assets/images/mangov.jpg'),
      Travel(
          name: 'Pine Hill'
              "\r\n"
              '(8:00 AM - 12:00 PM &'
              "\r\n"
              '3:00 PM - 7:00 PM)',
          location: "Kelulut, Marang, Terengganu",
          imageUrl: 'assets/images/purplev.jpg'),
    ];
  }

  static List<Travel> generateMostPopularBlog() {
    return [
      Travel(
          name: 'Place 5',
          location: "Place 5",
          imageUrl: 'assets/images/bottom1.jpg'),
      Travel(
          name: 'Place 6',
          location: "Place 6",
          imageUrl: 'assets/images/bottom2.jpg'),
      Travel(
          name: 'Place 7',
          location: "Place 7",
          imageUrl: 'assets/images/bottom3.jpg'),
      Travel(
          name: 'Place 8',
          location: "Place 8",
          imageUrl: 'assets/images/bottom4.jpg'),
    ];
  }
}
