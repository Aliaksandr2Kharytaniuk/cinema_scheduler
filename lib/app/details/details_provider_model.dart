import 'package:flutter/cupertino.dart';

class DetailsProviderModel with ChangeNotifier {
  DetailsProviderModel() {
    _loadOverviewDetails();
  }

  Future<void> _loadOverviewDetails() async {
    notifyListeners();
  }
}