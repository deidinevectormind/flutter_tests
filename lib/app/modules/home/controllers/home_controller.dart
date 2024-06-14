import 'package:get/get.dart';
import 'package:mindvector/app/modules/home/company_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  RxList<Company> allCompanies = <Company>[].obs;
  SupabaseClient client = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    getAllCompanies();
  }

  Future<void> getAllCompanies() async {
    final companyData = await client.from("company").select();

    final companies =
        (companyData as List).map((json) => Company.fromJson(json)).toList();
    allCompanies.assignAll(companies);
  }

  Future<void> createCompany(Company company) async {
    try {
      final data = company.toJson();
      data.remove('id');
      final response = await client.from("company").insert(data);
      getAllCompanies();
    } catch (e) {
      print('Error: ${e}');
    }
  }

  Future<void> updateCompany(Company company) async {
    try {
      final response = await client
          .from("company")
          .update(company.toJson())
          .eq("id", company.id!);
      getAllCompanies();
    } catch (e) {}
  }

  Future<void> deleteCompany(int id) async {
    final response = await client.from("company").delete().eq("id", id);

    if (response.error == null) {
      getAllCompanies();
    } else {}
  }
}
