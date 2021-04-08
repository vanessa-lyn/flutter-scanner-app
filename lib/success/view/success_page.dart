import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/app_router.dart';
import 'package:scan_me/common/view/colors.dart';
import 'package:scan_me/common/view/widgets/network_image.dart';
import 'package:scan_me/common/view/widgets/scan_me_button.dart';
import 'package:scan_me/form/data/repository/selling_result.dart';
import 'package:scan_me/success/presentation/success_view_model.dart';

const double FONT_SIZE_BODY = 12;

class SuccessPage extends StatelessWidget {
  final SellingResult sellingResult;

  const SuccessPage({Key key, this.sellingResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SuccessViewModel>(
      create: (context) => SuccessViewModel(sellingResult),
      child: Consumer<SuccessViewModel>(
        builder: (context, model, _) => Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 14, right: 14),
            child: Column(
              children: [
                Container(height: 60),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('frame.png'),
                ),
                Container(height: 16),
                Text(
                  "Great, that listing is live and \navailable for purchase.",
                  style: TextStyle(fontSize: FONT_SIZE, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: Flexible(
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ScanMeImage(imageUrl: model.viewState.sellingResult.imageUrl),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.viewState.sellingResult.title,
                                    style: TextStyle(fontSize: FONT_SIZE_BODY, fontWeight: FontWeight.bold),
                                  ),
                                  Container(height: 10),
                                  Text(
                                    model.viewState.sellingResult.formattedPaymentMethod,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(height: 2),
                                  Text(
                                    model.viewState.sellingResult.formattedPrice,
                                    style: TextStyle(fontSize: FONT_SIZE_BODY, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(height: 80),
                ScanMeButton(
                  buttonText: "Scan another item",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, rootRoute, (Route<dynamic> route) => false);
                  },
                ),
                Container(height: 16),
                TextButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "View your live listings ",
                          style: TextStyle(fontSize: FONT_SIZE),
                        ),
                        Icon(Icons.open_in_new)
                      ],
                    )),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
