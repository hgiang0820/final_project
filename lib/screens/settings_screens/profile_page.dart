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
            content: Text('Lỗi tải hồ sơ người dùng: ${e.toString()}'),
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
          content: Text('Cập nhật hồ sơ thành công.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi cập nhật hồ sơ: ${e.toString()}'),
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
            'Hồ sơ cá nhân',
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
          'Hồ sơ cá nhân',
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
          ? const Center(child: Text('Bạn cần đăng nhập để xem hồ sơ cá nhân.'))
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
                          userData?['fullName'] ?? 'Người dùng',
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
                                'Thông tin tài khoản',
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
                            'Họ và tên',
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
                            'Số điện thoại',
                            _isEditing
                                ? null
                                : (userData?['phoneNumber'] ?? 'Not set'),
                            Icons.phone,
                            _isEditing ? _phoneController : null,
                          ),

                          const SizedBox(height: 16),

                          // User ID
                          _buildProfileField(
                            'Mã người dùng',
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
                          title: const Text('Đổi mật khẩu'),
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
                                    content: Text(
                                      'Email đổi mật khẩu đã được gửi',
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
                            }
                          },
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: Icon(Icons.email, color: Colors.orange[600]),
                          title: const Text('Xác minh email'),
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
                                          'Email xác minh đã được gửi',
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
                          title: const Text('Xoá tài khoản'),
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
        title: const Text('Xoá tài khoản'),
        content: const Text(
          'Bạn có chắc chắn muốn xoá tài khoản của mình? Hành động này không thể hoàn tác.',
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

      final publicUrl = await _avatarStorageService.uploadAndGetPublicUrl(
        localPath: pickedFile.path,
        storagePath: storagePath,
      );

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
          content: Text('Avatar đã được cập nhật thành công.'),
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
            content: Text('Không thể cập nhật avatar: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
