import 'package:get/get.dart';
import 'package:mindvector/app/modules/home/company_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateCompanyController extends GetxController {
  //TODO: Implement CreateCompanyController
  SupabaseClient client = Supabase.instance.client;

  final count = 0.obs;

  Future<void> createCompany(Company company) async {
    try {
      final data = company.toJson();
      data.remove('id');
      await client.from("company").insert(data);
    } catch (e) {
      print('Error: ${e}');
    }
  }
}
