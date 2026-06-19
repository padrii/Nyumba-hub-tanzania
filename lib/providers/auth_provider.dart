import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;
  bool _isLoading = false;
  String? _error;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  // Register
  Future<bool> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String role,
    required String location,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      UserModel? registeredUser = await _authService.registerUser(
        email: email,
        password: password,
        name: name,
        phone: phone,
        role: role,
        location: location,
      );

      if (registeredUser != null) {
        _user = registeredUser;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = 'Registration failed';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Login
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      UserModel? loggedInUser = await _authService.loginUser(
        email: email,
        password: password,
      );

      if (loggedInUser != null) {
        _user = loggedInUser;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = 'Login failed';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Get current user
  Future<void> getCurrentUser() async {
    _isLoading = true;
    notifyListeners();

    try {
      UserModel? currentUser = await _authService.getCurrentUser();
      _user = currentUser;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Logout
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.logout();
      _user = null;
      _error = null;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
