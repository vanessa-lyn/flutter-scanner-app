/// A [ListingTemplate] precedes a created a listing.
class ListingTemplate {
  String title ;
  String imageUrl;
  String formattedPrice;
  String quantity;
  String description;

  ListingTemplate({this.title, this.imageUrl, this.formattedPrice, this.quantity, this.description});

  static ListingTemplate initial() {
    return ListingTemplate(
      title: "",
      imageUrl: "",
      formattedPrice: "",
      quantity: "1",
      description: ""
    );
  }
}