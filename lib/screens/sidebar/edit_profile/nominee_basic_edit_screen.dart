import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kasnew/cubits/pincode_cubit.dart';
import 'package:kasnew/cubits/update_profile_cubit.dart';
import 'package:kasnew/cubits/view_profile_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/stepper_form_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/response_model/view_profile_model.dart';
import 'package:kasnew/states/pin_code_state.dart';
import 'package:kasnew/states/update_profile_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/text_form_widget.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';
@RoutePage()
class NomineeBasicEditScreen extends HookWidget

 {
 final UserData? userData;
  
 const NomineeBasicEditScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
    var d=lang?.data;
     final ValueNotifier<DateTime?> _selectedDate =
        ValueNotifier<DateTime?>(null);
    final TextEditingController dobController = useMemoized( 
    () => TextEditingController(text: userData?.birthday ?? ''),
);
   
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController adres1Controller = useTextEditingController();
    TextEditingController areaController = useTextEditingController();
    TextEditingController landmarkController = useTextEditingController();
    
    TextEditingController? cityController = useTextEditingController();
    TextEditingController? wpController = useTextEditingController();
    TextEditingController? mobileController = useTextEditingController();
     TextEditingController nameController = useTextEditingController();
     
        TextEditingController emailController = useTextEditingController();
         TextEditingController bankController = useTextEditingController();
         TextEditingController ifscController = useTextEditingController();
         TextEditingController acController = useTextEditingController();
         TextEditingController upiController = useTextEditingController();
nameController.text=userData?.nomineeName??'';

mobileController.text=userData?.nomineeMobileNumber??'';
emailController.text=userData?.nomineeEmail??'';
// .text=userData?.??'';
        //  dobController.text=userData?.??'';
         
        //  stateController.text=userData?.state??'';
        //  pinCodeController.text=userData?.postalCode??'';

adres1Controller.text=userData?.nomineeAddress??'';
areaController.text=
landmarkController.text=userData?.nomineeLandmark??'';
cityController.text=userData?.nomineeCity??'';
wpController.text=userData?.whatsappNumber??'';
bankController.text=userData?.nomineeBankName??'';
ifscController.text=userData?.nomineeBankIfscCode??'';
acController.text=userData?.nomineeBankAccountNumber??'';
upiController.text=userData?.nomineeBankUpiId??'';
          var isWp=useState(false);
    var isNum=useState(false);
   
    var wpError=useState<String?>(null);
    var numError=useState<String?>(null);
    var isIdSelected = useState(false);
    ValueNotifier<String?> idError = useState(null);
     var cities=useState<List<String>>([]);

   print('calling basic detail');

     final selectedGender = useState((userData?.nomineeGender?.isNotEmpty??false)?userData?.nomineeGender:null);
      var selectedCityValue = useState<String?>(cityController.text);
         
     
    return Scaffold(
      appBar: TitleAppBarWidget(title: '${d?.nomineeBasicDetails??'Nominee Basic Details'}'),
      body: SingleChildScrollView(
        child: MultiBlocListener(
          listeners: [
               BlocListener<PincodeCubit, PincodeState>(
                  listener: (context, state) {
                    if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
                      // districtController.text =
                      //     state.model.data?.district ?? '';
                      // circleController.text = state.model.data?.division ?? '';
                      // cities.value=state.model.data?.cities??[];
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
         )
          ],
         child:    Form(
          key: formKey,
              child: Padding(
                padding: EdgeInsets.all(screenPadding),
                child: Column(children: [
                 TextForm(
                            keyboardType: TextInputType.name,
                            labelText: '${d?.fullName??'Full Name'}',
                            // validating: _validateUsername,
                            controller: nameController,
                           
                            
                          ),
                          vericalSpaceLarge,
                    //     DropDownWidget(items:['Male','Female',],
                    //     labelText: 'Gender',
                    //  initialValue: selectedGender.value,
                    //      onChanged: (p0){
                    //      selectedGender.value=p0;
                    //      },),
                         
                          
                        //  vericalSpaceLarge,
                          TextForm(
                              keyboardType: TextInputType.number,
                              labelText:  '${d?.mobileNumber??'Mobile Number'}',
                                // validating: _validateMobile,
                              controller: mobileController,
                          
                               
                              
                              type: 'mobileNumber'),
                              
                          
             
                          vericalSpaceLarge,
                         
                
                          Column(
                                children: [
                                 
          TextForm(
            keyboardType: TextInputType.text,
            labelText:  '${d?.city??'City'}',
            
            controller:cityController
            // validating: _validateUsername,
          ),
          vericalSpaceLarge,
          TextForm(
            keyboardType: TextInputType.text,
            labelText:  '${d?.address1??'Address1'}',
            controller: adres1Controller,
            // validating: _validateUsername,
          ),
          vericalSpaceLarge,
          TextForm(
            keyboardType: TextInputType.text,
            labelText:  '${d?.address2??'Address2'}',
            controller: areaController,
          ),
          vericalSpaceLarge,
          TextForm(
            keyboardType: TextInputType.text,
            labelText:  '${d?.landmark??'Landmark'}',
            controller: landmarkController,
          ), 
           vericalSpaceLarge,
          TextForm(
            keyboardType: TextInputType.text,
            labelText:  '${d?.bankName??'Bank Name'}',
            controller: bankController,
          ),
           vericalSpaceLarge,
          TextForm(
            keyboardType: TextInputType.text,
            labelText:  '${d?.ifscNumber??'IFSC Number'}',
            controller: ifscController,
          ),
           vericalSpaceLarge,
          TextForm(
            keyboardType: TextInputType.text,
            labelText:  '${d?.acNumber??'A/C Number'}',
            controller: acController,
          ),
           vericalSpaceLarge,
          TextForm(
            keyboardType: TextInputType.text,
            labelText:  '${d?.upiId??'UPI Id'}',
            controller: upiController,
          ),
                                  
                                  
                                
                              
                          
                          
                          
                          
                          
                                                                              vericalSpaceLarge,
                
                         
                          ButtonWidget(onPressed: (){
 context.read<UpdateProfileCubit>().login(StepperFormRequestModel(userid: ApiConstant.userId,
 nomineeName: nameController.text,
 nomineeMobileNumber: mobileController.text,
 nomineeGender: selectedGender.value,
 nomineeCity:cityController.text,
 nomineeAddress: adres1Controller.text,
nomineeAddress2: areaController.text,
 landmark: landmarkController.text,
 nominee_bank_name: bankController.text,
 nominee_bank_account_number: acController.text,
 nominee_bank_ifsc_code: ifscController.text,
 nominee_bank_upi_id: upiController.text,
 nominee_fields: '1'
));
                          }, buttonName: '${d?.submit??'Submit'}', buttonColor: appColor)
                ],),
             ] ),
            ),
          
        ),
      ),
    ));

  }
}

