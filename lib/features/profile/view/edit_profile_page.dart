import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:storage_repository/storage_repository.dart';
import 'package:tag_play/core/core.dart';
import 'package:iconsax_linear/iconsax_linear.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  String? _photoUrl;
  String? _userId;
  String? _currentEmail;
  XFile? _pickedImage;
  bool _saving = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final params = GoRouterState.of(context).extra as Map<String, dynamic>?;
    _userId = params?['userId'] as String?;
    _nameController = TextEditingController(text: params?['currentName'] as String? ?? '');
    _photoUrl = params?['currentPhotoUrl'] as String?;
    _currentEmail = params?['currentEmail'] as String?;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pickedImage = picked;
      });
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    String? uploadedUrl = _photoUrl;
    if (_pickedImage != null) {
      try {
        final repo = context.read<StorageRepositoryImpl>();
        final refPath =
            'profile_images/${_userId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        uploadedUrl = await repo.storageDataSourceImpl.uploadFile(
          _pickedImage!.path,
          refPath,
        );
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to upload image: $e')));
        setState(() => _saving = false);
        return;
      }
    }
    final profile = UserProfileEntity(
      userId: _userId!,
      displayName: _nameController.text.trim(),
      email: _currentEmail,
      photoUrl: uploadedUrl,
      updatedAt: DateTime.now(),
    );
    final repo = context.read<StorageRepositoryImpl>();
    final result = await repo.saveUserProfile(profile: profile);
    setState(() => _saving = false);
    result.fold(
      (err) => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to save profile: $err'))),
      (ok) {
        Navigator.of(context).pop(true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: GreyColors.grey_400, fontWeight: FontWeightMade.semiBold)),
        backgroundColor: Colors.black,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: GreyColors.grey_400,),
        leading:
         IconButton(onPressed: () {
          context.pop();
        }, icon: SvgPicture.asset('assets/icons/arrow-left.svg', color: WhiteColors.white_100,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 54,
                      backgroundColor: Colors.grey[800],
                      child: _pickedImage != null
                          ? ClipOval(
                              child: Image.file(
                                File(_pickedImage!.path),
                                width: 108,
                                height: 108,
                                fit: BoxFit.cover,
                              ),
                            )
                          : (_photoUrl != null && _photoUrl!.isNotEmpty)
                              ? ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: _photoUrl!,
                                    width: 108,
                                    height: 108,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    (_currentEmail?.isNotEmpty ?? false)
                                        ? _currentEmail![0].toUpperCase()
                                        : 'U',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Theme.of(context).colorScheme.onBackground,
                                    ),
                                  ),
                                ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: GreyColors.grey_500,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          IconsaxLinear.edit,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Display Name',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Name required' : null,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                buttonTitle: 'Save',
                onTap: _saving ? null : _saveProfile,
                isFormValid: !_saving,
                filledColor: PrimaryColor.primary_500,
                textColor: Colors.white,
                fontSize: 18,
                borderRadius: 16,
                childWidget: _saving
                    ? const CircularProgressIndicator(color: Colors.white)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
