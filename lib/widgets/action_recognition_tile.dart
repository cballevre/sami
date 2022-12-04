import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ActionRecognitionTile extends StatelessWidget {

  final double _size;
  final String _iconAsset;
  final String _label;
  final  Function()? _onPressed;

  const ActionRecognitionTile({Key? key, required double size, required String iconAsset, required String label, Function()? onPressed }):
    _size = size,
    _iconAsset = iconAsset,
    _label = label, _onPressed=onPressed,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

        onTap: _onPressed,
        child:SizedBox(width: _size, height: _size, child: Card(
      elevation: 4,
      child:
        Padding(padding: EdgeInsets.all(8),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(_iconAsset),
          const SizedBox(height: 16),
          Text(_label,textAlign: TextAlign.center,)
        ],
      )),
    )));
  }
}
