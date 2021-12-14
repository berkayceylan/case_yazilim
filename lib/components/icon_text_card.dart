import 'package:flutter/material.dart';
import 'package:flutter_project/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconTextCard extends StatelessWidget {
  final String? text;
  final IconData? icon;
  const IconTextCard({Key? key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon!,
                color: Colors.white,
                size: 50,
              ),
              const SizedBox(height: 10,),
              Text(
                text!,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          height: 150,
          decoration: BoxDecoration(
            // color: kLightLogoColor,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF3a7bd5), Color(0xFF16BFFD)]
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
