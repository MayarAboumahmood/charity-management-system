import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/componant/donat_text_field.dart';
import '../const/const.dart';
import '../size_config.dart';
import 'button.dart';

class AddCreditCard extends StatelessWidget {
  const AddCreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool ismobile = isMobile(context);
    bool isportrai = isPortrait(context);
    double h, w;
    if (isportrai) {
      h = MediaQuery.of(context).size.height;
      w = MediaQuery.of(context).size.width;
    } else {
      w = MediaQuery.of(context).size.height;
      h = MediaQuery.of(context).size.width;
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: h * .02,
              ),
              Text(
                'Add a credit / debit card',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: w * .07,
                    color: Colors.black),
              ).tr(),
              SizedBox(
                height: h * .01,
              ),
              DonatTextField(
                symmetricPaddingLeft: 0.05,
                symmetricPaddingRight: 0.05,
                suffixIcon: const Icon(Icons.credit_card),
                textType: TextInputType.number,
                scurtext: false,
                disableColor: primaryColor,
                enableColor: primaryColor,
                hintText: 'card number',
              ),
              SizedBox(
                height: h * .01,
              ),
              Row(
                children: [
                  Flexible(
                    child: DonatTextField(
                      symmetricPaddingLeft: 0.05,
                      symmetricPaddingRight: 0.01,
                      textType: TextInputType.number,
                      scurtext: false,
                      disableColor: primaryColor,
                      enableColor: primaryColor,
                      hintText: 'Expiration date',
                    ),
                  ),
                  Flexible(
                    child: DonatTextField(
                      symmetricPaddingLeft: 0.01,
                      symmetricPaddingRight: 0.05,
                      textType: TextInputType.number,
                      scurtext: false,
                      disableColor: primaryColor,
                      enableColor: primaryColor,
                      hintText: 'CVC',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * .03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .05),
                child: ContButton(
                    myRadius: 5,
                    myfontSize: w * .037,
                    mycolor: primaryColor,
                    title: 'Save payment method',
                    ontap: () {
                      Get.back();
                    },
                    myheight: 0.05,
                    mywidth: 4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
