
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kasnew/cubits/update_profile_cubit.dart';
import 'package:kasnew/cubits/view_profile_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/stepper_form_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/response_model/view_profile_model.dart';
import 'package:kasnew/screens/add_customer/stepper_form1.dart';
import 'package:kasnew/states/update_profile_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/toast_widget.dart';

@RoutePage()

class NomineeProofEditScreen extends HookWidget {
  UserData? userData;
 NomineeProofEditScreen({this.userData});

  @override
  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
    var d=lang?.data;
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    final selectedCard = useState(userData?.aadharCardFront!=null &&  (userData?.aadharCardFront?.isNotEmpty??false)?'aadhar':'pancard');
     var idType=useState<String?>(userData?.aadharCardFront!=null &&  (userData?.aadharCardFront?.isNotEmpty??false)?'aadhar':'pancard');
      var isIdSelected = useState(selectedCard.value!=null&&(selectedCard.value?.isNotEmpty??false)?true:false);
      final isBottomSheetVisible = useState(false);
    final imagePath = useState<File?>(null);
    final aadharFront = useState<File?>(null);
 final aadharBack = useState<File?>(null);
  final panFront = useState<File?>(null);
  final panBack = useState<File?>(null);
    final picker = ImagePicker();
      var idError=useState<String?>(null);
    var isF=useState(false);
    var isB=useState(false);
    var apiAF=useState<String?>(null);
var apiAB=useState<String?>(null);
var apipF=useState<String?>(null);
var apiPB=useState<String?>(null);
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var apiFrontValue=useState<String?>(null);
    var apiBackValue=useState<String?>(null);
    String? _validateImage(File? image, String? type) {
      if ((image == null) ) {
        // return langData?.imageRequired ??
        if (type == 'idFront' && apiFrontValue.value==null) {
          return 'Id Proof front Required';
        }else if (type == 'idBack' && apiBackValue.value==null) return "Id Proof Back Required";
      }
      return null;
    }
    String? _validateId(String? value) {
      if ((value == null || value.isEmpty) && (apiFrontValue.value==null ||apiBackValue.value==null)) {
        return  'Id type is required';
      }
      return null;
    }

   
  void isApiFront() {
 
  
  // Check for Aadhar front value
  if (userData?.nomineeAadharCardFront != null && userData!.nomineeAadharCardFront!.isNotEmpty) {
    apiFrontValue.value = userData!.nomineeAadharCardFront!;
    isF.value = true;
    apiAF.value = userData!.nomineeAadharCardFront!;

   
  }
  
  // Check for PAN front value
  if (userData?.nomineePanCardFront != null && userData!.nomineePanCardFront!.isNotEmpty) {
    apiFrontValue.value = userData!.nomineePanCardFront!;
    isF.value = true;
    apipF.value = userData!.nomineePanCardFront!;
    
    
  }
  
  // No front value found
  isF.value = false;

}

void isApiBack() {
 
  
  // Check for Aadhar back value
  if (userData?.nomineeAadharCardBack != null && userData!.nomineeAadharCardBack!.isNotEmpty) {
    apiBackValue.value = userData!.nomineeAadharCardBack!;
    isB.value = true;
    apiAB.value = userData!.nomineeAadharCardBack!;
    
   
  }
  
  // Check for PAN back value
  if (userData?.nomineePanCardBack != null && userData!.nomineePanCardBack!.isNotEmpty) {
    apiBackValue.value = userData!.panCardBack!;
    isB.value = true;
    apiPB.value = userData!.panCardBack!;
    
    
  }
  
  // No back value found
  isB.value = false;
  
}

    useEffect(() {
     isApiFront();
     isApiBack();
      return null;
    }, []);
    
