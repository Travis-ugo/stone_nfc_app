import 'package:tag_play/core/core.dart';
import 'package:tag_play/core/widgets/core_widgets.dart';
import 'package:tag_play/features/home/bloc/home_bloc.dart';

class TokenManualPage extends StatefulWidget {
  const TokenManualPage({super.key});

  @override
  State<TokenManualPage> createState() => _TokenManualPageState();
}

class _TokenManualPageState extends State<TokenManualPage> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _submitting = false;
  bool _isValidLength = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _isValidLength = _controller.text.trim().length == 10;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _submitting = true);
    final token = _controller.text.trim();
    context.read<HomeBloc>().add(HomeVideosRequested(nfcToken: token));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == HomeStatus.failure && state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Enter NFC Token')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Paste or type the NFC token to fetch the video.'),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _controller,
                  maxLength: 10, // Prevent more than 10 characters
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      return newValue.copyWith(
                        text: newValue.text.toUpperCase(),
                        selection: newValue.selection,
                      );
                    }),
                  ],

                  decoration: InputDecoration(
                    labelText: 'NFC Token',
                    // border: OutlineInputBorder(),
                    counterText: "", // Hide counter under
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16).w,
                      borderSide: const BorderSide(
                        color: RedColors.red_500,
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16).w,
                      borderSide: const BorderSide(
                        color: GreyColors.grey_400,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16).w,
                      borderSide: const BorderSide(
                        color: GreyColors.grey_400,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16).w,
                      borderSide: const BorderSide(
                        color: GreyColors.grey_400,
                        width: 1,
                      ),
                    ),
                  ),

                  textInputAction: TextInputAction.done,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Token is required';
                    }
                    if (v.trim().length < 10) {
                      return 'Token must be exactly 10 characters';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) => _submit(),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        onTap: state.status == HomeStatus.loading
                            ? null
                            : _submit,
                        buttonTitle: state.status == HomeStatus.loading
                            ? 'Submitting…'
                            : 'Continue',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
