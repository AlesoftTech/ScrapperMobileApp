import 'package:covid_scanner/info_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccessGranted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          "VacChecker",
          style: TextStyle(
              color: Colors.lightBlueAccent
          ),
        ),
        backgroundColor: Colors.white,
        actions: [

        ],
      ),
      body: GetBuilder<InfoController>(
          builder: (_){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _.loading? Center(child: CircularProgressIndicator(),) :
                Flexible(
                  child: Card(
                    shadowColor: Colors.grey.withOpacity(0.6),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('cédula: ${_.vaccine.id}'),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('nombre: ${_.vaccine.name}'),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Intitución primera dosis: ${_.vaccine.viccinesInfo[0].healthEntityFristDose}'),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Marca primera dosis: ${_.vaccine.viccinesInfo[0].vaccineFirstDose}'),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Lote primera dosis: ${_.vaccine.viccinesInfo[0].vaccineFirstDoseBatch}'),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('País primera dosis: ${_.vaccine.viccinesInfo[0].vaccineFirstDoseCountry}'),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Fecha primera dosis: ${_.vaccine.viccinesInfo[0].vaccineFirstDoseDate}'),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Intitución segunda dosis: ${_.vaccine.viccinesInfo[1].healthEntitySecondDose}'),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Marca segunda dosis: ${_.vaccine.viccinesInfo[1].vaccineSecondDose}' ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('Lote segunda dosis: ${_.vaccine.viccinesInfo[1].vaccineSecondDoseBatch}'),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('País segunda dosis: ${_.vaccine.viccinesInfo[1].vaccineSecondDoseCountry}'),
                            ),
                          ),
                          Flexible(child: Text('Fecha primera dosis: ${_.vaccine.viccinesInfo[1].vaccineFirstDoseDate}')),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      )
      );
  }
}
