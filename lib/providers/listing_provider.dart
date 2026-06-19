import 'package:flutter/material.dart';
import '../models/listing_model.dart';
import '../services/firestore_service.dart';

class ListingProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<ListingModel> _listings = [];
  List<ListingModel> _landlordListings = [];
  bool _isLoading = false;
  String? _error;

  List<ListingModel> get listings => _listings;
  List<ListingModel> get landlordListings => _landlordListings;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get verified listings
  Future<void> getVerifiedListings() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _listings = await _firestoreService.getVerifiedListings();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get landlord listings
  Future<void> getLandlordListings(String landlordId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _landlordListings = await _firestoreService.getLandlordListings(landlordId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add listing
  Future<bool> addListing(ListingModel listing) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _firestoreService.addListing(listing);
      _landlordListings.add(listing);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
