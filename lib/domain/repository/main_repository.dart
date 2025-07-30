import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../data/api/main_api.dart';

@Injectable()
class MainRepository {
  final MainApi _mainApi;
  MainRepository(this._mainApi);

}
