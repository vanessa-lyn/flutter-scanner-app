import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/common/view/widgets/scan_me_button.dart';
import 'package:scan_me/common/view/widgets/text_header.dart';
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
          scannerItem
      ),
      child: Consumer<FormViewModel>(
        builder: (context, model, _) => Scaffold(
            appBar: AppBar(
              // title: Text('Create Listing'),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: [
                    ...[
                      TextHeader(
                          text: 'Great, let\'s get a few more details.',
                      ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.network(
                          model.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        // autofocus: true,
                        textInputAction: TextInputAction.next,
                        initialValue: model.title,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                        onSaved: (value) => model.title = value),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          initialValue: model.formattedPrice,
                          decoration: InputDecoration(
                              labelText: 'Price',
                              border: OutlineInputBorder()
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a price';
                            }
                            return null;
                          },
                          onSaved: (value) => model.formattedPrice = value
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          initialValue: model.quantity,
                          decoration: InputDecoration(
                              labelText: 'Quantity',
                              border: OutlineInputBorder()
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter quantity';
                            }
                            return null;
                          },
                          onSaved: (value) => model.quantity = value
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          initialValue: model.description,
                          maxLines: 10,
                          expands: false,
                          decoration: InputDecoration(
                              labelText: 'Description (optional)',
                              border: OutlineInputBorder(),
                              alignLabelWithHint: true,
                              hintText: "Describe your listing with any information helpful for buyers."
                          ),
                          validator: (value) {
                            return null;
                          },
                          onSaved: (value) => model.description = value
                      ),
                      ScanMeButton(
                        onPressed: (){
                          if (_formKey.currentState.validate()) {

                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('Processing....')));
                            Navigator.pushNamed(context, '/successRoute');
                          }
                        },
                        buttonText: "Create listing",
                      )
                    ].expand(
                        (widget) => [
                        widget,
                        SizedBox(
                          height: 24,
                        )
                      ])
                    ]

                  )
                ),
              ),
            )
        ),
      ),
    );
  }
}