import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tag_play/core/core.dart';
import 'package:tag_play/core/services/nfc_service.dart';

class NfcWritePage extends StatefulWidget {
  const NfcWritePage({super.key, required this.token});
  final String token;

  @override
  State<NfcWritePage> createState() => _NfcWritePageState();
}

class _NfcWritePageState extends State<NfcWritePage> {
  bool _isWriting = false;

  Future<void> _write() async {
    if (_isWriting) return;
    setState(() => _isWriting = true);
    try {
      final ok = await NfcService().writeNfcTag(widget.token);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            ok ? 'Token written to NFC tag' : 'Failed to write token',
          ),
        ),
      );
      if (ok) context.go('/home');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('NFC write failed: $e')));
    } finally {
      if (mounted) setState(() => _isWriting = false);
    }
  }

  void _skip() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Write NFC Token',
          style: TextStyle(fontSize: FontSize.xl, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpaceWidget(height: 30.h),
              Text(
                'Ready to write this token\nto an NFC tag:',
                style: TextStyle(
                  fontSize: FontSize.sm,
                  fontWeight: FontWeightMade.regular,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.token,
                style: TextStyle(
                  fontSize: FontSize.x4l,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(PrimaryColor.primary_500),
                        elevation: WidgetStateProperty.all(0),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                      onPressed: _isWriting ? null : _write,
                      icon: const Icon(Icons.nfc, color: Colors.white),
                      label: Text(
                        _isWriting ? 'Writing…' : 'Write to NFC',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        side: WidgetStateProperty.all(
                          const BorderSide(color: PrimaryColor.primary_500),
                        ),
                        foregroundColor: WidgetStateProperty.all(PrimaryColor.primary_500),
                      ),
                      onPressed: _isWriting ? null : _skip,
                      child: const Text('Skip'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
