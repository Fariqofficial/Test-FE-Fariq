part of '../test_02_show_json_data.dart';

class _CircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final Color? color;
  const _CircleButton({this.onTap, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Colors.grey[350],
        ),
        child: Icon(icon, size: 25, color: Colors.teal[200]),
      ),
    );
  }
}
