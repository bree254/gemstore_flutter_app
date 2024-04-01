import 'category.dart';
import 'dresses.dart';
import 'order_categories.dart';

class MyData {
  static List<String> collections = [
    "assets/images/autumn.png",
    "assets/images/autumn_two.jpg",
    "assets/images/autumn_three.jpg",
  ];

  static List<dynamic> featuredproducts = [
    {
      "name": "Turtleneck Sweater",
      "imageURL":"assets/images/turtle_neck.png",
      "price": 39.99
    },
    {
      "name": "Long Sleeve Dress",
      "imageURL":"assets/images/long_sleeved_dress.png",
      "price":  45.00
    },
    {
      "name": "Sportwear Set",
      "imageURL":"assets/images/hoodie.png",
      "price":  50.00
    },
    {
      "name": "Elegant Dress",
      "imageURL":"assets/images/elegant.png",
      "price":  75.00
    }
  ];
   static List<dynamic> recommendedproducts = [
    {
      "name":"White fashion hoodie",
      "image":"assets/images/hoodie.png",
      "price":29.00
    },
    {
      "name":"Cotton T-shirt",
      "image":"assets/images/long_sleeved_dress.png",
      "price":30.00
    },

  ];



  static List<Category> categoryList = [
    Category(id: 1, name: "Women", image: 'assets/icons/female.png', isSelected: true),
    Category(id: 2, name: "Men", image: 'assets/icons/male.png'),
    Category(id: 3, name: "Accessories", image: 'assets/icons/accessories.png'),
    Category(id: 4, name: "Beauty", image: 'assets/icons/beauty.png'),
  ];

  static List<Dress> dresses = [
    Dress(
      name: 'Linen Dress',
      price:52.00,
      liked: false,
      starRating: 4,
      numOfRatings: 64,
      image: 'assets/images/dress_one.png',
    ),
    Dress(
      name: 'Filted Waist Dress',
      price: 47.99,
      liked: true,
      starRating: 3,
      numOfRatings: 53,
      image: 'assets/images/dress_two.png',
    ),
    Dress(
      name: 'Maxi Dress',
      price:68.00,
      liked: false,
      starRating: 4,
      numOfRatings: 46,
      image: 'assets/images/dress_three.png',
    ),
    Dress(
      name: 'Front Tie Mini Dress',
      price: 59.00,
      liked: true,
      starRating: 4,
      numOfRatings: 38,
      image: 'assets/images/dress_four.png',
    ),
    Dress(
      name: 'Ohara Dress',
      price: 85.00,
      liked: false,
      starRating: 4,
      numOfRatings: 50,
      image: 'assets/images/dress_five.png',
    ),
    Dress(
      name: 'Tie Back Mini Dress',
      price:67.00,
      liked: true,
      starRating: 5,
      numOfRatings: 39,
      image: 'assets/images/dress_six.png',
    ),
    Dress(
      name: 'Leaves Green Dress',
      price: 64.00 ,
      liked: false,
      starRating: 5,
      numOfRatings: 83,
      image: 'assets/images/dress_seven.png',
    ),
    Dress(
      name: 'Off Shoulder Dress',
      price: 78.99 ,
      liked: true,
      starRating: 4,
      numOfRatings: 25,
      image: 'assets/images/dress_eight.png',
    ),
  ];
  static List<Map<String, String>> orders = [
    {
      'orderNumber': 'Order #1514',
      'date': '13/05/2021',
      'trackingNumber': 'IK987362341',
      'quantity': '2',
      'subtotal': '110',
      'status': 'DELIVERED'
    },
    {
      'orderNumber': 'Order #1679',
      'date': '12/05/2021',
      'trackingNumber': 'IK3873218890',
      'quantity': '3',
      'subtotal': '450',
      'status': 'DELIVERED'
    },
    {
      'orderNumber': 'Order #1671',
      'date': '10/05/2021',
      'trackingNumber': 'IK237368881',
      'quantity': '3',
      'subtotal': '400',
      'status': 'DELIVERED'
    },
    {
      'orderNumber': 'Order #1514',
      'date': '13/05/2021',
      'trackingNumber': 'IK987362341',
      'quantity': '2',
      'subtotal': '110',
      'status': 'DELIVERED'
    },
    {
      'orderNumber': 'Order #1679',
      'date': '12/05/2021',
      'trackingNumber': 'IK3873218890',
      'quantity': '3',
      'subtotal': '450',
      'status': 'DELIVERED'
    },
    {
      'orderNumber': 'Order #1671',
      'date': '10/05/2021',
      'trackingNumber': 'IK237368881',
      'quantity': '3',
      'subtotal': '400',
      'status': 'DELIVERED'
    },
    // Add more data items as needed
  ];
  static List<OrderCategory> orderCategory = [
    OrderCategory(id: 1, name: "Pending"),
    OrderCategory(id: 2, name: "Delivered", isSelected: true),
    OrderCategory(id: 3, name: "Canceled"),

  ];
   static List<dynamic> productGroup = [
    {
      "name": "T-Shirts",
      "description":"The Office Life",
      "imageURL":"assets/images/t_shirt.png",
    },
    {
      "name": "Dresses",
      "description":"The Elegant Design",
      "imageURL":"assets/images/elegant.png",

    },
     {
       "name": "T-Shirts",
       "description":"The Casual Life",
       "imageURL":"assets/images/t_shirt.png",
     },
     {
       "name": "Dresses",
       "description":" The Classy Design",
       "imageURL":"assets/images/elegant.png",

     },


  ];

}