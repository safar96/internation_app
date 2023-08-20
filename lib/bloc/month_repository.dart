import 'package:dio/dio.dart';
import 'package:internation_app/model/month.dart';
import 'package:internation_app/model/types.dart';

class MonthRepository {
  final Dio _dio = Dio();
  final String _urlMonth = 'https://www.jsonkeeper.com/b/92TT';
  final String _urlTypes = 'https://www.jsonkeeper.com/b/I86U';

  Future<Month> getMonth(int month,int year) async {
    print(month);
    print(year);
    try {
      Response response = await _dio.get(_urlMonth);
      if(response.statusCode == 200){
        return Month.fromJson(response.data);
      }else{
       return Month(month: "0", year: 0, days: []);
      }
    } catch (error) {
      return Month(month: "0", year: 0, days: []);
    }
  }

  Future<List<Types>> getTypes() async {
    try {
      Response response = await _dio.get(_urlTypes);
      if(response.statusCode == 200){
        Iterable list = response.data;
        List<Types> listType = list.map((model) => Types.fromJson(model)).toList();
        return listType;
      }else{
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
