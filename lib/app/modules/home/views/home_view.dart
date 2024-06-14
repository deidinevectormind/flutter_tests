import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindvector/app/modules/home/company_model.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showCompanyDialog(context, null);
            },
          ),
        ],
      ),
      body: Obx(
        () {
          return Visibility(
            child: Center(
              child: Text(
                'No companies available',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            replacement: SingleChildScrollView(
              child: Column(
                children: [
                  HorizontalList(
                    itemCount: controller.allCompanies.length,
                    itemBuilder: (context, index) {
                      final company = controller.allCompanies[index];
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Container(child: Text(company.nom!))
                          ],
                        ).paddingOnly(left: 8, right: 8),
                      ).onTap(() {});
                    },
                  ),
                  HorizontalList(
                    itemCount: controller.allCompanies.length,
                    itemBuilder: (context, index) {
                      final company = controller.allCompanies[index];
                      return Container(
                        height: 200,
                        width: 300,
                        decoration: boxDecorationRoundedWithShadow(8,
                            backgroundColor: context.cardColor),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 120,
                                  color: Colors.red,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(company.title!),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.star_rate_rounded),
                                          Text(company.id!.toString()),
                                          SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 15, top: 10),
                                    child: Text(company.nom!),
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                              right: 1,
                              top: 0,
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _showCompanyDialog(context, company);
                                },
                              ),
                            ),
                            Positioned(
                              top: 35,
                              right: 2,
                              child: Container(
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    controller.deleteCompany(company.id!);
                                  },
                                ),
                              ),
                            )
                          ],
                        ).paddingOnly(left: 8, right: 8),
                      ).onTap(() {});
                    },
                  ),
                ],
              ),
            ),
            visible: controller.allCompanies.isEmpty,
          );
        },
      ),
    );
  }

  void _showCompanyDialog(BuildContext context, Company? company) {
    final formKey = GlobalKey<FormState>();
    final nomController = TextEditingController(text: company?.nom);
    final titleController = TextEditingController(text: company?.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(company == null ? 'Add Company' : 'Edit Company'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nomController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newCompany = Company(
                    id: company?.id,
                    createdAt: DateTime.now().toString(),
                    nom: nomController.text,
                    title: titleController.text,
                  );
                  if (company == null) {
                    controller.createCompany(newCompany);
                  } else {
                    controller.updateCompany(newCompany);
                  }
                  Get.back();
                }
              },
              child: Text(company == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }
}
