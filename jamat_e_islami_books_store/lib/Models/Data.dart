import 'BookModel.dart';

var categoryData = [
  {
    "icon": "Assets/Icons/world.svg",
    "lebel":"Documentary"
  },
  {
    "icon": "Assets/Icons/star.svg",
    "lebel":"Games"
  },

  {
    "icon": "Assets/Icons/plane.svg",
    "lebel":"Travel"
  },
  {
    "icon": "Assets/Icons/heart.svg",
    "lebel":"Romance"
  },
];

var bookData = [
  // lib/Models/BookModel.dart
  BookModel(
    id: "1",
    title: "Islami Jagoroner tin Pothikrit ",
    description: "",
    aboutauthor: "",
    audiolen: "20",
    author: "এ. কে. এম. নাজির আহমদ",
    bookurl: "Assets/Images/Islami Jagoroner tin Pothikrit.png",
    rating: 4.7,
    numberOfRatings: 123,
    category: "Documentary",
    price: "Free",
    // price: "",
  ),
  BookModel(
      id: "2",
      title: "Rasul(SW) er Mokka jiboni",
      description: "",
      aboutauthor: "",
      audiolen: "20",
      author: "মতিউর রহমান নিজামী",
      bookurl: "Assets/Images/Rasul(SW) er Mokka jiboni.png",
      rating: 4.7,
      numberOfRatings: 123,
      price: "Free",
      category: "Documentary"
  ),
  BookModel(
      id: "3",
      title: "Polashi theke Bangladesh",
      description: "",
      aboutauthor: "",
      audiolen: "20",
      author: "অধ্যাপক গোলাম আযম",
      bookurl: "Assets/Images/Polashi theke Bangladesh.png",
      rating: 4.7,
      numberOfRatings: 123,
      price: "Free",
      category: "Documentary"
  ),
  BookModel(
      id: "4",
      title: "সীরাতে ইবনে হিশাম",
      description: "",
      aboutauthor: "",
      audiolen: "20",
      author: "ইবনে হিশাম",
      bookurl: "Assets/Images/Serat-e Ibne Hesam.png",
      rating: 4.7,
      numberOfRatings: 123,
      price: "Free",
      category: "Documentary"
  ),
  BookModel(
      id: "5",
      title: "পর্দা ও ইসলাম",
      description: "",
      aboutauthor: "",
      audiolen: "20",
      author: "সাইয়েদ আবুল আ’লা মওদুদী (র)",
      bookurl: "Assets/Images/Porda o Islam.png",
      rating: 4.7,
      numberOfRatings: 123,
      price: "Free",
      category: "Documentary"
  ),
];