import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/pay_dues_cubit.dart';
import 'package:kasnew/cubits/pay_now_cubit.dart';
import 'package:kasnew/cubits/total_pay_due_cubit.dart';
import 'package:kasnew/request_model/pay_due_request_model.dart';
import 'package:kasnew/request_model/pay_now_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/pay_dues_state.dart';
import 'package:kasnew/states/pay_now_state.dart';
import 'package:kasnew/states/total_pay_due_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/join_plan_widget.dart';
import 'package:kasnew/widgets/row_bold_text_widget.dart';
import 'package:kasnew/widgets/text_form_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
@RoutePage()
class PayDuesScreen extends HookWidget{
  String? id;
  String? customerId;
   PayDuesScreen({this.id,this.customerId});

  @override

  Widget build(BuildContext context) {
    LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
      useEffect(() {
  context.read<PayDuesCubit>().login(PayDueRequestModel(
    userId: ApiConstant.userId,
    lang: ApiConstant.langCode,
    id: id,
    customerId: customerId
  ));
  
  // Return a cleanup function or null if none is needed
  return null;
}, []);
var selectedPlan=useState<List<String?>>([]);
var controllers = useState<Map<int, TextEditingController>>({});
var flexiController = useTextEditingController();
    var selectedPartial = useState<List<int>>([]);
    var partialValues = useState<List<String>>([]);
var selectedDate=useState<List<String>>([]);
var selectedDues = useState<List<String>>([]);
var errorMessage = useState<List<int>>([]);

double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    var amount =useState(0);
     var amountNew =useState(0);
Widget _icon(int? status,String? progress,String? paidAmount,String? pendingAmount) {
  if(status==0 && int.parse(progress??"0")>0)
  return InkWell(
     onTap: (){
      _showPaymentDialog(context,paidAmount: paidAmount??'0',pendingAmount: pendingAmount??'0');
     },
    child: Column(
      children: [
        Container(
          width: swidth/5,
          child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(4),
                                backgroundColor: Color.fromARGB(255, 216, 212, 212),
                                color: Colors.green,
                                value:double.parse(progress??'1') /100,),
        ),
        vericalSpaceSmall,
        TextViewSmall(title: '$progress%')
      ],
    ),
  ) ;
  else if(status==0 && int.parse(progress??"0")==0){
return Icon(Icons.remove);
   }
  else if (status==1)
    return Icon(  Icons.check_circle_outline,color: Colors.green,);
    else 
    return Icon( Icons.cancel_outlined,color: Colors.red,); 
  
}
void getTotalAmount(){
context.read<TotalPayDueCubit>().login(PayNowRequestModel(
           userId: ApiConstant.userId,
        lang: ApiConstant.langCode,
       
        dues: selectedDues.value,
        inputdues: partialValues.value
        ));  
}
void handleCheckboxChanged(bool? isChecked, int findex, String? planId) {
      if (isChecked == true) {
        // Add the index to selectedPartial
         selectedDues.value = selectedDues.value
            .where((item) => !item.startsWith('$planId#'))
            .toList();
        selectedPartial.value = List.from(selectedPartial.value)..add(findex);
 getTotalAmount();
        // Initialize a TextEditingController for this index if not already present
        if (!controllers.value.containsKey(findex)) {
          controllers.value = {
            ...controllers.value,
            findex: TextEditingController(),
          };
        }
      } else {
        // Remove the index from selectedPartial
        selectedPartial.value = List.from(selectedPartial.value)..remove(findex);

        // Clear and remove the TextEditingController
        controllers.value[findex]?.clear();
        controllers.value = Map.from(controllers.value)..remove(findex);

        // Remove any previously stored value for this plan
        partialValues.value = partialValues.value
            .where((item) => !item.startsWith('$planId#'))
            .toList();

            getTotalAmount();
      }
    }

    void handleTextChanged(String value, int findex, String? planId) {
      print('textbox value--------$value');
      if(value!=null && value.isNotEmpty){
       print('partialValues.value 1${partialValues.value}');
      partialValues.value = partialValues.value
          .where((item) => !item.startsWith('$planId#'))
          .toList();
 print('partialValues.value 2${partialValues.value}');
      // Add the updated value
       partialValues.value = List.from(partialValues.value)
        ..add('$planId#$value');
         print('partialValues.value 3${partialValues.value}');
         getTotalAmount();}
        // if (value.isNotEmpty) {
        //       int parsedValue = int.tryParse(value) ?? 0;

        //       // Add the new value
            
        //       // Update the total amount
        //       amount.value = partialValues.value.fold<int>(
        //         0,
        //         (prev, element) => prev + int.parse(element.split('#').last),
        //       );
        //     }
          
    }
    


