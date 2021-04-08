import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/app_router.dart';
import 'package:scan_me/common/view/colors.dart';
import 'package:scan_me/common/view/widgets/scan_me_button.dart';
import 'package:scan_me/common/view/widgets/text_header.dart';
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
        builder: (context, model, _) => Scaffold(
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: AppColors.BLUE,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0),
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
                              borderRadius: BorderRadius.circular(15),
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
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AppColors.GREY,
                                  width: 1,
                                ),
                                color: AppColors.LIGHTGREY,
                              ),
                              child: IconButton(
                                // icon: const Icon(Icons.file_upload),
                                icon: const Icon(Icons.image_search),
                                onPressed: ()  {}
                              ),
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
                            labelText: 'Title', border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                        onSaved: (value) =>
                            model.listingTemplate.title = value),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        initialValue: model.listingTemplate.formattedPrice,
                        decoration: InputDecoration(
                            labelText: 'Price', border: OutlineInputBorder()),
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
                            border: OutlineInputBorder()),
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
                        maxLines: 10,
                        expands: false,
                        decoration: InputDecoration(
                            labelText: 'Description (optional)',
                            border: OutlineInputBorder(),
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
                          Navigator.pushNamed(context, successRoute,
                              arguments: sellingResult);
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
    );
  }
}
