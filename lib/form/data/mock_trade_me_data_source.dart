import 'package:scan_me/form/data/selling_data_source.dart';
import 'package:scan_me/form/data/repository/selling_result.dart';
import 'package:scan_me/form/domain/listing_template.dart';

class MockTradeMeDataSource extends SellingDataSource {
  @override
  Future<SellingResult> startListing(ListingTemplate listingTemplate) {
    return Future.delayed(
      Duration(seconds: 2),
    ).then(
      (value) => SellingResult(
        listingTemplate.title,
        "Buy Now",
        listingTemplate.formattedPrice,
        listingTemplate.imageUrl,
        listingTemplate.category
      ),
    );
  }
}
