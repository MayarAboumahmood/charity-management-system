import 'package:flutter/material.dart';
import '../const.dart';

// ignore: must_be_immutable
class CICard extends StatelessWidget {
  String title;
  Function() ontap;
  Color mycolor;
  CICard(
      {Key? key,
      required this.mycolor,
      required this.title,
      required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * .4,
      // height: MediaQuery.of(context).size.height * .3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.height * .3,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .05,
              vertical: MediaQuery.of(context).size.height * .02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: primaryColor,
                width: MediaQuery.of(context).size.width * .005,
              ),
              image: const DecorationImage(
                image: AssetImage('images/onboard3.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                    MediaQuery.of(context).size.width * .01,
                    MediaQuery.of(context).size.height * .008,
                  ),
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 8,
                )
              ],
              color: mycolor,
              // shape: BoxShape.circle,
            ),
          ),
          IconButton(
            alignment: Alignment.topRight,
            onPressed: () {},
            iconSize: MediaQuery.of(context).size.width * .1,
            icon: const Icon(
              Icons.remove_circle,
              color: Color.fromARGB(255, 255, 147, 7),
            ),
          )
        ],
      ),
    );
  }
}
