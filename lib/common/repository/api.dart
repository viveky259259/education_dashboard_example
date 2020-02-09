import 'package:dio/dio.dart';
import 'package:education_dashboard_example/common/model/vendor.model.dart';
import 'package:education_dashboard_example/common/strings.dart';

class CommonApi {
  Future<List<VendorModel>> getVendorsBySchoolId(String schoolId) async {
    try {
      Response response = await Dio().get(
          CommonStrings.ApiBaseUrl + CommonStrings.VendorApi + "$schoolId");
      print(response.data);
      if (response.data["vendor"].length > 0) {
        print(response.data["vendor"][0]);
        List<VendorModel> vendors=List();
        for (var each in response.data["vendor"]) {
          vendors.add(VendorModel.fromJson(each));
        }
        return vendors;
      }
    } catch (e) {
      // if there is any error return null values with errors
      return null;
    }
    //if nothing happened return null;
    return null;
  }
}
