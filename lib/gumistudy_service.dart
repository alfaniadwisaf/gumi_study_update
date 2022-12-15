import 'package:dio/dio.dart';
import 'package:gumi_study/gumistudy.dart';

class GumiStudyService{
  static Future<List<GumiStudy>> getDataGumistudy() async{
    Response response = await Dio().get('http://localhost:3004/data');
    List<GumiStudy> gumistudy = (response.data as List).map((v) => GumiStudy.fromJson(v)).toList();
    return gumistudy;
  }

  static Future<List<GumiStudy>> getDataGumistudySave() async{
    Response response = await Dio().get('http://localhost:3004/data?isSave=true');
    List<GumiStudy> gumistudy = (response.data as List).map((v) => GumiStudy.fromJson(v)).toList();
    return gumistudy;
  }
}