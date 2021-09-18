part of '../screen/page.dart';

Color accentColor = Color(0xFF1A237E);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  primary: Colors.white,
  minimumSize: Size(88, 44),
  // padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  backgroundColor: Colors.blue,
);

final ButtonStyle borderButtonStyle = TextButton.styleFrom(
  primary: Colors.black45,
  minimumSize: Size(88, 44),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Color(0xFFFCCCBC), width: 1),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

class ImgStyle extends StatelessWidget {
  const ImgStyle({
    Key? key,
    this.url,
    this.radius,
    this.height,
    this.width,
  }) : super(key: key);

  final String? url;
  final double? radius, width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(radius!),
        ),
        child: CachedNetworkImage(
          imageUrl: url!,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}

final ButtonStyle borderButtonStylePrimary = TextButton.styleFrom(
  primary: Colors.black45,
  minimumSize: Size(88, 44),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Color(0xFF5EE1F1), width: 1),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

var spinDancing = SpinKitThreeBounce(
  color: accentColor,
  size: 30.0,
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Text(
        value!,
        style: TextStyle(fontSize: size, fontWeight: weight, color: color),
      ),
    );
  }
}
