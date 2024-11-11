import 'package:dio/dio.dart';
import 'package:laundry_apps/service/api_client.dart';
import '../model/on_progress.dart';

class OnProgress {
  Future<List<Onprogress>> listData() async {
    final Response response = await ApiClient().get('onProgress');
    final List data = response.data as List;
    List<Onprogress> result =
        data.map((json) => Onprogress.fromJson(json)).toList();
    return result;
  }

  Future<Onprogress> simpan(Onprogress onprogress) async {
    var data = onprogress.toJson();
    final Response response = await ApiClient().post('onProgress', data);
    Onprogress result = Onprogress.fromJson(response.data);
    return result;
  }

  Future<Onprogress> ubah(Onprogress onprogress, String id) async {
    var data = onprogress.toJson();
    final Response response = await ApiClient().put('onProgress/$id', data);
    Onprogress result = Onprogress.fromJson(response.data);
    return result;
  }

  Future<Onprogress> getById(String id) async {
    final Response response = await ApiClient().get('onProgress/$id');
    Onprogress result = Onprogress.fromJson(response.data);
    return result;
  }

  Future<Onprogress> hapus(Onprogress onprogress) async {
    final Response response =
        await ApiClient().delete('onProgress/${onprogress.id}');
    Onprogress result = Onprogress.fromJson(response.data);
    return result;
  }
}
