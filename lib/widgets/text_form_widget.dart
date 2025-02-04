
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kasnew/utils/constant.dart';



class TextForm extends StatelessWidget {
  final String? labelText;
  final String ?hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  final String? Function(String?)? validating;
  String? defaultValue;
final String? Function(String?)? onSaved;
IconData? iconData;
bool? readOnly;
VoidCallback? onTap;
int? maxLines;
String? type;
double? padding;
TextAlign? textAlign;
String? errorText;
bool?isDense;
int? charLength;
FocusNode? focusNode;
final String? Function(String?)? onChanged;
Color? blurColor;
double?fontSize;
 TextForm({
    super.key,
 this.controller,
    required this.keyboardType,
     this.labelText,
  this.hintText,
     this.validating,
     this.defaultValue,
     this.onSaved,
     this.iconData,
     this.readOnly,
     this.onTap,
     this.maxLines,
     this.type,
     this.onChanged,
     this.textAlign,
     this.isDense,
this.padding,
this.fontSize,
this.errorText,
this.charLength,
this.focusNode,
this.blurColor

  });

  bool _obscureText = false;

  @override
  

  @override
  Widget build(BuildContext context) {
     List<TextInputFormatter> inputFormatters = [];
    if(type == 'mobileNumber') {
      inputFormatters = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ];
    }
     if(type == 'mpin') {
      inputFormatters = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
      ];
      
    }
     if(type == 'name') {
      inputFormatters = [
         FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
        LengthLimitingTextInputFormatter(25),
      ];
      
    }
    if(type == 'refCode') {
      inputFormatters = [
        
        LengthLimitingTextInputFormatter(6),
      ];
      
    }
    if((charLength??0)>0) {
      inputFormatters = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(charLength),
      ];
      
    }
     if(type == 'pincode') {
      inputFormatters = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(6),
      ];
      
    }
      if(type == 'dob') {
        inputFormatters = [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(8), // Max length for DDMMYYYY
            _DateInputFormatter(),
          ];
      
    }
   var isFirstTime=true;
  if(defaultValue?.isNotEmpty ==true &&  controller?.text.isEmpty == true && isFirstTime){
      controller?.text = defaultValue??"";
      isFirstTime = false;
    }
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      obscureText: _obscureText, // Use the class-level _obscureText
      textInputAction: TextInputAction.next,
      onTap: onTap,
      maxLines: maxLines??1,
       textAlign: textAlign?? TextAlign.start,
      style: TextStyle(fontSize: fontSize,color: blurColor??null),
    focusNode: focusNode,
      onChanged: onChanged,
       inputFormatters:inputFormatters,
      keyboardType: keyboardType,
    readOnly: readOnly??false,
      decoration: InputDecoration(
enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: blurColor ??Color(0xFF000000)), // Handle unfocused border color
  ),
        floatingLabelStyle: TextStyle(color:blurColor?? appColor),
        errorText: errorText??null,
        isDense:isDense?? true,
        filled: true,
         contentPadding: EdgeInsets.all(padding??12),
       fillColor: whiteColor,
        labelText: labelText,
        hintText: hintText,
      
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:blurColor?? appColor),
          
        ),
        prefixIcon:type=='ruppee' ?Icon(Icons.currency_rupee_sharp):null,
        hintStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.grey,
        ),
        border:  OutlineInputBorder(
          borderSide: BorderSide(color:blurColor?? Colors.grey),
        ),
        // No suffix icon for other fields
      ),
      validator: validating,
    );
  }
}
// class _DateInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     String text = newValue.text;

//     // Maintain slashes at their correct positions
//     StringBuffer buffer = StringBuffer();
//     int selectionIndex = newValue.selection.baseOffset;

//     // Handle the input: format it to DD/MM/YYYY
//     for (int i = 0; i < text.length; i++) {
//       if (i == 2 || i == 5) {
//         buffer.write('/'); // Add slash after 2nd and 5th characters
//       }
//       buffer.write(text[i]); // Add the character to the buffer
//     }

//     String formattedText = buffer.toString();

//     // Limit input to 10 characters (DD/MM/YYYY)
//     if (formattedText.length > 10) {
//       formattedText = formattedText.substring(0, 10);
//     }

