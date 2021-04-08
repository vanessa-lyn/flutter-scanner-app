import 'package:scan_me/form/data/repository/selling_result.dart';
import 'package:scan_me/form/domain/listing_template.dart';

abstract class SellingDataSource {
  Future<SellingResult> startListing(ListingTemplate listingTemplate);
}