    return  MultiBlocListener(
      listeners: [
        BlocListener<PayDuesCubit, PayDuesState>(
                listener: (context, state) {
               
          if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
           
          }
          else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
        
          }
        },
        ),
         BlocListener<PayNowCubit, PayNowState>(
                listener: (context, state) {
               
          if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
           
          }
          else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
        
          }
        },
        
        ),
         BlocListener<TotalPayDueCubit, TotalPayDueState>(
                listener: (context, state) {
               
          if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
          amountNew.value=int.parse(state.model.data?.totalAmount??"0") ;
          }
          else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
        
          }
        },)
        ],
      child:   BlocBuilder<PayDuesCubit,PayDuesState>(
         builder: (context, state) {
         if(  state.networkStatusEnum==NetworkStatusEnum.loading){
          return Center(child: CircularProgressIndicator(color: appColor,));
        }
        if( state.networkStatusEnum==NetworkStatusEnum.loaded){
          var data=state.model.data;
        return   Scaffold(
            appBar: TitleAppBarWidget(title:'${d?.payDues?? 'Pay Dues'}',),
            body: SingleChildScrollView(
              child:(data?.length ??0)>0? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data?.length,
                itemBuilder: (context,findex){
                  var ldata=data?[findex];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child:ldata?.planType!='flexible'? ExpansionTile(
                      initiallyExpanded:false ,
                      iconColor: appColor,
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            TextViewLarge(title:ldata?.planName,textcolor: appColor,
                            fontWeight: FontWeight.w900,),
                            RowTextWidget(title: '${d?.name??'Name'}',value:ldata?.passbookName ,),
                      (ldata?.accountNo!=null &&(ldata?.accountNo?.isNotEmpty??false))?      RowTextWidget(title: 'Account Number',value:ldata?.accountNo ,):Container(),
                           
                            RowTextWidget(title: '${d?.group??'Group'}', value:ldata?.planGroup ),
                            Row(
                              children: [
                                  TextViewSmall(title:'${d?.dueAmount??'Due Amount'} : ',textcolor: blackColor,),
                                BigAmountWidget(rupees:ldata?.paymentAmount ),
                              ],
                            ),
                           
                          ],
                        ),
                      ),
                        children: [
                      int.parse(ldata?.maximumPartialAmount??'0')  >0?   Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                         Checkbox(
                          splashRadius: 10,
                          activeColor: appColor,
                                      value:
                                          selectedPartial.value.contains(findex),
                                      onChanged: (p0) => handleCheckboxChanged(
                                          p0, findex, ldata?.orderId),
                                    ),
                                    TextViewMedium(name: '${d?.usePartialPayment??'Use Partial Payment'}',fontWeight: FontWeight.w700,
                                    fontSize: ApiConstant.langCode=='ta'?10.sp:null,),
                                    horizontalSpaceSmall,
                                  ],
                                ):Container(),
                                selectedPartial.value.contains(findex)
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                         child:
                                          // TextFormField(
                                          
                                        //   keyboardType: TextInputType.number,
                                        //   controller: controllers.value[findex],
                                        //   onChanged: (value) => handleTextChanged(
                                        //       value, findex, ldata?.orderId),
                                        //   decoration: InputDecoration(
                                        //     labelText: 'Enter Partial Amount',
                                        //     border: OutlineInputBorder(),
                                        //     hintText: 'Enter Your Amount here',
                                        //     isDense: 
                                        //   ),
                                        // ),
                                       Column(
                                         
                                          children: [
                                            TextForm(keyboardType:TextInputType.number ,
                                            controller: controllers.value[findex],
                                            type: 'ruppee',
                                            errorText: errorMessage.value.contains(findex)?"${d?.enterValueBelow??"Please enter value below"} ${ldata?.maximumPartialAmount}":null,
                                            isDense:false,
                                            charLength: (ldata?.maximumPartialAmount?.length??0)+1,
                                             labelText: '${d?.enterPartialAmount??'Enter Partial Amount'}', hintText: '${d?.enterYourAmount??'Enter Your Amount'}',
                                             onChanged: (value) {
                                                if (value!=null && value.isNotEmpty  ) {
                                                  int enteredValue = int.tryParse(value) ?? 0;
                                            int maxValue=int.parse(ldata?.maximumPartialAmount??'200');
                                                  // Check if the value exceeds the allowed limit

                                                print('maxValue$maxValue');
                                                  if (enteredValue >maxValue) {
                                                    errorMessage.value =List.from(errorMessage.value) ..add(findex);
                                                  } else {
                                                    errorMessage.value =List.from(errorMessage.value) ..remove(findex);
                                                    handleTextChanged(
                                          controllers.value[findex]!.text   , findex, ldata?.orderId); // Clear the error message if valid
                                                  }
                                                } else {

                                                  errorMessage.value =List.from(errorMessage.value) ..remove(findex);
                                                   partialValues.value = partialValues.value
          .where((item) => !item.startsWith('${ldata?.orderId}#'))
          .toList();
                                                  getTotalAmount(); // Clear the error message if input is empty
                                                }
                                              },   
                                                ),
                                        //         vericalSpaceSmall,
                                        //  !errorMessage.value.contains(findex) && (controllers.value[findex]?.text.isNotEmpty??false)   ?   ButtonWidget(
                                        //           width: swidth/3,
                                        //           onPressed: (){
                                        //           FocusScope.of(context).unfocus();
                                        //          handleTextChanged(
                                        //   controllers.value[findex]!.text   , findex, ldata?.orderId);
                                        //         }, buttonName: 'Confirm', buttonColor: appColor):ButtonWidget1(buttonName: 'Confirm', buttonColor: greyColor,
                                        //         width: swidth/3,)
                                          ],
                                        )
                                      ):    Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children:[
                               Container(),
                                TextViewMedium(name: '${d?.instNo??'Inst no'}',textColors: appColor,fontWeight: FontWeight.w700,fontSize: ApiConstant.langCode=='ta'?11.sp:null),
                                 TextViewMedium(name: '${d?.status??'Status'}',textColors: appColor,fontWeight: FontWeight.w700,fontSize: ApiConstant.langCode=='ta'?11.sp:null),
                                  TextViewMedium(name: '${d?.date??'Date'}',textColors: appColor,fontWeight: FontWeight.w700,fontSize: ApiConstant.langCode=='ta'?11.sp:null),
                                   TextViewMedium(name: '${d?.amount??'Amount'}',textColors: appColor,fontWeight: FontWeight.w700,fontSize: ApiConstant.langCode=='ta'?11.sp:null),
                              ]),
                              vericalSpaceSmall,
                              SizedBox(
                                height:sheight/3,
                                child: Scrollbar(
                                  child: ListView.builder(
                                   scrollDirection: Axis.vertical,
                                    physics:AlwaysScrollableScrollPhysics(),
                                    itemCount: ldata?.dues?.length,
                                    itemBuilder: (context,dueindex){
                                      var dues= ldata?.dues?[dueindex];
                                      String sIndex='$findex$dueindex';
                                      String sDue='${ldata?.orderId}#${dues?.dateValue}#${dues?.payableAmount}';
                                      print(dues?.checkable==true);
                                    return Column(
                                      children: [
                                        

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                                                       dues?.checkable==true?     Checkbox(
                                              splashRadius: 10,
                                             activeColor: appColor, 
                                             
                                              value:selectedDues.value.contains(sDue) , onChanged: (p0){
                                                 
                                              if(p0==true){
                                              
                                              
                                                
                                              selectedDues.value =List.from(selectedDues.value)..add(sDue);
                                        print(selectedDues.value);
                                        
                                        
                                        
                                                    getTotalAmount();
                                                   
                                                    }
                                                    else{
                                                     
                                                    selectedDues.value=List.from(selectedDues.value)..remove(sDue);
                                                   
                                          print(selectedDues.value);
                                      
                                                    getTotalAmount();
                                                    }
                                            },):
                                                Padding(
                                                  padding:  EdgeInsets.all(24),
                                                  child: Container(),
                                                ),
                                              
                                            
                                             Expanded(
                                               child: Row(
                                                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                             children: [
                                                                           TextViewMedium(name:dues?.installmentNo.toString(), fontWeight: FontWeight.w700,),
                                                                           horizontalSpaceSmall,
                                                                           _icon(dues?.paidStatus,dues?.progress,dues?.paidAmount,dues?.payableAmount),
                                                                           TextViewMedium(name:dues?.date ),
                                                                           TextViewMedium(name:'₹${ dues?.amount}'),
                                                                          
                                                                           
                                                                             ],
                                                                           ),
                                             )
                                          ],
                                        ),
                                        Divider()
                                      ],
                                    );
                                   
                                      
                                      
                                   
                                  }),
                                ),
                              ),
                            ],
                          )
                        ],
                    ):Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            TextViewLarge(title:ldata?.planName,textcolor: appColor,
                            fontWeight: FontWeight.w900,),
                            RowTextWidget(title: '${d?.passbookNumber??'Passbook Number'}',value:ldata?.accountNo ,),
                           
                            RowTextWidget(title: '${d?.group??'Group'}', value:ldata?.planGroup ),
                            Row(
                              children: [
                                  TextViewSmall(title:'${d?.dueAmount??'Due Amount'} : ',textcolor: blackColor,),
                                BigAmountWidget(rupees:ldata?.paymentAmount ),
                              ],
                            ),
                            
                             vericalSpaceMedium,
                            TextForm(keyboardType:TextInputType.number ,
                                            controller: flexiController,
                                            type: 'ruppee',
                                            
                                            isDense:false,
                                             labelText:'${d?.enterYourAmount?? 'Enter Your Amount'}', hintText: '${d?.enterYourAmount??'Enter Your Amount'}',
                                             onChanged: (value) {
                                                if (value!=null && value.isNotEmpty  ) {
                                                  
                                                    handleTextChanged(
                                         flexiController.text   , findex, ldata?.orderId); // Clear the error message if valid
                                                  }
                                                else {

                                                
                                                   partialValues.value = partialValues.value
          .where((item) => !item.startsWith('${ldata?.orderId}#'))
          .toList();
                                                  getTotalAmount(); // Clear the error message if input is empty
                                                }
                                              },   
                                                ),

                          ],
                        ),
                      ),
                  ),
                );
              }):const JoinPlanWidget(),
            ),
            bottomNavigationBar:((data?.length ??0)>0 && amountNew.value>0)? Container(
               padding: EdgeInsets.only(bottom: bottomInset > 0 ? bottomInset : 0),
              child: Row(
               
                children: [
              Container(
                 height: sheight/15,
                width: swidth/2,
                decoration: BoxDecoration(
                  border: Border.all(color: appColor),color: whiteColor
                ),
                child: 
                 Center(child:Row(children: [
                  TextViewMedium(name:'      ${d?.total??'Total' }   : ',),
                  TextViewLarge(title: '₹${amountNew.value}',fontWeight: FontWeight.w700,textcolor: blackColor,)
                ],)),
              ),
        errorMessage.value.isEmpty?      InkWell(
                onTap: (){
                   context.router.push(SummaryScreen(payNowRequestModel: PayNowRequestModel(
                         userId: ApiConstant.userId,
                      lang: ApiConstant.langCode,
                      totalAmount: amount.value.toString(),
                      dues: selectedDues.value,
                      inputdues: partialValues.value
                      )));
                },
                child: Container(
                  height: sheight/15,
                  width: swidth/2,
                  decoration: BoxDecoration(
                    border: Border.all(color: appColor),color: appColor
                  ),
                  child: Center(child: TextViewMedium(name:'${d?.payNow?? 'Pay Now'}',textColors: whiteColor,
                  fontSize: ApiConstant.langCode=='ta'?10.sp:null),),
                ),
              ):Container(
                  height: sheight/15,
                  width: swidth/2,
                  decoration: BoxDecoration(
                    color: greyColor
                  ),
                  child: Center(child: TextViewMedium(name:'${d?.payNow?? 'Pay Now'}',
                  textColors: whiteColor,fontSize: ApiConstant.langCode=='ta'?10.sp:null),),
                ),
              
              
                
              ],),
            ):null,
          );
          }
          else{
           return CircularWidgetS(); 
          }
          }
          ),
      
    );
  }
}

class RowTextWidget extends StatelessWidget {
  String? title;
  String? value;
   RowTextWidget({required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextViewSmall(title:'$title : ',textcolor: blackColor,),
TextViewMedium(name: value,fontWeight: FontWeight.bold,textColors: blackColor,fontSize: 13,)
    ],);
  }
}

class BigAmountWidget extends StatelessWidget {
  String? rupees;
  Color? color;
   BigAmountWidget({required this.rupees,this.color});

  @override
  Widget build(BuildContext context) {
    return TextViewLarge(title: '₹$rupees',textcolor: color??blackColor,fontWeight: FontWeight.w700,);
  }
}

void _showPaymentDialog(BuildContext context,
      {required String paidAmount, required String pendingAmount}) {
         LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${d?.paymentDetails??'Payment Details'}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowBoldTextWidget(title: '${d?.paidAmount??'Paid Amount'}', value:'₹$paidAmount' ),
               RowBoldTextWidget(title: '${d?.pendingAmount??'Pending Amount'}', value: '₹$pendingAmount'), 
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
