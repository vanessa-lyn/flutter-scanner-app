class CatalogueResponse {
  int timestamp;
  String status;
  int statusCode;
  String statusMessage;
  String requestId;
  CatalogueItem result;

  CatalogueResponse(
      {this.timestamp,
        this.status,
        this.statusCode,
        this.statusMessage,
        this.requestId,
        this.result});

  CatalogueResponse.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status = json['status'];
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    requestId = json['requestId'];
    result =
    json['result'] != null ? new CatalogueItem.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    data['requestId'] = this.requestId;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class CatalogueItem {
  ItemDetails itemDetails;
  List<Offers> offers;
  Demand demand;

  CatalogueItem({this.itemDetails, this.offers, this.demand});

  CatalogueItem.fromJson(Map<String, dynamic> json) {
    itemDetails = json['itemDetails'] != null
        ? new ItemDetails.fromJson(json['itemDetails'])
        : null;
    if (json['offers'] != null) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
      });
    }
    demand =
    json['demand'] != null ? new Demand.fromJson(json['demand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemDetails != null) {
      data['itemDetails'] = this.itemDetails.toJson();
    }
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    if (this.demand != null) {
      data['demand'] = this.demand.toJson();
    }
    return data;
  }
}

class ItemDetails {
  String aid;
  Ids ids;
  Titles titles;
  String model;
  String brand;
  String imageUrl;
  ItemDimensions itemDimensions;
  ItemDimensions packageDimensions;
  Msrp msrp;

  ItemDetails(
      {this.aid,
        this.ids,
        this.titles,
        this.model,
        this.brand,
        this.imageUrl,
        this.itemDimensions,
        this.packageDimensions,
        this.msrp});

  ItemDetails.fromJson(Map<String, dynamic> json) {
    aid = json['aid'];
    ids = json['ids'] != null ? new Ids.fromJson(json['ids']) : null;
    titles =
    json['titles'] != null ? new Titles.fromJson(json['titles']) : null;
    model = json['model'];
    brand = json['brand'];
    imageUrl = json['imageUrl'];
    itemDimensions = json['itemDimensions'] != null
        ? new ItemDimensions.fromJson(json['itemDimensions'])
        : null;
    packageDimensions = json['packageDimensions'] != null
        ? new ItemDimensions.fromJson(json['packageDimensions'])
        : null;
    msrp = json['msrp'] != null ? new Msrp.fromJson(json['msrp']) : Msrp(amount: 0.00);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aid'] = this.aid;
    if (this.ids != null) {
      data['ids'] = this.ids.toJson();
    }
    if (this.titles != null) {
      data['titles'] = this.titles.toJson();
    }
    data['model'] = this.model;
    data['brand'] = this.brand;
    data['imageUrl'] = this.imageUrl;
    if (this.itemDimensions != null) {
      data['itemDimensions'] = this.itemDimensions.toJson();
    }
    if (this.packageDimensions != null) {
      data['packageDimensions'] = this.packageDimensions.toJson();
    }
    if (this.msrp != null) {
      data['msrp'] = this.msrp.toJson();
    }
    return data;
  }
}

class Ids {
  List<String> aSIN;
  List<String> eAN;

  Ids({this.aSIN, this.eAN});

  Ids.fromJson(Map<String, dynamic> json) {
    aSIN = json['ASIN'].cast<String>();
    eAN = json['EAN'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ASIN'] = this.aSIN;
    data['EAN'] = this.eAN;
    return data;
  }
}

class Titles {
  String en;

  Titles({this.en});

  Titles.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}

class ItemDimensions {
  Width width;
  Width length;
  Width height;
  Width weight;
  String origin;

  ItemDimensions(
      {this.width, this.length, this.height, this.weight, this.origin});

  ItemDimensions.fromJson(Map<String, dynamic> json) {
    width = json['width'] != null ? new Width.fromJson(json['width']) : null;
    length = json['length'] != null ? new Width.fromJson(json['length']) : null;
    height = json['height'] != null ? new Width.fromJson(json['height']) : null;
    weight = json['weight'] != null ? new Width.fromJson(json['weight']) : null;
    origin = json['origin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.width != null) {
      data['width'] = this.width.toJson();
    }
    if (this.length != null) {
      data['length'] = this.length.toJson();
    }
    if (this.height != null) {
      data['height'] = this.height.toJson();
    }
    if (this.weight != null) {
      data['weight'] = this.weight.toJson();
    }
    data['origin'] = this.origin;
    return data;
  }
}

class Width {
  double value;
  String unit;

