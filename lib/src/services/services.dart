import '../services/api_base.dart';

class Service {

    ApiBase apiBase = ApiBase();

    Future<dynamic> getListPlace() async {
        return await apiBase.get('/List_place_malang_batu.json');
    }

    Future<dynamic> getListPlaceKabMalang() async {
        return await apiBase.get('/List_place_kab_malang.json');
    }

    Future<dynamic> getListPlaceKotaMalang() async {
        return await apiBase.get('/List_place_kota_malang.json');
    }

    Future<dynamic> getListPlaceKotaBatu() async {
        return await apiBase.get('/List_place_kota_batu.json');
    }

    Future<dynamic> getListGallery() async {
        return await apiBase.get('/Gallery_Malang_Batu.json');
    }

    Future<dynamic> getMapsPin() async {
        return await apiBase.get('/Maps_Malang_Batu.json');
    }

}
