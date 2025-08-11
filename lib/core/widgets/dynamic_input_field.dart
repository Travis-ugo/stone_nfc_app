import 'package:tag_play/core/widgets/core_widgets.dart';

class DynamicInputField<T extends Cubit<B>, B> extends StatelessWidget {
  final String? Function(B) errorState;
  final String hintText;
  final String? label;
  final void Function(String) onChanged;
  final T cubit;
  final bool Function(B previous, B current) buildWhen;
  final bool isPassword;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Widget? bottomLeftWidget;
  final List<TextInputFormatter>? inputFormatters;

  const DynamicInputField({
    super.key,
    required this.cubit,
    required this.buildWhen,
    required this.errorState,
    required this.hintText,
    this.label,
    required this.onChanged,
    this.isPassword = false,
    this.prefixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.bottomLeftWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, B>(
      bloc: cubit,
      buildWhen: buildWhen,
      builder: (context, state) {
        return TagPlayInputField(
          prefixIcon: prefixIcon,
          keyboardType: keyboardType,
          isPassword: isPassword,
          errorState: errorState(state),
          hintText: hintText,
          label: label,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          bottomLeftWidget: bottomLeftWidget,
        );
      },
    );
  }
}
