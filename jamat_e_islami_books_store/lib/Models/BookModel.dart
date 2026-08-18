/// id : ""
/// title : "Islami jagoron er tin pothikrit"
/// description : ""
/// rating : 4.2
/// pages : 30
/// language : "BAN"
/// audiolen : "30"
/// author : "A.K.M Nazir Ahamed"
/// aboutauthor : ""
/// bookurl : ""
/// audiourl : ""
/// category : ""
/// price : 20
/// numberOfRatings : 500

class BookModel {
  BookModel({
      String? id, 
      String? title, 
      String? description, 
      double? rating,
      num? pages, 
      String? language, 
      String? audiolen, 
      String? author, 
      String? aboutauthor, 
      String? bookurl, 
      String? audiourl, 
      String? category, 
      String? price,
      num? numberOfRatings,}){
    _id = id;
    _title = title;
    _description = description;
    _rating = rating;
    _pages = pages;
    _language = language;
    _audiolen = audiolen;
    _author = author;
    _aboutauthor = aboutauthor;
    _bookurl = bookurl;
    _audiourl = audiourl;
    _category = category;
    _price = price ;
    _numberOfRatings = numberOfRatings;
}

  BookModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _rating = json['rating'];
    _pages = json['pages'];
    _language = json['language'];
    _audiolen = json['audiolen'];
    _author = json['author'];
    _aboutauthor = json['aboutauthor'];
    _bookurl = json['bookurl'];
    _audiourl = json['audiourl'];
    _category = json['category'];
    _price = json['price'];
    _numberOfRatings = json['numberOfRatings'];
  }
  String? _id;
  String? _title;
  String? _description;
  double? _rating;
  num? _pages;
  String? _language;
  String? _audiolen;
  String? _author;
  String? _aboutauthor;
  String? _bookurl;
  String? _audiourl;
  String? _category;
  String? _price;
  num? _numberOfRatings;
BookModel copyWith({  String? id,
  String? title,
  String? description,
  double? rating,
  num? pages,
  String? language,
  String? audiolen,
  String? author,
  String? aboutauthor,
  String? bookurl,
  String? audiourl,
  String? category,
  String? price,
  num? numberOfRatings,
}) => BookModel(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  rating: rating ?? _rating,
  pages: pages ?? _pages,
  language: language ?? _language,
  audiolen: audiolen ?? _audiolen,
  author: author ?? _author,
  aboutauthor: aboutauthor ?? _aboutauthor,
  bookurl: bookurl ?? _bookurl,
  audiourl: audiourl ?? _audiourl,
  category: category ?? _category,
  price: price ?? _price,
  numberOfRatings: numberOfRatings ?? _numberOfRatings,
);
  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  double? get rating => _rating;
  num? get pages => _pages;
  String? get language => _language;
  String? get audiolen => _audiolen;
  String? get author => _author;
  String? get aboutauthor => _aboutauthor;
  String? get bookurl => _bookurl;
  String? get audiourl => _audiourl;
  String? get category => _category;
  String? get price => _price;
  num? get numberOfRatings => _numberOfRatings;

  String? get coverURL => _bookurl;

  String? get audio => _audiolen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['rating'] = _rating;
    map['pages'] = _pages;
    map['language'] = _language;
    map['audiolen'] = _audiolen;
    map['author'] = _author;
    map['aboutauthor'] = _aboutauthor;
    map['bookurl'] = _bookurl;
    map['audiourl'] = _audiourl;
    map['category'] = _category;
    map['price'] = _price;
    map['numberOfRatings'] = _numberOfRatings;
    return map;
  }

}