  Width({this.value, this.unit});

  Width.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unit'] = this.unit;
    return data;
  }
}

class Msrp {
  String currencyCode;
  double amount;

  Msrp({this.currencyCode, this.amount});

  Msrp.fromJson(Map<String, dynamic> json) {
    currencyCode = json['currencyCode'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currencyCode'] = this.currencyCode;
    data['amount'] = this.amount;
    return data;
  }
}

class Offers {
  String marketBrand;
  String countryCode;
  Offers offers;
  int timestamp;
  MarketSpecificData marketSpecificData;
  List<String> imageSet;

  Offers(
      {this.marketBrand,
        this.countryCode,
        this.offers,
        this.timestamp,
        this.marketSpecificData});

  Offers.fromJson(Map<String, dynamic> json) {
    marketBrand = json['marketBrand'];
    countryCode = json['countryCode'];
    offers =
    json['offers'] != null ? new Offers.fromJson(json['offers']) : null;
    timestamp = json['timestamp'];
    marketSpecificData = json['marketSpecificData'] != null
        ? new MarketSpecificData.fromJson(json['marketSpecificData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marketBrand'] = this.marketBrand;
    data['countryCode'] = this.countryCode;
    if (this.offers != null) {
      data['offers'] = this.offers.toJson();
    }
    data['timestamp'] = this.timestamp;
    if (this.marketSpecificData != null) {
      data['marketSpecificData'] = this.marketSpecificData.toJson();
    }
  }
}

class NEW {
  Msrp marketPrice;
  Msrp marketPlaceFees;
  Msrp fbaSellingFees;
  String listingUrl;
  List<String> insights;

  NEW (
      {this.marketPrice,
        this.marketPlaceFees,
        this.fbaSellingFees,
        this.listingUrl,
        this.insights});

  NEW.fromJson(Map<String, dynamic> json) {
    marketPrice = json['marketPrice'] != null
        ? new Msrp.fromJson(json['marketPrice'])
        : null;
    marketPlaceFees = json['marketPlaceFees'] != null
        ? new Msrp.fromJson(json['marketPlaceFees'])
        : null;
    fbaSellingFees = json['fbaSellingFees'] != null
        ? new Msrp.fromJson(json['fbaSellingFees'])
        : null;
    listingUrl = json['listingUrl'];
    insights = json['insights'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marketPrice != null) {
      data['marketPrice'] = this.marketPrice.toJson();
    }
    if (this.marketPlaceFees != null) {
      data['marketPlaceFees'] = this.marketPlaceFees.toJson();
    }
    if (this.fbaSellingFees != null) {
      data['fbaSellingFees'] = this.fbaSellingFees.toJson();
    }
    data['listingUrl'] = this.listingUrl;
    data['insights'] = this.insights;
    return data;
  }
}



class MarketSpecificData {
  String objectType;
  String marketSpecificProductTitle;
  Msrp estimatedSalesRevenues;
  int estimatedUnitSold;
  Competition competition;
  String localAsin;
  List<AmazonCategories> amazonCategories;
  bool soldViaFBA;
  int numberOfOffersSoldViaFBA;

  MarketSpecificData(
      {this.objectType,
        this.marketSpecificProductTitle,
        this.estimatedSalesRevenues,
        this.estimatedUnitSold,
        this.competition,
        this.localAsin,
        this.amazonCategories,
        this.soldViaFBA,
        this.numberOfOffersSoldViaFBA});

