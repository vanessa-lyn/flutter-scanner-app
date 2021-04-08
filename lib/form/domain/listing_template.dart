/// A [ListingTemplate] precedes a created a listing.
class ListingTemplate {
  String title ;
  String imageUrl;
  String formattedPrice;
  String quantity;
  String description;
  String category;

  ListingTemplate({this.title, this.imageUrl, this.formattedPrice, this.quantity, this.description, this.category});

  static ListingTemplate initial() {
    return ListingTemplate(
      title: "",
      category: "",
      imageUrl: "",
      formattedPrice: "",
      quantity: "1",
      description: ""
    );
  }
}