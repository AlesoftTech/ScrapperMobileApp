import 'package:covid_scanner/vaccine_info_model.dart';
import 'package:get/get.dart';

import 'API.dart';

class InfoController extends GetxController{
  
  VaccineInfoModel vaccine; 
  bool loading = true; 
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  
  Future<void> fetchInfo(String url)async{
    try{
      loading= true;
      final resp = await API.instance.getHttp('/vaccines/?url=$url');
      vaccine = VaccineInfoModel.fromJson(resp);
      loading = false;
      update();
    }catch(e){
      Get.snackbar("Error", e.toString()); 
    }
  }
  
  
  
}