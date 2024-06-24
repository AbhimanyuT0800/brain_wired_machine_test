import 'package:brainwired_machine_test/controller/fetch_all_user_data_provider.dart';
import 'package:brainwired_machine_test/core/colors/colorpallet.dart';
import 'package:brainwired_machine_test/core/constants/user_page_constants.dart';
import 'package:brainwired_machine_test/core/utils/dynamic_sizes.dart';
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
        body: ref.watch(fetchAllUserDataProvider).when(
              data: (data) {
                return ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.screenWidth(10),
                      ),
                      child: Container(
                        height: context.screenHeight(70),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorPallets.white500,
                          border: Border.all(color: ColorPallets.borderColor),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text('data'),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: context.screenHeight(10),
                  ),
                );
              },
              error: (error, stackTrace) => Center(
                child: Column(
                  children: [
                    Text(error.toString()),
                    IconButton(
                        onPressed: () {
                          ref.invalidate(fetchAllUserDataProvider);
                        },
                        icon: Icon(Icons.refresh_outlined))
                  ],
                ),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
