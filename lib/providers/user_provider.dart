import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String? _firstName;
  String? _lastName;
  String? _phone;
  bool _cguApproved = false;
  String? _simId;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phone => _phone;
  bool get cguApproved => _cguApproved;
  String? get simId => _simId;

  UserProvider() {
    loadUserData(); // Charger les données de l'utilisateur au démarrage
  }

  // Méthode pour définir et sauvegarder le prénom
  Future<void> setFirstName(String firstName) async {
    _firstName = firstName;
    notifyListeners();
    await saveFirstName(); // Sauvegarder en local
  }

  // Méthode pour sauvegarder le prénom dans SharedPreferences
  Future<void> saveFirstName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', _firstName ?? '');
  }

  // Méthode pour définir et sauvegarder le nom
  Future<void> setLastName(String lastName) async {
    _lastName = lastName;
    notifyListeners();
    await saveLastName(); // Sauvegarder en local
  }

  // Méthode pour sauvegarder le nom dans SharedPreferences
  Future<void> saveLastName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastName', _lastName ?? '');
  }

  // Méthode pour définir et sauvegarder le téléphone
  Future<void> setPhone(String phone) async {
    _phone = phone;
    notifyListeners();
    await savePhone(); // Sauvegarder en local
  }

  // Méthode pour sauvegarder le téléphone dans SharedPreferences
  Future<void> savePhone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', _phone ?? '');
  }

  // Méthode pour définir et sauvegarder l'approbation des CGU
  Future<void> setCguApproved(bool approved) async {
    _cguApproved = approved;
    notifyListeners();
    await saveCguApproved(); // Sauvegarder en local
  }

  // Méthode pour sauvegarder l'approbation des CGU dans SharedPreferences
  Future<void> saveCguApproved() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('cguApproved', _cguApproved);
  }

  // Méthode pour définir et sauvegarder le SIM ID
  Future<void> setSimId(String simId) async {
    _simId = simId;
    notifyListeners();
    await saveSimId(); // Sauvegarder en local
  }

  // Méthode pour sauvegarder le SIM ID dans SharedPreferences
  Future<void> saveSimId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('simId', _simId ?? '');
  }

  // Méthode pour charger toutes les données utilisateur depuis SharedPreferences
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _firstName = prefs.getString('firstName');
    _lastName = prefs.getString('lastName');
    _phone = prefs.getString('phone');
    _cguApproved = prefs.getBool('cguApproved') ?? false;
    _simId = prefs.getString('simId');
    notifyListeners();
  }
}
