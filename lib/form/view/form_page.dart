import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/app_router.dart';
import 'package:scan_me/common/view/colors.dart';
import 'package:scan_me/common/view/widgets/loading_overlay.dart';
import 'package:scan_me/common/view/widgets/scan_me_button.dart';
import 'package:scan_me/common/view/widgets/text_header.dart';
import 'package:scan_me/common/view_state.dart';
import 'package:scan_me/form/data/repository/selling_repository.dart';
import 'package:scan_me/form/data/repository/selling_result.dart';
import 'package:scan_me/form/presentation/form_view_model.dart';
import 'package:scan_me/scanner/data/scanner_item.dart';

class FormPage extends StatelessWidget {
  final ScannerItem scannerItem;

  FormPage({Key key, @required this.scannerItem}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormViewModel>(
      create: (context) => FormViewModel(
        scannerItem,
        Provider.of<SellingRepository>(context, listen: false),
      ),
      child: Consumer<FormViewModel>(
        builder: (context, model, _) => ScanMeLoadingOverlay(
          isLoading: model.state is Loading,
          child: Scaffold(
              appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: AppColors.BLUE,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () => {
                    Navigator.pushNamed(context, rootRoute)
                  }
                ),
                ),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...[
                              TextHeader(
                                text: 'Great, let\'s get a few more details.',
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: AppColors.GREY,
                                          width: 1,
                                        ),
                                        color: AppColors.LIGHTGREY,
                                      ),
                                      child: Image.network(
                                        model.listingTemplate.imageUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: AppColors.GREY,
                                            width: 1,
                                          ),
                                          color: AppColors.LIGHTGREY,
                                        ),
                                        child: IconButton(
                                            icon: const Icon(
                                                Icons.add_photo_alternate_outlined),
                                            color: AppColors.BLUE,
                                            onPressed: () {}),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.text,
                                  // autofocus: true,
                                  textInputAction: TextInputAction.next,
                                  initialValue: model.listingTemplate.title,
                                  decoration: InputDecoration(
                                      labelText: 'Title',
                                      border: OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                        const BorderSide(color: AppColors.GREY),
                                      )),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a title';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) =>
                                  model.listingTemplate.title = value),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        child: IconButton(
                                            icon: const Icon(Icons.list),
                                            color: AppColors.BLUE,
                                            iconSize: 30,
                                            onPressed: () {}),
                                      ),
                                    ),
                                  ),
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(model.listingTemplate.category,
                                            style: TextStyle(
                                              fontSize: 20,
                                            )),
                                        Text(
                                            model.listingTemplate.categoryPath,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.DARKGREY)),
                                      ])
                                ],
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  initialValue:
                                  model.listingTemplate.formattedPrice,
                                  decoration: InputDecoration(
                                      labelText: 'Price',
                                      border: OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                        const BorderSide(color: AppColors.GREY),
                                      )),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a price';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) =>
                                  model.listingTemplate.formattedPrice = value),
                              TextFormField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  initialValue: model.listingTemplate.quantity,
                                  decoration: InputDecoration(
                                      labelText: 'Quantity',
                                      border: OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                        const BorderSide(color: AppColors.GREY),
                                      )),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter quantity';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) =>
                                  model.listingTemplate.quantity = value),
                              TextFormField(
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  initialValue: model.listingTemplate.description,
                                  maxLines: 5,
                                  expands: false,
                                  decoration: InputDecoration(
                                      labelText: 'Description',
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                        const BorderSide(color: AppColors.GREY),
                                      ),
                                      alignLabelWithHint: true,
                                      hintText:
                                      "Describe your listing with any information helpful for buyers."),
                                  validator: (value) {
                                    return null;
                                  },
                                  onSaved: (value) =>
                                  model.listingTemplate.description = value),
                              ScanMeButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    SellingResult sellingResult =
                                    await model.onStartListing();
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      successRoute,
                                          (Route<dynamic> route) => false,
                                      arguments: sellingResult,
                                    );
                                  }
                                },
                                buttonText: "Create listing",
                              )
                            ].expand((widget) => [
                              widget,
                              SizedBox(
                                height: 24,
                              ),
                            ])
                          ])),
                ),
              )),
        ),
      ),
    );
  }
}
