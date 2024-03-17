import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/app_theme.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/airport_model.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/airports/add_airport.dart';
import 'package:tfg_frontend/app/modules/home/widgets/new_analysis/first_step.dart';

class NewAnalysisController extends GetxController {
  final Rx<AirportModel?> selectedAirport = Rx<AirportModel?>(null);
  final RxBool addAirport = RxBool(false);
}

class NewAnalysis extends StatefulWidget {
  const NewAnalysis({super.key});

  @override
  State<NewAnalysis> createState() => _NewAnalysisState();
}

class _NewAnalysisState extends State<NewAnalysis> {
  int currentStep = 0;
  final NewAnalysisController controllerNew = Get.put(NewAnalysisController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text(
            'newAnalisis'.tr,
            style: title1TextStyle,
          ),
          const SizedBox(height: 50),
          Theme(
            data: ThemeData(
              canvasColor: appThemeData.colorScheme.background,
              shadowColor: Colors.transparent,
              colorScheme: const ColorScheme.light(
                primary: orange
              )
            ),
            child: SizedBox(
              height: 600,
              child: Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepCancel: () {
                  currentStep == 0 ? null : setState(() => currentStep -= 1);
                },
                onStepContinue: () {
                  setState(() {
                    final isLastStep = currentStep == getSteps().length - 1;
                    if (isLastStep) {
          
                    } else {
                      currentStep += 1;
                    }                  
                  });
                },
                onStepTapped: (int index) {
                  setState(() => currentStep = index);
                },
                controlsBuilder: (context, ControlsDetails controlsDetails) {
                  final isLastStep = currentStep == getSteps().length - 1;
                  return Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: controlsDetails.onStepContinue,
                          child: Text(isLastStep ? 'confirm'.tr : 'next'.tr),
                        ),
                        if (currentStep != 0)
                        TextButton(
                          onPressed: controlsDetails.onStepCancel,
                          child: Text('cancel'.tr),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> getSteps() => [
    Step(
      title: Text('step1Title'.tr, style: textDarkGrayTextStyle,),
      content: Center(
        child: Obx(() => controllerNew.addAirport.value == false ? FirstStep() : const AddAirport()),
      ),
      isActive: currentStep >= 0,
      state: currentStep > 0 ? StepState.complete : StepState.indexed
    ),
    Step(
      title: const Text('Step 2 title', style: textDarkGrayTextStyle,),
      content: const Text('Content for Step 2'),
      isActive: currentStep >= 1,
      state: currentStep > 1 ? StepState.complete : StepState.indexed
    ),
    Step(
      title: const Text('Step 3 title', style: textDarkGrayTextStyle,),
      content: const Text('Content for Step 3'),
      isActive: currentStep >= 2,
      state: currentStep > 2 ? StepState.complete : StepState.indexed
    ),
    Step(
      title: const Text('Step 4 title', style: textDarkGrayTextStyle,),
      content: const Text('Content for Step 4'),
      isActive: currentStep >= 3,
      state: currentStep > 3 ? StepState.complete : StepState.indexed
    ),
  ];
}

