part of '../screen/page.dart';

Color accentColor = Color(0xFFFCCCBC);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  primary: Colors.white,
  minimumSize: Size(88, 44),
  // padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  backgroundColor: Colors.black38,
);

final ButtonStyle borderButtonStyle = TextButton.styleFrom(
  primary: Colors.black45,
  minimumSize: Size(88, 44),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Color(0xFFFCCCBC), width: 1),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
final ButtonStyle borderButtonStylePrimary = TextButton.styleFrom(
  primary: Colors.black45,
  minimumSize: Size(88, 44),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Color(0xFF5EE1F1), width: 1),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

class TextStyles extends StatelessWidget {
  const TextStyles({
    this.color,
    this.size,
    this.value,
    this.weight,
    Key? key,
  }) : super(key: key);
  final String? value;
  final Color? color;
  final double? size;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      value!,
      style: TextStyle(fontSize: size, fontWeight: weight),
    );
  }
}
