import 'package:flutter/material.dart';

class Validation {
  static FormFieldValidator<String> validateEmail(String email) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Email cannot be empty';
      }
      // Add more validation logic here (e.g., regex for email format)
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (!emailRegex.hasMatch(value)) {
        return 'Enter a valid email address';
      }
      return null; // Return null if validation passes
    };
  }

  static FormFieldValidator<String> validatePassword(String password) {
    return (password) {
      if (password == null || password.isEmpty) {
        return 'Please enter your password';
      }
      if (password.length < 6) {
        return 'Password must be at least 6 characters';
      }
      return null; // Return null if validation passes
    };
  }
}
