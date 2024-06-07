import 'package:chat_app/services/auth/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class StoregeServices {
  final FirebaseStorage _storegeRef = FirebaseStorage.instance;
  final AuthService _auth = AuthService();

  Future<void> uploadProfilePic() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final imageByteFormat = await pickedFile.readAsBytes();
    final imageRef = _storegeRef
        .ref()
        .child("${_auth.getCurrentUser()!.uid}/ProfilePic.jpg");
    await imageRef.putData(imageByteFormat);
  }

  Future<Uint8List?> getProfilePic(String uid) async {
    final imageRef = _storegeRef.ref().child("$uid/ProfilePic.jpg");
    final Uint8List? image = await imageRef.getData();

    try {
      return image;
    } catch (e) {
      print('Failed to get profile picture for uid $uid: $e');
      return null;
    }
  }
}
