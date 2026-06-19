import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload user profile image
  Future<String?> uploadProfileImage(String userId, File imageFile) async {
    try {
      Reference ref = _storage.ref().child('users/$userId/profile.jpg');
      await ref.putFile(imageFile);
      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading profile image: $e');
      return null;
    }
  }

  // Upload listing images
  Future<List<String>> uploadListingImages(String listingId, List<File> imageFiles) async {
    try {
      List<String> downloadUrls = [];
      for (int i = 0; i < imageFiles.length; i++) {
        Reference ref = _storage.ref().child('listings/$listingId/image_$i.jpg');
        await ref.putFile(imageFiles[i]);
        String downloadUrl = await ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      }
      return downloadUrls;
    } catch (e) {
      print('Error uploading listing images: $e');
      return [];
    }
  }

  // Upload service images
  Future<List<String>> uploadServiceImages(String serviceId, List<File> imageFiles) async {
    try {
      List<String> downloadUrls = [];
      for (int i = 0; i < imageFiles.length; i++) {
        Reference ref = _storage.ref().child('services/$serviceId/image_$i.jpg');
        await ref.putFile(imageFiles[i]);
        String downloadUrl = await ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      }
      return downloadUrls;
    } catch (e) {
      print('Error uploading service images: $e');
      return [];
    }
  }

  // Delete file
  Future<void> deleteFile(String path) async {
    try {
      await _storage.ref(path).delete();
    } catch (e) {
      print('Error deleting file: $e');
    }
  }
}
