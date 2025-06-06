import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_recommender/controller/ai_request_controller.dart';
import 'package:job_recommender/model/ai_request_model.dart';
import 'package:job_recommender/model/job_recommadn_model.dart';
import 'package:job_recommender/model/user_data_model.dart';
import 'package:job_recommender/screen/ai_response_screen.dart';
import 'package:job_recommender/screen/history_screen.dart';
import 'package:job_recommender/utils/data_response_type.dart';
import 'package:job_recommender/utils/number_seperator.dart';
import 'package:job_recommender/utils/prompt.dart';
import 'package:job_recommender/utils/show_error_dialog.dart';
import 'package:job_recommender/utils/size_extension.dart';
import 'package:job_recommender/widgets/multi_checkbox_widget.dart';
import 'package:job_recommender/widgets/text_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _fatherJobController = TextEditingController();
  final TextEditingController _motherJobController = TextEditingController();
  final TextEditingController _currentIncomeController = TextEditingController();
  final TextEditingController _freeTimeController = TextEditingController();
  final TextEditingController _minTimeForLearningController = TextEditingController();
  final TextEditingController _workHistoryController = TextEditingController();
  final TextEditingController _personalInterestController = TextEditingController();

  int? selectedGender;
  final List<String> genderOptions = ['مرد', 'زن'];
  void changeGender(int index)=> setState(()=> selectedGender = index);

  int? selectedMaritalStatus;
  final List<String> maritalStatusOptions = ['متاهل', 'مجرد'];
  void changeMaritalStatus(int index)=> setState(()=> selectedMaritalStatus = index);


  int? selectedFinanceStatus;
  final List<String> financeStatusOptions = ['عالی', 'خوب','متوسط','ضعیف'];
  void changeFinanceStatus(int index)=> setState(()=> selectedFinanceStatus = index);


  int? selectedSkillDifficultyLevel;
  final List<String> skillDifficultyLevelOptions = ['آسان','متوسط','سخت'];
  void changeSkillDifficultyLevel(int index)=> setState(()=> selectedSkillDifficultyLevel = index);


  int? selectedHealtyStatus;
  final List<String> healthyStatusOptions = ['خوب', 'متوسط', 'بد'];
  void changeHealthyStatus(int index)=> setState(()=> selectedHealtyStatus = index);


  int? selectedEducationStatus;
  final List<String> educationStatusOptions = ['دیپلم', 'کارشناسی', 'کارشناسی ارشد', 'دکتری'];
  void changeEducationStatus(int index)=> setState(()=> selectedEducationStatus = index);


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: Stack(
              children: [
                Container(
                  height: context.height * 0.15,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.history, color: Colors.white, size: 27,),
                          onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryScreen(),)),
                        ),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.format_list_bulleted, color: Colors.grey.shade200,),
                          Text('فرم اطلاعات', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 26),),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: context.height * 0.12),
                  width: double.infinity,
                  padding: const  EdgeInsets.only(right: 20,left: 20,top: 30),
                  decoration:  BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                  ),
                  
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 14,
                      children: [
      
                        MultiCheckboxWidget(
                          items: genderOptions,
                          lable: 'جنسیت',
                          selectedItem: selectedGender,
                          onChanged: changeGender,
                        ),
                        
                        CustomTextFieldWidget(
                          controller: _ageController,
                          lable: 'سن' ,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: 'مثلاً ۲۵',
                        ),
                        MultiCheckboxWidget(
                          items: maritalStatusOptions,
                          lable: 'وضعیت تاهل',
                          selectedItem: selectedMaritalStatus,
                          onChanged: changeMaritalStatus,
                        ),
                        CustomTextFieldWidget(
                          controller: _cityController,
                          lable: 'شهر محل زندگی' ,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          hintText: 'مثلاً تهران',
                        ),
                        CustomTextFieldWidget(
                          controller: _weightController,
                          lable: 'وزن',
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: 'به کیلوگرم، مثلاً ۷۰',
                        ),
                        CustomTextFieldWidget(
                          controller: _heightController,
                          lable: 'قد',
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: 'به سانتی‌متر، مثلاً ۱۷۵',
                        ),
                        CustomTextFieldWidget(
                          controller: _fatherJobController,
                          lable: 'شغل پدر',
                          textInputAction: TextInputAction.next,
                          hintText: 'مثلاً معلم، کارمند، راننده و ...',
                        ),
                        CustomTextFieldWidget(
                          controller: _motherJobController,
                          lable: 'شغل مادر',
                          textInputAction: TextInputAction.next,
                          hintText: 'مثلاً معلم، کارمند، راننده و ...',
                        ),
                        CustomTextFieldWidget(
                          controller: _currentIncomeController,
                          lable: 'درآمد فعلی',
                          inputFormatters: [PriceNumberSeperationInputFormatter()],
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: 'به تومان، مثلاً ۳۰,۰۰,۰۰۰',
                        ),
                        MultiCheckboxWidget(
                          items: financeStatusOptions,
                          lable: 'وضعیت مالی',
                          selectedItem: selectedFinanceStatus,
                          onChanged: changeFinanceStatus,
                        ),
                        MultiCheckboxWidget(
                          onChanged: changeSkillDifficultyLevel,
                          items: skillDifficultyLevelOptions,
                          lable: 'سطح سختی مهارت',
                          selectedItem: selectedSkillDifficultyLevel,
                        ),
                        CustomTextFieldWidget(
                          controller: _freeTimeController,
                          lable: 'زمان آزاد',
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: 'ساعات آزاد در هفته، مثلاً ۱۰',
                        ),
                        CustomTextFieldWidget(
                          controller: _minTimeForLearningController,
                          lable: 'حداقل زمان مورد نیاز برای یادگیری مهارت',
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: 'ساعات، مثلاً ۵',
                        ),
                        MultiCheckboxWidget(
                          items: healthyStatusOptions,
                          lable: 'وضعیت سلامت',
                          selectedItem: selectedHealtyStatus,
                          onChanged: changeHealthyStatus,
                        ),
                        MultiCheckboxWidget(
                          onChanged: changeEducationStatus,
                          items: educationStatusOptions,
                          lable: 'تحصیلات',
                          selectedItem: selectedEducationStatus,
                        ),
                        CustomTextFieldWidget(
                          controller: _personalInterestController,
                          lable: 'علاقه شخصی',
                          maxLines: 5,
                          textInputAction: TextInputAction.next,
                          hintText: 'به چه موضوعاتی علاقه‌مند هستید؟',
                        ),
                        CustomTextFieldWidget(
                          controller: _workHistoryController,
                          lable: 'سابقه کاری',
                          maxLines: 5,
                          textInputAction: TextInputAction.done,
                          hintText: 'اگر سابقه کاری دارید، در اینجا توضیح دهید',
                        ),
                      
                      
                        Padding(
                          padding: EdgeInsetsGeometry.only(bottom: 15, top: 5),
                          child: ElevatedButton(
                            onPressed: ()async{

                              if(!formKey.currentState!.validate()) return;
                              if (!_validateMultiCheckboxSelections(<int?>[selectedGender, selectedMaritalStatus, selectedFinanceStatus, selectedSkillDifficultyLevel, selectedHealtyStatus, selectedEducationStatus], context)) return;

                              setState(()=> isLoading = true);
                              try{
                                
                                final data = UserDataModel(
                                  age: _ageController.text,
                                  city: _cityController.text,
                                  weight: _weightController.text,
                                  height: _heightController.text,
                                  fatherJob: _fatherJobController.text,
                                  motherJob: _motherJobController.text,
                                  currentIncome: _currentIncomeController.text,
                                  freeTime: _freeTimeController.text,
                                  minTimeForLearning: _minTimeForLearningController.text,
                                  workHistory: _workHistoryController.text,
                                  personalInterest: _personalInterestController.text,
                                  gender: genderOptions[selectedGender!],
                                  maritalStatus: maritalStatusOptions[selectedMaritalStatus!],
                                  financeStatus: financeStatusOptions[selectedFinanceStatus!],
                                  skillDifficultyLevel: skillDifficultyLevelOptions[selectedSkillDifficultyLevel!],
                                  healthyStatus: healthyStatusOptions[selectedHealtyStatus!],
                                  educationStatus: educationStatusOptions[selectedEducationStatus!],
                                );
                                final finalRequest = jsonEncode(data.toJson());
                                final promptRequest = prompt(finalRequest);
                            
                                final AiRequestModel aiRequestModel = AiRequestModel(
                                  model: 'deepseek/deepseek-chat-v3-0324:free',
                                  messages: [
                                    Messages(
                                      role: 'user',
                                      content: promptRequest
                                    )
                                  ]
                                );
                            
                                AiRequestController aiRequestController = AiRequestController();
                                final res = await aiRequestController.getAiResponse(aiRequestModel);
                            
                                if(res is DataSuccess)
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AiResponseScreen(jobRecommendations: res.data as List<JobRecommendationModel>, isFromHistory: false,),));
                                else 
                                  showErrorDialog(context, res.data);
                            
                              }
                              catch(e){
                                showErrorDialog(context, null);
                              }
                              finally{
                                setState(()=> isLoading = false);
                              }
                          
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: Size(double.infinity, 50),
                            ),
                            child: isLoading ? CircularProgressIndicator(color: Colors.white,) : Text('تایید', style: TextStyle(color: Colors.white, fontSize: 14),)),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}



bool _validateMultiCheckboxSelections(List<int?> selections, BuildContext context) {
  List<int> errors = [];
  for(var i in selections){
    if(i == null)
      errors.add(0);
  }
  if (errors.isNotEmpty) {
    showErrorDialog(context, 'لطفا تمام گزینه‌های چندتایی را انتخاب کنید.',needShowTitle: false);
    return false;
  }
  return true;
}