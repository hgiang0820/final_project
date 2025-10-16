import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
// import 'package:supabase_flutter/supabase_flutter.dart' hide User;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  User? get user => FirebaseAuth.instance.currentUser;
  static const String userBucket = 'user_data';
  final SupabaseService _avatarStorageService = SupabaseService(
    bucket: userBucket,
  );

  bool _isEditing = false;
  bool _isLoading = true;

  // User data from Firestore
  Map<String, dynamic>? userData;

  // Controllers for editing
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (user != null) {
      try {
        DocumentSnapshot doc = await db
            .collection('users')
            .doc(user!.uid)
            .get();
        if (doc.exists) {
          setState(() {
            userData = doc.data() as Map<String, dynamic>;
            _initializeControllers();
            _isLoading = false;
          });
        }
        // else {
        //   // Nếu không có data trong Firestore, tạo document mới
        //   await _createUserDocument();
        // }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading profile: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _initializeControllers() {
    _fullNameController.text = userData?['fullName'] ?? '';
    _phoneController.text = userData?['phoneNumber'] ?? '';
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String _getInitials(String? name) {
    if (name == null || name.isEmpty) return 'U';
    List<String> names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  Future<void> _updateProfile() async {
    try {
      // Update Firestore
      await db.collection('users').doc(user!.uid).update({
        'fullName': _fullNameController.text.trim(),
        'phoneNumber': _phoneController.text.trim(),
        'updatedAt': FieldValue.serverTimestamp(),
        // 'avatarUrl': "",
      });

      // Update Firebase Auth display name
      await user?.updateDisplayName(_fullNameController.text.trim());
      await user?.reload();

      // Reload user data
      await _loadUserData();

      setState(() {
        _isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating profile: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'PROFILE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.purple[50],
          elevation: 1,
        ),
        body: const Center(
          child: CircularProgressIndicator(color: Colors.purple),
        ),
      );
    }

    final avatarUrl = (userData?['avatarUrl'] as String?) ?? user?.photoURL;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              if (_isEditing) {
                _updateProfile();
              } else {
                setState(() {
                  _isEditing = true;
                });
              }
            },
          ),
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                _initializeControllers();
                setState(() {
                  _isEditing = false;
                });
              },
            ),
        ],
      ),
      body: user == null
          ? const Center(child: Text('No user logged in'))
          : RefreshIndicator(
              onRefresh: _loadUserData,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 20),

                  // Profile Picture and Name
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.purple[100],
                              backgroundImage: avatarUrl != null
                                  ? NetworkImage(avatarUrl)
                                  : null,
                              child: avatarUrl == null
                                  ? Text(
                                      _getInitials(
                                        userData?['fullName'] ?? user?.email,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                      ),
                                    )
                                  : null,
                            ),
                            if (_isEditing)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.purple[300],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: IconButton(
                                    onPressed: () {
                                      _changeAvatar();
                                    },
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          userData?['fullName'] ?? 'User',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Account Information
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.purple[600],
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Account Information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Full Name
                          _buildProfileField(
                            'Full Name',
                            _isEditing
                                ? null
                                : (userData?['fullName'] ?? 'Not set'),
                            Icons.person,
                            _isEditing ? _fullNameController : null,
                          ),

                          const SizedBox(height: 16),

                          // Email
                          _buildProfileField(
                            'Email',
                            userData?['email'] ??
                                user?.email ??
                                'Not available',
                            Icons.email,
                            null, // Email không thể edit
                          ),

                          const SizedBox(height: 16),

                          // Phone Number
                          _buildProfileField(
                            'Phone Number',
                            _isEditing
                                ? null
                                : (userData?['phoneNumber'] ?? 'Not set'),
                            Icons.phone,
                            _isEditing ? _phoneController : null,
                          ),

                          const SizedBox(height: 16),

                          // User ID
                          _buildProfileField(
                            'User ID',
                            userData?['uid'] ?? user?.uid ?? 'Not available',
                            Icons.fingerprint,
                            null,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Account Actions
                  Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.security,
                            color: Colors.blue[600],
                          ),
                          title: const Text('Change Password'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () async {
                            if (user?.email != null) {
                              try {
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                      email: user!.email!,
                                    );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Password reset email sent'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error: ${e.toString()}'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: Icon(Icons.email, color: Colors.orange[600]),
                          title: const Text('Verify Email'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          enabled: user?.emailVerified != true,
                          onTap: user?.emailVerified == true
                              ? null
                              : () async {
                                  try {
                                    await user?.sendEmailVerification();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Verification email sent',
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Error: ${e.toString()}'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: Icon(
                            Icons.delete_forever,
                            color: Colors.red[600],
                          ),
                          title: const Text('Delete Account'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            _showDeleteAccountDialog();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileField(
    String label,
    String? value,
    IconData icon,
    TextEditingController? controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey[500]),
            const SizedBox(width: 12),
            Expanded(
              child: controller != null
                  ? TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    )
                  : Text(
                      value ?? 'Not available',
                      style: const TextStyle(fontSize: 16),
                    ),
            ),
          ],
        ),
      ],
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This will also delete all your data from our servers. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                // Xóa dữ liệu từ Firestore trước
                await db.collection('users').doc(user!.uid).delete();

                // Sau đó xóa user từ Firebase Auth
                await user?.delete();

                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/signin', (route) => false);
              } catch (e) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error deleting account: ${e.toString()}'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _changeAvatar() async {
    if (user == null) return;

    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
      imageQuality: 85,
    );

    if (pickedFile == null) {
      return;
    }

    bool dialogShown = false;

    try {
      if (!mounted) return;

      dialogShown = true;
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(
          child: CircularProgressIndicator(color: Colors.purple),
        ),
      );

      final fileExtension = p.extension(pickedFile.path).toLowerCase();
      final storagePath =
          '${user!.uid}/avatar/avatar_${DateTime.now().millisecondsSinceEpoch}$fileExtension';

      // final previousStoragePath = userData?['avatarStoragePath'] as String?;
      // if (previousStoragePath != null &&
      //     previousStoragePath.isNotEmpty &&
      //     previousStoragePath != storagePath) {
      //   try {
      //     await Supabase.instance.client.storage.from(userBucket).remove([
      //       previousStoragePath,
      //     ]);
      //   } catch (_) {}
      // }

      final publicUrl = await _avatarStorageService.uploadAndGetPublicUrl(
        localPath: pickedFile.path,
        storagePath: storagePath,
      );

      // final cacheBuster = DateTime.now().millisecondsSinceEpoch;
      // final displayUrl = '$publicUrl?cb=$cacheBuster';

      if (!mounted) return;

      setState(() {
        userData = {
          ...?userData,
          'avatarUrl': publicUrl,
          // 'avatarStoragePath': storagePath,
        };
      });

      await db.collection('users').doc(user!.uid).set({
        'avatarUrl': publicUrl,
        // 'avatarStoragePath': storagePath,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      try {
        await user?.updatePhotoURL(publicUrl);
        await FirebaseAuth.instance.currentUser?.reload();
      } catch (_) {}

      if (!mounted) return;

      if (dialogShown) {
        Navigator.of(context, rootNavigator: true).pop();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Avatar is updated successfully.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      if (dialogShown && mounted) {
        Navigator.of(context, rootNavigator: true).maybePop();
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cannot update avatar: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
