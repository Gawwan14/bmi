import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon,required this.onPressed});
  final IconData icon ;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
      child: Icon(icon),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape:CircleBorder(),
      fillColor: Color(0xFFC4F5E),
    );
  }
}
