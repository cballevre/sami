import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ActionRecognitionTile extends StatelessWidget {

  final double _size;
  final String _iconAsset;
  final String _label;

  const ActionRecognitionTile({Key? key, required double size, required String iconAsset, required String label, }):
    _size = size,
    _iconAsset = iconAsset,
    _label = label,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: _size, height: _size, child: Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(_iconAsset),
          const SizedBox(height: 16),
          Text(_label,textAlign: TextAlign.center,)
        ],
      ),
    ));
  }
}
