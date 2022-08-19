import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/models/beneficiaryModel.dart';
import '../const.dart';
import '../size_config.dart';
import 'button.dart';

// ignore: must_be_immutable
class BeneficiaryCard extends StatelessWidget {
  late String name;
  late List<String> imageName;
  late String reasonForAccepted;
  late String location;
  late String id;
  late String date;
  late String amount;
  late String age;
  late String phone;
  BeneficiaryCard({
    Key? key,
    required this.name,
    required this.imageName,
    required this.id,
    required this.location,
    required this.date,
    required this.reasonForAccepted,
    required this.age,
    required this.amount,
    required this.phone,
  }) : super(key: key);

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

    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * .03),
      child: SizedBox(
        width: w * .94,
        height: h * .33,
        child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(w * .01, h * .008),
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 8)
                ],
                color: Get.isDarkMode
                    ? Themes.customdarktheme.secondaryHeaderColor
                    : Themes.customlighttheme.secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(w * .03),
                    bottomLeft: Radius.circular(w * .03),
                    bottomRight: Radius.circular(w * .03),
                    topRight: Radius.circular(w * .2))),
            width: w * .94,
            height: h * .2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr("name")} :$name',
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * .02, vertical: h * .005),
                    child: AutoSizeText(
                      '${tr("location")} : $location',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * .02, vertical: h * .005),
                    child: AutoSizeText(
                      '${tr("age")} : $age',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * .02, vertical: h * .005),
                    child: AutoSizeText(
                      '${tr("amount")} : $amount',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * .02, vertical: h * .005),
                    child: AutoSizeText(
                      '${tr("date ")} : $date',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * .02, vertical: h * .005),
                    child: AutoSizeText(
                      '${tr("phone ")} : $phone',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr("reason")} :$reasonForAccepted ',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 4,
                    ),
                  ),
                ]),
          ),
          Positioned(
            top: h * -0.01,
            right: w * .06,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: w * .2,
                height: h * .14,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Get.isDarkMode
                          ? Themes.customdarktheme.primaryColor
                          : Themes.customlighttheme.primaryColor,
                      width: w * .005),
                  color: Colors.white,
                  image: const DecorationImage(
                    image: AssetImage('images/splash_2.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: h * -0.03,
            right: w * .05,
            child: ContButton(
              myShadow: 0.008,
              myRadius: w * .1,
              myfontSize: w * .042,
              mycolor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              myheight: 0.059,
              mywidth: 0.2,
              ontap: () {
                Get.toNamed('/editeBeneficiary',
                    arguments: BeneficiaryModel(
                        id: id,
                        date: date,
                        name: name,
                        amount: amount,
                        age: age,
                        reasonForAccepted: reasonForAccepted,
                        location: location,
                        phone: phone));
              },
              title: tr("edite"),
            ),
          ),
        ]),
      ),
    );
  }
}