   Future<void> getImage(
    ImageSource source, String? title, String? idType) async {
  final image = await picker.pickImage(source: source);
  if (image != null) {
    final file = File(image.path);
    imagePath.value = file;

    if (title == 'idProofPhotoFront' && idType == 'aadhar') {
      apiAF.value=null;
      aadharFront.value = file;
     
      
    } else if (title == 'idProofPhotoBack' && idType == 'aadhar') {
       apiAB.value=null;
      aadharBack.value= file;
     
       
    } else if (title == 'idProofPhotoFront' && idType == 'pancard') {
       apipF.value=null;
      panFront.value = file;
      
    } else if (title == 'idProofPhotoBack' && idType == 'pancard') {
       apiPB.value=null;
      panBack.value = file;
      
    }

    // Trigger a rebuild to reflect the updated state
    imagePath.value = imagePath.value; // This line is to force a rebuild.
  }


     
    }
     Future<void> showImagePickerOptions(
        BuildContext context, String? title, String? idType) async {
      isBottomSheetVisible.value = !isBottomSheetVisible.value;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Uncomment if you want to add camera option
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  getImage(ImageSource.camera, title, idType);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  getImage(ImageSource.gallery, title, idType);
                },
              ),
            ],
          );
        },
      );
      //  else {
      //   Navigator.pop(context); // Close the bottom sheet if it's already open
      // }
    }
 void register() async {
    
    if (formKey.currentState!.validate() ) {
     context.read<UpdateProfileCubit>().login(StepperFormRequestModel(userid: ApiConstant.userId,
     nomineeAadharCardFront: aadharFront.value,
     nomineeAadharCardBack: aadharBack.value,
     nomineePanCardFront: panFront.value,
     nomineePanCardBack: panBack.value,
  nominee_fields: '1'
     ));
                  
     
    }
  }
    return Scaffold(
      appBar: TitleAppBarWidget(title:'${d?.nomineeIdProof?? 'Nominee ID proof details'}'),
      body: Form(
        key:formKey,
        child:  BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
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
         builder: (context, state) {
           
         
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: SingleChildScrollView(
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                        TextViewMedium(name: '${d?.aadhar??'Aadhar'}',fontWeight: FontWeight.bold,),
              vericalSpaceMedium,
               
              // Similar validation for ID Proof Photos (front and back)
                        FormField<File?>(
                        
                          builder: (formFieldState) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    PhotoContainerWidget(
                                      title: 'Id ProofPhoto Front*',
                                      onTap: () {
                                        print(isIdSelected.value);
                                     idType.value='aadhar';
                                          showImagePickerOptions(
                                              context,
                                             'idProofPhotoFront',
                                              idType.value);
                                        
                                       },
                                    
                                                                ),                            SizedBox(width: 10),
                                    PhotoContainerWidget(
                                        title: 'Id Proof PhotoBack*',
                                        onTap: () {
                                              idType.value='aadhar';
                                            showImagePickerOptions(
                                                context,
                                               'idProofPhotoBack',
                                                idType.value);
                                          
                                          
                                        }),
                                  ],
                                ),
                              
              
                  
                  Row(
                                  children: [
                            ( apiAF.value!=null) ||        (aadharFront.value != null &&
                                            aadharFront.value!.existsSync())
                                        ? Padding(
                                            padding: EdgeInsets.all(8.0.r),
                                            child: Container(
                                              width: swidth / 2.5,
                                              child: Row(
                                                children: [
                                     aadharFront.value!=null ? 
                                     Image.file(
                                                        aadharFront.value!,
                                                        height: sheight / 6,
                                                        width: swidth / 3,
                                                      )
                                         
                                        
                  :   Image.network(
                                                  apiAF.value??'',
                                                        height: sheight / 6,
                                                        width: swidth / 3,
                                                      )
                
                   
                                                  // horizontalSpaceMedium,
                                                  //  Expanded(child: TextViewSmall(title:  path.basename(formData.aadharCardFront!.path))),
                                                ],
                                              ),
                                            ),
                                          )
                                        :Container(), 
                           ( apiAB.value!=null) || (         aadharBack.value!= null &&
                                            aadharBack.value!.existsSync())
                                        ? Padding(
                                            padding: EdgeInsets.all(8.0.r),
                                            child: Container(
                                              width: swidth / 2.8,
                                              child: Row(
                                                children: [
                                                   aadharBack.value==null && ( apiAB.value!=null)? 
                                      Image.network(
                                             apiAB.value??'',
                                                    height: sheight / 6,
                                                    width: swidth / 3,
                                                  )   
                  : 
                                                  Image.file(
                                                    aadharBack.value!,
                                                    height: sheight / 6,
                                                    width: swidth / 3,
                                                  ),
                                                  //  horizontalSpaceMedium,
                                                  //  Expanded(child: TextViewSmall(title:  path.basename(formData.aadharCardBack!.path))),
                                                ],
                                              ),
                                            ),
                                          )
                                        :Container()
                                  ],
                                ),
                                if (formFieldState.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      formFieldState.errorText!,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextViewMedium(name: '${d?.pan??'PAN '}',fontWeight: FontWeight.bold,),
                             Row(
                                  children: [
                                    PhotoContainerWidget(
                                      title: 'Id ProofPhoto Front*',
                                      onTap: () {
                                        print(isIdSelected.value);
                                     idType.value='pancard';
                                          showImagePickerOptions(
                                              context,
                                             'idProofPhotoFront',
                                              idType.value);
                                        
                                       },
                                    
                                                                ),                            SizedBox(width: 10),
                                    PhotoContainerWidget(
                                        title: 'Id Proof PhotoBack*',
                                        onTap: () {
                                              idType.value='pancard';
                                            showImagePickerOptions(
                                                context,
                                               'idProofPhotoBack',
                                                idType.value);
                                          
                                          
                                        }),
                                  ],
                                ),
                              
                            Row(
                              children: [
                                (apipF.value!=null) ||( panFront.value != null &&
                                                    panFront.value!.existsSync())
                                                ? Container(
                                                    width: swidth / 2.5,
                                                    child: Row(
                                                      children: [
                                            ( apipF.value!=null)&&         panFront.value==null ? 
                                          Image.network(
                                                 apipF.value??'',
                                                        height: sheight / 6,
                                                        width: swidth / 3,
                                                      )   
                                              :    Image.file(
                                                          panFront.value!,
                                                          height: sheight / 6,
                                                          width: swidth / 3,
                                                        ),
                                                        // horizontalSpaceMedium,
                                                        //  Expanded(child: TextViewSmall(title:  path.basename(formData.panCardFront!.path))),
                                                      ],
                                                    ),
                                                  )
                                                : Container(),
                                                ( apiPB.value!=null) ||( panBack.value != null &&
                                                    panBack.value!.existsSync())
                                                ? Container(
                                                    width: swidth / 2.8,
                                                    child: Row(
                                                      children: [
                                panBack.value==null && ( apiPB.value!=null) ? 
                                          Image.network(
                                                  apiPB.value??'',
                                                        height: sheight / 6,
                                                        width: swidth / 3,
                                                      )   
                                              :                          Image.file(
                                                          panBack.value!,
                                                          height: sheight / 6,
                                                          width: swidth / 3,
                                                        ),
                                                        //  horizontalSpaceMedium,
                                                        //  Expanded(child: TextViewSmall(title:  path.basename(formData.panCardBack!.path))),
                                                      ],
                                                    ),
                                                  )
                                                : Container(),
                              ],
                            ),
                          ],
                        ),
                        vericalSpaceMedium,
                      state.networkStatusEnum==NetworkStatusEnum.loading?CircularWidgetC():
                       ((aadharFront.value!=null || aadharBack.value!=null)) 
                        ||(panFront.value!=null || panBack.value!=null) ?ButtonWidget(onPressed: (){
                          register();
                        }, buttonName: '${d?.submit??'Submit'}', buttonColor: appColor):ButtonWidget1(buttonName: 'Submit', buttonColor:greyColor)
              
              ],),
           ),
         );
  }),
      ),
    );
  }
}
