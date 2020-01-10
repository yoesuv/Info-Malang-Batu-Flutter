import 'package:dio/dio.dart';
import '../services/api_base.dart';

class Service {

    ApiBase apiBase = ApiBase();

    Future<Response> getListPlace() async {
        return await apiBase.get('/List_place_malang_batu.json');
    }

    Future<Response> getListPlaceKabMalang() async {
        return await apiBase.get('/List_place_kab_malang.json');
    }

    Future<Response> getListPlaceKotaMalang() async {
        return await apiBase.get('/List_place_kota_malang.json');
    }

    Future<Response> getListPlaceKotaBatu() async {
        return await apiBase.get('/List_place_kota_batu.json');
    }

    Future<Response> getListGallery() async {
        return await apiBase.get('/Gallery_Malang_Batu.json');
    }

    Future<Response> getMapsPin() async {
        return await apiBase.get('/Maps_Malang_Batu.json');
    }

}
