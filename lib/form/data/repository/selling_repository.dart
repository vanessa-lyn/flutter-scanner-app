import 'package:scan_me/form/data/selling_data_source.dart';
import 'package:scan_me/form/data/repository/selling_result.dart';
import 'package:scan_me/form/domain/listing_template.dart';

class SellingRepository {

  final SellingDataSource dataSource;

  SellingRepository(this.dataSource);

  Future<SellingResult> startListing(ListingTemplate listingTemplate) => dataSource.startListing(listingTemplate);
}