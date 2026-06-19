import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/listing_model.dart';
import '../models/service_model.dart';
import '../config/app_constants.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Listings
  Future<void> addListing(ListingModel listing) async {
    try {
      await _firestore
          .collection(AppConstants.listingsCollection)
          .doc(listing.id)
          .set(listing.toJson());
    } catch (e) {
      print('Error adding listing: $e');
      rethrow;
    }
  }

  Future<List<ListingModel>> getVerifiedListings() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(AppConstants.listingsCollection)
          .where('is_verified', isEqualTo: true)
          .orderBy('created_at', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => ListingModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting listings: $e');
      return [];
    }
  }

  Future<List<ListingModel>> getLandlordListings(String landlordId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(AppConstants.listingsCollection)
          .where('owner_id', isEqualTo: landlordId)
          .orderBy('created_at', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => ListingModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting landlord listings: $e');
      return [];
    }
  }

  // Services
  Future<void> addService(ServiceModel service) async {
    try {
      await _firestore
          .collection(AppConstants.servicesCollection)
          .doc(service.id)
          .set(service.toJson());
    } catch (e) {
      print('Error adding service: $e');
      rethrow;
    }
  }

  Future<List<ServiceModel>> getVerifiedServices() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(AppConstants.servicesCollection)
          .where('is_verified', isEqualTo: true)
          .orderBy('rating', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => ServiceModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting services: $e');
      return [];
    }
  }

  Future<List<ServiceModel>> getServicesByCategory(String category) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(AppConstants.servicesCollection)
          .where('category', isEqualTo: category)
          .where('is_verified', isEqualTo: true)
          .get();

      return snapshot.docs
          .map((doc) => ServiceModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting services by category: $e');
      return [];
    }
  }
}
