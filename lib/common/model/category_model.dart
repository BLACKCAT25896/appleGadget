import 'package:flutter_boilerplate/util/images.dart';

class CategoryItem {
  String? _name;
  String? _icon;


  CategoryItem(
      {
        String? name,
        String? icon,
      }) {

    _name = name;
    _icon = icon;
  }


  String? get name => _name;
  String? get icon => _icon;

  CategoryItem.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _icon = json['icon'];

  }

}

List<CategoryItem> categories = [
  CategoryItem(name: "Cars", icon: Images.car),
  CategoryItem(name: "Properties", icon: Images.property),
  CategoryItem(name: "Mobile", icon: Images.mobile),
  CategoryItem(name: "Jobs", icon: Images.jobs),
  CategoryItem(name: "Bike", icon: Images.bike),
  CategoryItem(name: "Electronics", icon: Images.electronics),
  CategoryItem(name: "House", icon: Images.property),
  CategoryItem(name: "Services", icon: Images.service),
];


List<CategoryItem> offerPropertyForRentList = [
  CategoryItem(name: "Apartment Rentals", icon: Images.car),
  CategoryItem(name: "Commercial Property Rentals", icon: Images.property),
  CategoryItem(name: "Room Rentals", icon: Images.mobile),
  CategoryItem(name: "House Rentals", icon: Images.jobs),
  CategoryItem(name: "Land Rentals", icon: Images.bike),

];



List<CategoryItem> postJobUsaList = [
  CategoryItem(name: "Accountant", icon: Images.car),
  CategoryItem(name: "Beautician", icon: Images.property),
  CategoryItem(name: "Business Analyst", icon: Images.mobile),
  CategoryItem(name: "Chef", icon: Images.jobs),
  CategoryItem(name: "Collection & Recovery Agents", icon: Images.bike),
  CategoryItem(name: "Construction Worker", icon: Images.car),
  CategoryItem(name: "Content Writer", icon: Images.property),
  CategoryItem(name: "Counsellor", icon: Images.mobile),
  CategoryItem(name: "Customer Service Executive", icon: Images.jobs),
  CategoryItem(name: "Customer Support Manager", icon: Images.bike),
  CategoryItem(name: "Delivery Rider", icon: Images.car),
  CategoryItem(name: "Designer", icon: Images.property),

];



