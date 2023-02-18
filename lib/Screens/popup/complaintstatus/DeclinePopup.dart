import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart_admin_web/Screens/ScreenMain.dart';
import '../../../Controller/complainController.dart';
import '../../../helpers/dimensions.dart';
import '../../../helpers/inputBox.dart';

final ctrl = Get.put(ComplaintContoller());

//complaint decline alert popup

Future DeclinePopup(BuildContext ctx, var complaintid) async {
  return showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.height25),
                  bottomLeft: Radius.circular(Dimensions.height25))),
          content: Container(
            width: 500,
            height: 300,
            padding: EdgeInsets.all(11),
            color: Colors.white,
            child: Obx(
              () => (ctrl.loading == true)
                  ? CircularProgressIndicator()
                  : ListView(children: [
                      Center(
                          child: Text('Decline',
                              style: GoogleFonts.poppins(fontSize: 30))),
                      SizedBox(
                        height: 10,
                      ),
                      //description box
                      TextFormField(
                        controller: ctrl.declineDescription,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: inputBoxes()
                            .maininputDecoration
                            .copyWith(label: const Text('Description')),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (ctrl.declineDescription == '') {
                            Get.snackbar('Description',
                                'Add description before submitting');
                            return;
                          }
                          //
                          ctrl.DeclineWork(complaintid);
                          Get.offAll(ScreenMain());
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 183, 240),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height12)),
                          child: const Center(
                              child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Close'))
                    ]),
            ),
          ),
        );
      });
}