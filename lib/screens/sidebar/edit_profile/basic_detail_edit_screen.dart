import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:kasnew/cubits/mobile_check_cubit.dart';
import 'package:kasnew/cubits/pincode_cubit.dart';
import 'package:kasnew/cubits/update_profile_cubit.dart';
import 'package:kasnew/cubits/view_profile_cubit.dart';
import 'package:kasnew/cubits/wp_check_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/mobile_chek_request_model.dart';
import 'package:kasnew/request_model/pin_code_request_model.dart';
import 'package:kasnew/request_model/stepper_form_request_model.dart';
import 'package:kasnew/response_model/view_profile_model.dart';
import 'package:kasnew/states/mobile_check_state.dart';
import 'package:kasnew/states/pin_code_state.dart';
import 'package:kasnew/states/update_profile_state.dart';
import 'package:kasnew/states/wp_check_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/drop_down_widget.dart';
import 'package:kasnew/widgets/text_form_widget.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';

import '../../../response_model/language_model.dart';
@RoutePage()
class BasicDetailEditScreen extends HookWidget

 {
 final UserData? userData;
  
 const BasicDetailEditScreen({required this.userData});

  @override
   Widget build(BuildContext context) {
      LangModel? lang=ApiConstant.language;
    var d=lang?.data;
     final ValueNotifier<DateTime?> _selectedDate =
        ValueNotifier<DateTime?>(null);
    final TextEditingController dobController = useMemoized(
    () => TextEditingController(text: userData?.birthday ?? ''),
);
final TextEditingController districtController = useMemoized(
    () => TextEditingController(text: userData?.district ?? ''),
);
final TextEditingController stateController = useMemoized(
    () => TextEditingController(text: userData?.state ?? ''),
);
final TextEditingController pinCodeController = useMemoized(
    () => TextEditingController(text: userData?.postalCode ?? ''),
);
final TextEditingController circleController = useMemoized(
    () => TextEditingController(text: userData?.division ?? ''),
);
final TextEditingController adres1Controller = useMemoized(
    () => TextEditingController(text: userData?.address ?? ''),
);
final TextEditingController areaController = useMemoized(
    () => TextEditingController(text: userData?.area ?? ''),
);
final TextEditingController landmarkController = useMemoized(
    () => TextEditingController(text: userData?.landmark ?? ''),
);
final TextEditingController cityController = useMemoized(
    () => TextEditingController(text: userData?.city ?? ''),
);
final TextEditingController wpController = useMemoized(
    () => TextEditingController(text: userData?.whatsappNumber ?? userData?.phoneNumber ?? ''),
);
final TextEditingController mobileController = useMemoized(
    () => TextEditingController(text: userData?.phoneNumber ?? ''),
);
final TextEditingController nameController = useMemoized(
    () => TextEditingController(text: userData?.fullName ?? ''),
);
final TextEditingController emailController = useMemoized(
    () => TextEditingController(text: userData?.email ?? ''),
);
final TextEditingController gardianController = useMemoized(
    () => TextEditingController(text: userData?.guardianName ?? ''),
);
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 
   useEffect(() {
  context.read<PincodeCubit>().login(PincodeRequestModel(
    userId: ApiConstant.userId,
    lang: ApiConstant.langCode,
    pincode: pinCodeController.text
  ));
  
  // Return a cleanup function or null if none is needed
  return null;
}, []);
          var isWp=useState(false);
    var isNum=useState(false);
   
    var wpError=useState<String?>(null);
    var numError=useState<String?>(null);
    var isIdSelected = useState(false);
    ValueNotifier<String?> idError = useState(null);
     var cities=useState<List<String>>([]);
final FocusNode addressFocusNode = FocusNode();
    final FocusNode areaFocusNode = FocusNode();
    final FocusNode landmarkFocusNode = FocusNode();
   print('calling basic detail');

     final selectedGender = useState((userData?.gender?.isNotEmpty??false)?userData?.gender:null);
      var selectedCityValue = useState<String?>(userData?.city??'');
          String? _validateUsername(String? value) {
      if (value == null || value.trim().isEmpty) {
        return'Name Required';
      }

      return null;
    }
 String? _validateGardian(String? value) {
      if (value == null || value.trim().isEmpty) {
        return ApiConstant.langCode!='ta'?'Guardian Name Required':'பாதுகாவலர் பெயர் தேவை';
      }

      return null;
    }
    String? _validatepin(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Pincode Required';
      }

      return null;
    }

    String? _validatecity(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'City Required';
      }

      return null;
    }

    String? _validateAddress(String? value) {
      if (value == null ||value.trim().isEmpty) {
        return 'Address Required';
      }

      return null;
    }

    String? _validateArea(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Area Required';
      }

      return null;
    }

    String? validateDob(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Date of Birth Required';
      }

      return null;
    }

 String? _validateMobile(String? value) {
    
     if (value!=null&&numError.value!=null) {
        return '';
      }
      
      return null;
    }
    String? _validateWhatsapp(String? value) {
      if (value == null ||value.trim().isEmpty) {
        return 'Whatsapp Required';
      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
        return 'Number Validated Required';
      }
      else if (wpError.value!=null) {
        return '';
      }
      return null;
    }
  String? _validateGender(String? value) {
      if (value == null || value.isEmpty) {
        return 'Gender is required';
      }
      return null;
    }
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: appColor, // Header background color

              colorScheme: ColorScheme.light(
                primary: appColor, // Header text and button color
              ),
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary, // Button text color
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null) {
        _selectedDate.value = picked;
        
        dobController.text=DateFormat('dd/MM/yyyy').format(picked);
      }
    }

 void register() async {
    
    if (formKey.currentState!.validate() ) {
     context.read<UpdateProfileCubit>().login(StepperFormRequestModel(userid: ApiConstant.userId,
     fullName: nameController.text,
     guardianName: gardianController.text,
     phoneNumber: mobileController.text,
     whatsappNumber: wpController.text,
     email: emailController.text,
     gender: selectedGender.value,
     birthday: dobController.text,
     state: stateController.text,
     Pincode: pinCodeController.text,
     district: districtController.text,
     circle: circleController.text,
     city: cityController.text,
     address: adres1Controller.text,
     area: areaController.text,
     landmark: landmarkController.text,
     customer_fields: '1'
     ));
                  
     
    }
  }
    return Scaffold(
      appBar: TitleAppBarWidget(title: '${d?.basicDetails??'Basic Details'}'),
      body: SingleChildScrollView(
        child: MultiBlocListener(
          listeners: [
               BlocListener<PincodeCubit, PincodeState>(
                  listener: (context, state) {
                    if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
                      districtController.text =
                          state.model.data?.district ?? '';
                      circleController.text = state.model.data?.division ?? '';
                      cities.value=state.model.data?.cities??[];
                      }}),
                      BlocListener<UpdateProfileCubit, UpdateProfileState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
   ToastWidget(message: state.model.message,color: Colors.green,).build(context);
    context.read<ViewProfileCubit>().login(HomeRequestModel(
    userId: ApiConstant.userId,
    lang: ApiConstant.langCode,
   
  ));
   context.router.pop();
      }
      else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){

      }
    },
         ) ],
         child:    Form(
          key: formKey,
              child: Padding(
                padding: EdgeInsets.all(screenPadding),
                child: Column(children: [
                 TextForm(
                            keyboardType: TextInputType.name,
                            labelText: '${d?.fullName??'Full Name'}*',
                            validating: _validateUsername,
                            controller: nameController,
                           
                            
                          ),
                          vericalSpaceLarge,
                          TextForm(
                            keyboardType: TextInputType.name,
                            labelText:'${d?.guardianName??'Guardian Name'}*',
                             validating: _validateGardian,
                             controller: gardianController,
                           
                           
                          ),
                          vericalSpaceLarge,
                          TextForm(
                              keyboardType: TextInputType.number,
                              labelText: '${d?.mobileNumber??'Mobile Number'}',
                                validating: _validateMobile,
                              controller: mobileController,
                              readOnly: true,
                               onChanged: (value) {
                                 if(mobileController.text.length==10){
                                  isNum.value=true;
                
                                  context.read<MobileCheckCubit>().login(MobileCheckRequestModel(
                                    userId: ApiConstant.userId,
                                    lang: ApiConstant.langCode,
                                    number: mobileController.text
                                  ));
                                 }
                               },
                              
                              type: 'mobileNumber'),
                               BlocListener<MobileCheckCubit,MobileCheckState>(
                                listener: (context, state) {
                                  if(state.model.text=='Error' ){
                                    numError.value=state.model.message;
                                    
                                    print(numError.value);
                                  }
                                  else if(state.model.text!='Error'){
                numError.value=null;
                
                                  }
                              
                                },
                              
                          child:    numError.value!=null?TextViewSmall(title: numError.value,textcolor: Colors.red,fontSizes: 12):Container()),
                          vericalSpaceLarge,
                          TextForm(
                              keyboardType: TextInputType.number,
                              controller: wpController,
                              labelText: '${d?.whatsappNumber??'Whatsapp Number*'}',
                              validating: _validateWhatsapp,
                               onChanged: (value) {
                                 if(wpController.text.length==10){
                                 
                                  context.read<WpCheckCubit>().login(MobileCheckRequestModel(
                                    userId: ApiConstant.userId,
                                    lang: ApiConstant.langCode,
                                    number: wpController.text
                                  ));
                                 }
                               },
                              
                              type: 'mobileNumber'),
                     BlocListener<WpCheckCubit,WpCheckState>(
                                listener: (context, state) {
                                  if(state.model.text=='Error' ){
                                    wpError.value=state.model.message;
                                    
                                    
                                  }
                                  else if(state.model.text!='Error'){
                wpError.value=null;
                
                                  }
                              
                                },       child: wpError.value!=null?TextViewSmall(title: wpError.value,textcolor: Colors.red,fontSizes: 12):Container()),
                          vericalSpaceLarge,
                          TextForm(
                            keyboardType: TextInputType.emailAddress,
                            labelText: '${d?.email??'Email'}',
                            controller: emailController,
                            // validating: _validateUsername,
                            
                          ),
                          vericalSpaceLarge,
                         
                       DropDownWidget(items:['Male','Female',],
                        labelText: '${d?.gender??'Gender'}',
                     initialValue: selectedGender.value,
                         onChanged: (p0){
                         selectedGender.value=p0;
                         },),
                          vericalSpaceLarge,
                          // ValueListenableBuilder<DateTime?>(
                          //   valueListenable: _selectedDate,
                          //   builder: (context, value, child) {
                          //     return TextForm(
                          //       controller: dobController,
                          //       keyboardType: TextInputType.none,
                          //       labelText: 'dateOfBirth',
                          //       readOnly: true,
                          //       onTap: () => _selectDate(context),
                          //     );
                          //   },
                          // ),
                          TextForm(
                                 controller: dobController,
                                keyboardType: TextInputType.number,
                                labelText: '${d?.dateOfBirth??'Date Of Birth'}',

                               type:'dob'
                              ),
                          vericalSpaceLarge,
                          TextForm(
                            //  controller: stateController,
                            keyboardType: TextInputType.text,
                            labelText: '${d?.state??'State'}',
                            // validating: _validateUsername,
                           
                            controller: stateController,
                            readOnly: true,
                          ),
                          vericalSpaceLarge,
                
                          TextForm(
                            keyboardType: TextInputType.number,
                            labelText: '${d?.pincode??'Pincode'}*',
                            controller: pinCodeController,
                            validating: _validatepin,
                            onChanged: (value) {
                              // Check if the entered value has 6 digits
                              if (value?.length == 6) {
                                // Save the pincode value
                                // FocusScope.of(context).unfocus();
                              
                                selectedCityValue.value = null;
                                context.read<PincodeCubit>().login(
                                      PincodeRequestModel(
                                        userId: ApiConstant.userId,
                                        lang: ApiConstant.langCode,
                                        pincode: value,
                                      ),
                                    );
                              }
                            },
                           
                            type: 'pincode',
                          ),
                
                          Column(
                                children: [
                                  vericalSpaceLarge,
                                  TextForm(
                                    controller: districtController,
                                    keyboardType: TextInputType.text,
                                    labelText: '${d?.district??'District'}*',
                                  
                                    readOnly: true,
                                    // validating: _validateD,
                                  ),
                                  vericalSpaceLarge,
                                  TextForm(
                                    controller: circleController,
                                    keyboardType: TextInputType.text,
                                    labelText: '${d?.division??'Division'}*',
                                  
                                    validating: _validatecity,
                                    readOnly: true,
                                  ),
                                  vericalSpaceLarge,
                                  // selectedCityValue.value != null
                                  //     ? TextForm(
                                  //         controller: cityController,
                                  //         keyboardType: TextInputType.text,
                                  //         labelText: '${langData?.city}*',
                                  //         onSaved: (value) => formData.city = value,
                                  //         validating: _validatecity,
                                  //         readOnly: true,
                                  //       )
                                  //     :
                                  DropDownWidget(
                                    items:cities.value,
                                    initialValue: selectedCityValue.value,
                                    
                                    labelText:'${d?.city??'City'}*',
                                    hintText:'${d?.city??'City'}*',
                                    isValidate: true,
                                    validationMessage: '${d?.cityRequired??'City Required'}',
                                    onChanged: (selectedCity) {
                                      final selectedAppointmentTypee =
                                          cities?.value.firstWhere(
                                        (type) => type == selectedCity,
                                      );
                                     
                                     
                                      selectedCityValue.value =
                                          selectedAppointmentTypee;
                                      cityController.text = selectedCityValue.value!;
                                      
                                      print(
                                          'selvalueaftercityyy${selectedCityValue.value}');
                                    },
                                  ),
                                  // vericalSpaceLarge,
                                ],
                              
                          
                          
                          
                          
                          
                                                    ),                          vericalSpaceLarge,
                
                          TextForm(
                            keyboardType: TextInputType.text,
                            labelText: '${d?.address1??'Address1'}*',
                           controller: adres1Controller,
                           focusNode: addressFocusNode,
                            validating: _validateAddress,
                          ),
                          vericalSpaceLarge,
                          TextForm(
                            keyboardType: TextInputType.text,
                            labelText: '${d?.area??'Area'}*',
                            focusNode: areaFocusNode,
                           controller: areaController,
                            validating: _validateArea,
                          ),
                          vericalSpaceLarge,
                          TextForm(
                            keyboardType: TextInputType.text,
                            labelText:'${d?.landmark??'Landmark'}*',
                            controller: landmarkController
                           
                           
                          ),
                vericalSpaceLarge,
                          ButtonWidget(onPressed: (){
register();
                          }, buttonName: '${d?.submit??'Submit'}', buttonColor: appColor)
                ],),
              ),
            ),
          
        ),
      ),
    );

  }
}

