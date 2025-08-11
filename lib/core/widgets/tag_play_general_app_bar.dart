import 'package:tag_play/core/utils/utils.dart'; 

class TagPlayGeneralAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TagPlayGeneralAppBar({
    super.key,
    this.spacing = 0.0,
    required this.popPress,
    this.hasBorder = true,
    this.withConstraints = true,
    this.title,
    this.trailing,
    this.color = WhiteColors.white_50,
    this.iconcolor,
    this.padding,
    this.child,
    this.style,
    this.leadingIcon,
    this.expandedChild,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  final VoidCallback popPress;
  final String? title;
  final Widget? trailing;
  final Color color;
  final Color? iconcolor;
  final Widget? child;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment mainAxisAlignment;
  final bool withConstraints;
  final Widget? leadingIcon;
  final bool hasBorder;
  final double spacing;
  final Widget? expandedChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border:
            hasBorder
                ? Border(bottom: BorderSide(color: Color(0xFFF0F4F8)))
                : null,
      ),
      child: SafeArea(
        child: Padding(
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            spacing: spacing,
            mainAxisAlignment: mainAxisAlignment,
            children: [
              leadingIcon ??
                  Container(
                    constraints: BoxConstraints.tightFor(
                      width: 24.w,
                      height: 32.w,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(
                        'assets/icons/arrow-left-circle.svg',
                        height: 24.w,
                        color: iconcolor,
                      ),
                      onPressed: popPress,
                    ),
                  ),

              if (title != null)
                Text(
                  title ?? '',
                  style:
                      style ??
                      TextStyle(
                        fontSize: FontSize.base,
                        fontWeight: FontWeightMade.medium,
                        color: Color(0xFF1E293B),
                      ),
                ),
              if (expandedChild != null)
                Expanded(child: SizedBox(child: expandedChild)),
              if (child != null) SizedBox(child: child),
              if (trailing != null)
                Container(
                  constraints:
                      withConstraints
                          ? BoxConstraints.tightFor(width: 24.w, height: 32.w)
                          : null,
                  child: trailing,
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(90.h);
}