  MarketSpecificData.fromJson(Map<String, dynamic> json) {
    objectType = json['objectType'];
    marketSpecificProductTitle = json['marketSpecificProductTitle'];
    estimatedSalesRevenues = json['estimatedSalesRevenues'] != null
        ? new Msrp.fromJson(json['estimatedSalesRevenues'])
        : null;
    estimatedUnitSold = json['estimatedUnitSold'];
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
    localAsin = json['localAsin'];
    if (json['amazonCategories'] != null) {
      amazonCategories = new List<AmazonCategories>();
      json['amazonCategories'].forEach((v) {
        amazonCategories.add(new AmazonCategories.fromJson(v));
      });
    }
    soldViaFBA = json['soldViaFBA'];
    numberOfOffersSoldViaFBA = json['numberOfOffersSoldViaFBA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectType'] = this.objectType;
    data['marketSpecificProductTitle'] = this.marketSpecificProductTitle;
    if (this.estimatedSalesRevenues != null) {
      data['estimatedSalesRevenues'] = this.estimatedSalesRevenues.toJson();
    }
    data['estimatedUnitSold'] = this.estimatedUnitSold;
    if (this.competition != null) {
      data['competition'] = this.competition.toJson();
    }
    data['localAsin'] = this.localAsin;
    if (this.amazonCategories != null) {
      data['amazonCategories'] =
          this.amazonCategories.map((v) => v.toJson()).toList();
    }
    data['soldViaFBA'] = this.soldViaFBA;
    data['numberOfOffersSoldViaFBA'] = this.numberOfOffersSoldViaFBA;
    return data;
  }
}

class Competition {
  String objectType;
  String level;
  int numberOfOffers;
  LowestOfferFromReputableSeller lowestOfferFromReputableSeller;
  LowestOfferFromReputableSeller lowestOffer;
  LowestOfferFromReputableSeller buyBoxOffering;
  String amazonOfferState;

  Competition(
      {this.objectType,
        this.level,
        this.numberOfOffers,
        this.lowestOfferFromReputableSeller,
        this.lowestOffer,
        this.buyBoxOffering,
        this.amazonOfferState});

  Competition.fromJson(Map<String, dynamic> json) {
    objectType = json['objectType'];
    level = json['level'];
    numberOfOffers = json['numberOfOffers'];
    lowestOfferFromReputableSeller =
    json['lowestOfferFromReputableSeller'] != null
        ? new LowestOfferFromReputableSeller.fromJson(
        json['lowestOfferFromReputableSeller'])
        : null;
    lowestOffer = json['lowestOffer'] != null
        ? new LowestOfferFromReputableSeller.fromJson(json['lowestOffer'])
        : null;
    buyBoxOffering = json['buyBoxOffering'] != null
        ? new LowestOfferFromReputableSeller.fromJson(json['buyBoxOffering'])
        : null;
    amazonOfferState = json['amazonOfferState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectType'] = this.objectType;
    data['level'] = this.level;
    data['numberOfOffers'] = this.numberOfOffers;
    if (this.lowestOfferFromReputableSeller != null) {
      data['lowestOfferFromReputableSeller'] =
          this.lowestOfferFromReputableSeller.toJson();
    }
    if (this.lowestOffer != null) {
      data['lowestOffer'] = this.lowestOffer.toJson();
    }
    if (this.buyBoxOffering != null) {
      data['buyBoxOffering'] = this.buyBoxOffering.toJson();
    }
    data['amazonOfferState'] = this.amazonOfferState;
    return data;
  }
}

class LowestOfferFromReputableSeller {
  Msrp price;
  SellerRating sellerRating;

  LowestOfferFromReputableSeller({this.price, this.sellerRating});

  LowestOfferFromReputableSeller.fromJson(Map<String, dynamic> json) {
    price = json['price'] != null ? new Msrp.fromJson(json['price']) : null;
    sellerRating = json['sellerRating'] != null
        ? new SellerRating.fromJson(json['sellerRating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    if (this.sellerRating != null) {
      data['sellerRating'] = this.sellerRating.toJson();
    }
    return data;
  }
}

class SellerRating {
  String positiveFeedbackRating;
  int numberOfSellerRatings;

  SellerRating({this.positiveFeedbackRating, this.numberOfSellerRatings});

  SellerRating.fromJson(Map<String, dynamic> json) {
    positiveFeedbackRating = json['positiveFeedbackRating'];
    numberOfSellerRatings = json['numberOfSellerRatings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['positiveFeedbackRating'] = this.positiveFeedbackRating;
    data['numberOfSellerRatings'] = this.numberOfSellerRatings;
    return data;
  }
}

class AmazonCategories {
  String name;
  String id;
  int bestSellerRanking;
  List<String> ancestorsPathIds;
  List<String> ancestorsPathNames;

  AmazonCategories(
      {this.name,
        this.id});

  AmazonCategories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Demand {
  int uS;

  Demand({this.uS});

  Demand.fromJson(Map<String, dynamic> json) {
    uS = json['US'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['US'] = this.uS;
    return data;
  }
}