import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:politicando/app/core/errors/app_error.dart';
import 'package:politicando/app/core/errors/connection_exception.dart';
import 'package:politicando/app/core/models/detailed_politician/detailed_politician_model.dart';

import './app_controller.dart';
import '../models/politician_search_model.dart';
import '../repositories/politicians_repository_interface.dart';

class PoliticiansController extends ChangeNotifier with AppController {
  final PoliticiansRepositoryInterface _politiciansRepository;
  PoliticiansController(PoliticiansRepositoryInterface politiciansRepository)
    : _politiciansRepository = politiciansRepository;
  
  List<PoliticianSearchModel> _politicians = [];
  UnmodifiableListView<PoliticianSearchModel> get politicians => UnmodifiableListView(_politicians);

  Future<void> searchPoliticians(String search) async {
    try {
      state = AppState.loading;
      notifyListeners();
      _politicians = await _politiciansRepository.searchPoliticians(search);
      state = AppState.state;
    } on ConnectionException catch (e) {
      state = AppState.error;
      error = e.message;
    } catch (e) {
      state = AppState.error;
      error = e.toString();
    }
    notifyListeners();
  }

  Future<DetailedPoliticianModel> getDetailedPolitician(int politicianId) {
    return _politiciansRepository.getDetailedPolitician(politicianId);
  }

  void clearPoliticiansList() {
    _politicians.clear();
  }
}