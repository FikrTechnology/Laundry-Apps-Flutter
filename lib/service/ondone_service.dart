import 'package:dio/dio.dart';
import 'package:laundry_apps/service/api_client.dart';
import '../model/on_done.dart';

class OnDone {
  Future<List<Ondone>> listData() async {
    final Response response = await ApiClient().get('Ondone');
    final List data = response.data as List;
    List<Ondone> result =
        data.map((json) => Ondone.fromJson(json)).toList();
    return result;
  }

  Future<Ondone> simpan(Ondone ondone) async {
    var data = ondone.toJson();
    final Response response = await ApiClient().post('Ondone', data);
    Ondone result = Ondone.fromJson(response.data);
    return result;
  }

  Future<Ondone> ubah(Ondone ondone, String id) async {
    var data = ondone.toJson();
    final Response response = await ApiClient().put('Ondone/$id', data);
    Ondone result = Ondone.fromJson(response.data);
    return result;
  }

  Future<Ondone> getById(String id) async {
    final Response response = await ApiClient().get('Ondone/$id');
    Ondone result = Ondone.fromJson(response.data);
    return result;
  }

  Future<Ondone> hapus(Ondone ondone) async {
    final Response response =
        await ApiClient().delete('Ondone/${ondone.id}');
    Ondone result = Ondone.fromJson(response.data);
    return result;
  }
}
