import 'package:flutter/material.dart';
import 'package:sami/utils/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  final Size preferredSize;
  final String? _title;

  CustomAppBar({Key? key, String? title}) : preferredSize = const Size.fromHeight(50.0), _title=title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _title != null ? Text('title') : SvgPicture.asset(
        height: 50,
        fit: BoxFit.fitHeight,
        'assets/logo.svg',
        color: Colors.white,
      ),
      backgroundColor: Palette.primary.shade500,
      centerTitle: true,
    );
  }
}
