import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:flutter/material.dart';

class ClaimBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mercury,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            Claim.values.length,
            (i) => Container(
              width: double.infinity,
              child: RawMaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                splashColor: AppColors.dodgerBlue,
                child: Text(
                  Claim.values[i].name().toUpperCase(),
                ),
                onPressed: () => Navigator.pop(context, Claim.values[i]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum Claim {
  adult,
  harm,
  bully,
  spam,
  copyright,
  hate,
}

extension ClaimExtension on Claim {
  String name() => this.toString().split('.')[1];
}
