import 'package:scan_me/services/dto/catalogue_response.dart';

/// A [ListingTemplate] precedes a created a listing.
class ListingTemplate {
  String title ;
  String imageUrl;
  String formattedPrice;
  String quantity;
  String description;
  String category;
  List categories;

  ListingTemplate({this.title, this.imageUrl, this.formattedPrice, this.quantity, this.description, this.category, this.categories});

  static ListingTemplate initial() {
    return ListingTemplate(
      title: "",
      category: "",
      imageUrl: "",
      formattedPrice: "",
      quantity: "1",
      description: "",
      categories: []
    );
  }
}