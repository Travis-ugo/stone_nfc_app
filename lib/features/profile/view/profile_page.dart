import 'package:tag_play/presentation/app/bloc/app_bloc.dart';
import '../../../core/core.dart';
import '../bloc/profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          color: Theme.of(context).colorScheme.onBackground,
          height: 70,
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(8.0),
          child: SizedBox(),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.status == ProfileStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == ProfileStatus.loaded) {
          final profile = state.profile;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ProfileAvatar(
                  name:
                      profile.displayName ?? user.name ?? user.email ?? 'User',
                  email: profile.email ?? user.email ?? '',
                  profileImage: profile.photoUrl ?? user.photo,
                ),
                const SizedBox(height: 24),
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,

                            color: GreyColors.grey_100,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow(
                          context,
                          'Display Name',
                          profile.displayName ?? '-',
                        ),
                        _buildInfoRow(context, 'Email', profile.email ?? '-'),
                        _buildInfoRow(
                          context,
                          'Phone',
                          profile.phoneNumber ?? '- - - - - - - -',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const ProfileActions(),
              ],
            ),
          );
        } else if (state.status == ProfileStatus.error) {
          return Center(
            child: Text(
              'Error: \\${state.message}',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeightMade.regular,
              color: GreyColors.grey_200,
              fontSize: FontSize.sm,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeightMade.medium,
              color: GreyColors.grey_500,
              fontSize: FontSize.sm,
            ),
          ),
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
          (profileImage != null && profileImage!.isNotEmpty)
              ? CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: null,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: profileImage!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Text(
                    email.isNotEmpty ? email[0].toUpperCase() : 'U',
                    style: const TextStyle(fontSize: 40, color: Colors.grey),
                  ),
                ),
          const SizedBox(height: 16),
          Text(
            name,
            style: TextStyle(
              fontSize: FontSize.xl,
              fontWeight: FontWeightMade.bold,
              color: GreyColors.grey_100,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: TextStyle(
              fontSize: FontSize.base,
              color: GreyColors.grey_400,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildActionTile(
              context,
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {
                context.pushNamed(
                  'edit_profile',
                  extra: {
                    'userId':state.profile.userId,
                    'currentName': state.profile.displayName,
                    'currentPhotoUrl': state.profile.photoUrl,
                    'currentEmail': state.profile.email,
                  },
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
      },
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
      color: GreyColors.grey_50,
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