//     // Correct cursor positioning to skip over slashes
//     if (newValue.text.length > oldValue.text.length) {
//       if (selectionIndex == 2 || selectionIndex == 5) {
//         selectionIndex++; // Adjust the selection index if slash is inserted
//       }
//     }

//     return TextEditingValue(
//       text: formattedText,
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
// }

// class _DateInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     String newText = newValue.text.replaceAll('/', ''); // Remove existing slashes

//     // Limit input length to prevent errors
//     if (newText.length > 8) {
//       newText = newText.substring(0, 8);
//     }

//     final buffer = StringBuffer();
//     int selectionIndex = newValue.selection.end;

//     // Insert slashes at correct positions
//     for (int i = 0; i < newText.length; i++) {
//       if (i == 2 || i == 4) {
//         buffer.write('/');
//         if (i < selectionIndex) selectionIndex++;
//       }
//       buffer.write(newText[i]);
//     }

//     // Pad with placeholders if input is incomplete
//     while (buffer.length < 10) {
//       if (buffer.length == 2 || buffer.length == 5) {
//         buffer.write('/');
//       } else if (buffer.length < 2) {
//         buffer.write('D');
//       } else if (buffer.length < 5) {
//         buffer.write('M');
//       } else {
//         buffer.write('Y');
//       }
//     }

//     String formattedText = buffer.toString();

//     // Validate date for future restriction
//     if (_isFutureDate(formattedText)) {
//       return oldValue; // Revert to old value if the date is in the future
//     }

//     // Return the updated text and adjusted cursor position
//     return TextEditingValue(
//       text: formattedText,
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }

//   bool _isFutureDate(String date) {
//     try {
//       // Parse the entered date
//       final parts = date.split('/');
//       if (parts.length < 3) return false;

//       int day = int.tryParse(parts[0].replaceAll('D', '')) ?? 0;
//       int month = int.tryParse(parts[1].replaceAll('M', '')) ?? 0;
//       int year = int.tryParse(parts[2].replaceAll('Y', '')) ?? 0;

//       if (day == 0 || month == 0 || year == 0) return false;

//       final enteredDate = DateTime(year, month, day);
//       final currentDate = DateTime.now();

//       // Compare entered date with the current date
//       return enteredDate.isAfter(currentDate);
//     } catch (e) {
//       return false; // If parsing fails, consider it invalid
//     }
//   }
// }

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll('/', ''); // Remove slashes

    // Limit input length
    if (newText.length > 8) {
      newText = newText.substring(0, 8);
    }

    final buffer = StringBuffer();
    int selectionIndex = newValue.selection.end;

    // Insert slashes at the correct positions
    for (int i = 0; i < newText.length; i++) {
      if (i == 2 || i == 4) {
        buffer.write('/');
        if (i < selectionIndex) selectionIndex++;
      }
      buffer.write(newText[i]);
    }

    // Add placeholders if input is incomplete
    while (buffer.length < 10) {
      if (buffer.length == 2 || buffer.length == 5) {
        buffer.write('/');
      } else if (buffer.length < 2) {
        buffer.write('D');
      } else if (buffer.length < 5) {
        buffer.write('M');
      } else {
        buffer.write('Y');
      }
    }

    String formattedText = buffer.toString();

    // Validate the date
    if (_isFutureDate(formattedText)) {
      return oldValue; // Revert to the previous value if the date is invalid
    }

    // Ensure the cursor stays within valid bounds
    selectionIndex = selectionIndex.clamp(0, formattedText.length);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  /// Validates whether the entered date is in the future
  bool _isFutureDate(String date) {
    try {
      final parts = date.split('/');
      if (parts.length != 3) return false;

      int day = int.tryParse(parts[0].replaceAll('D', '')) ?? 0;
      int month = int.tryParse(parts[1].replaceAll('M', '')) ?? 0;
      int year = int.tryParse(parts[2].replaceAll('Y', '')) ?? 0;

      if (day == 0 || month == 0 || year == 0) return false;

      final enteredDate = DateTime(year, month, day);
      final currentDate = DateTime.now();

      return enteredDate.isAfter(currentDate);
    } catch (e) {
      return false; // Treat parsing errors as invalid dates
    }
  }
}
