import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../services/firestore_service.dart';

class ServiceProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<ServiceModel> _services = [];
  List<ServiceModel> _categoryServices = [];
  bool _isLoading = false;
  String? _error;

  List<ServiceModel> get services => _services;
  List<ServiceModel> get categoryServices => _categoryServices;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get verified services
  Future<void> getVerifiedServices() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _services = await _firestoreService.getVerifiedServices();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get services by category
  Future<void> getServicesByCategory(String category) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _categoryServices = await _firestoreService.getServicesByCategory(category);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add service
  Future<bool> addService(ServiceModel service) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _firestoreService.addService(service);
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
