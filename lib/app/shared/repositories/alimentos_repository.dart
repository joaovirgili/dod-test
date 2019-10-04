import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:dodvision/app/shared/constants.dart';
import 'package:dodvision/app/shared/models/alimento.dart';

class AlimentosRepository extends Disposable {
  var dioOptions = BaseOptions(connectTimeout: 5000, baseUrl: BASE_URL);

  Future<List<Alimento>> getAlimentos() async {
    try {
      Response response = await Dio(dioOptions).get(PATH_ALIMENTOS);
      return (response.data as List)
          .map((alimento) => new Alimento.fromJson(alimento))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}
