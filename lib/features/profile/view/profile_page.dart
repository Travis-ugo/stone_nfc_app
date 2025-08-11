import 'package:cached_network_image/cached_network_image.dart';
import 'package:storage_repository/storage_repository.dart';
import 'package:tag_play/presentation/app/bloc/app_bloc.dart';
import '../../../core/core.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings coming soon')),
              );
            },
          ),
        ],
      ),
      body: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  /// {@macro profile_view}
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ProfileAvatar(
            name: user.name ?? user.email ?? 'User',
            email: user.email ?? '',
            profileImage: user.photo,
          ),
          const SizedBox(height: 24),
          ProfileInfo(userId: user.id),
          const SizedBox(height: 32),
          const ProfileActions(),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.name,
    required this.email,
    this.profileImage,
  });
  final String name;
  final String email;
  final String? profileImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          profileImage != null
              ? CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: null,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: profileImage!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Icon(
                        Icons.person_outline,
                        size: 50,
                        color: Colors.grey,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        size: 50,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, size: 50, color: Colors.grey),
                ),

          const SizedBox(height: 16),
          Text(
            name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(email, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
        ],
      ),
    );
  }
}

/// {@template profile_info}
/// Widget that displays user profile information
/// {@endtemplate}
class ProfileInfo extends StatelessWidget {
  /// {@macro profile_info}
  const ProfileInfo({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserProfileEntity?>(
      future: context
          .read<StorageRepositoryImpl>()
          .getUserProfile(userId: userId)
          .then((e) => e.getOrElse(() => null)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final profile = snapshot.data;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildInfoRow('Display Name', profile?.displayName ?? '-'),
                _buildInfoRow('Email', profile?.email ?? '-'),
                _buildInfoRow('Phone', profile?.phoneNumber ?? '-'),
                _buildInfoRow(
                  'Member Since',
                  profile?.createdAt != null
                      ? _formatDate(profile!.createdAt!)
                      : '-',
                ),
                _buildInfoRow(
                  'Last Login',
                  profile?.lastLoginAt != null
                      ? _formatDate(profile!.lastLoginAt!)
                      : '-',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

/// {@template profile_actions}
/// Widget that displays profile action buttons
/// {@endtemplate}
class ProfileActions extends StatelessWidget {
  /// {@macro profile_actions}
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildActionTile(
          context,
          icon: Icons.edit,
          title: 'Edit Profile',
          onTap: () {
            // TODO: Navigate to edit profile
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Edit profile coming soon')),
            );
          },
        ),
        _buildActionTile(
          context,
          icon: Icons.notifications,
          title: 'Notifications',
          onTap: () {
            // TODO: Navigate to notifications
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Notifications coming soon')),
            );
          },
        ),
        _buildActionTile(
          context,
          icon: Icons.help,
          title: 'Help & Support',
          onTap: () {
            // TODO: Navigate to help
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Help & support coming soon')),
            );
          },
        ),
        const SizedBox(height: 16),
        _buildActionTile(
          context,
          icon: Icons.logout,
          title: 'Sign Out',
          isDestructive: true,
          onTap: () {
            _showSignOutDialog(context);
          },
        ),
      ],
    );
  }

  Widget _buildActionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: isDestructive ? Colors.red : null),
        title: Text(
          title,
          style: TextStyle(color: isDestructive ? Colors.red : null),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<AppBloc>().add(AppLogoutPressed());
            },
            child: const Text('Sign Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
