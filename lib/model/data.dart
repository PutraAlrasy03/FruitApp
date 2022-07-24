class Blogs {
  String title;
  String des;
  String time;
  String imgUrl;

  Blogs(this.title, this.des, this.time, this.imgUrl);

  static List<Blogs> listItem() {
    return [
      Blogs(
          "Red Grape",
          "The many nutrients and antioxidant properties of red grapes benefit your overall health. Their vitamins E and C and resveratrol may improve skin health, minimize kidney disorders, fight against neurodegenerative disorders like Alzheimer's disease, improve eyesight, and lower the risk of heart disease",
          "RM 20/pcs",
          "assets/images/red.jpg"),
      Blogs(
          "Mango",
          "Mangoes are a good source of fiber and antioxidants, including vitamin C, which means they support a healthy immune system and may fight chronic and inflammatory diseases. They also contain nutrients that support eye and skin health and are a good part of an overall healthy diet",
          "RM 10/pcs",
          "assets/images/mango.jpg"),
      Blogs(
          "Purple Grape",
          "Grapes have a low glycemic index, which means they don't raise your blood sugar too quickly. Because of that, they're a good fruit choice if you have diabetes. The polyphenols in purple grapes -- the compounds that give them their color -- may also help prevent type 2 diabetes.",
          "RM 30/pcs",
          "assets/images/grapes.jpg")
    ];
  }
}
