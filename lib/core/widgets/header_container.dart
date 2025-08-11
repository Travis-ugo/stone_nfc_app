import 'package:tag_play/core/utils/utils.dart'; 

class HeaderContainer extends StatelessWidget implements PreferredSizeWidget {
  const HeaderContainer({
    super.key,
    this.color,
    this.padding,
    required this.child,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    bool isTablet = DeviceUtils.isTablet(context);
    return Container(
      decoration: BoxDecoration(
        color: WhiteColors.white_50,
        border: isTablet
            ? null
            : const Border(
                top: BorderSide(
                  color: GreyColors.grey_50,
                ),
              ),
        boxShadow: [
          BoxShadow(
            color: color ?? GreyColors.grey_100.withOpacity(0.9),
            spreadRadius: -4,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: child,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(isLargeScreen ? 90.w : 80.h);
}
