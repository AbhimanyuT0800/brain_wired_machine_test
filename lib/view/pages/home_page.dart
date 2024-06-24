import 'package:brainwired_machine_test/core/colors/colorpallet.dart';
import 'package:brainwired_machine_test/core/constants/user_page_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //user page constants(text)
    final userPageConsts = ref.read(userPageConstantsProvider);

    return Scaffold(
      backgroundColor: ColorPallets.bgColor,
      appBar: AppBar(
        backgroundColor: ColorPallets.bgColor,
        centerTitle: true,
        title: Text(
          userPageConsts.txtTitle,
          style: GoogleFonts.poppins(),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            title: Text('data'),
          );
        },
      ),
    );
  }
}
