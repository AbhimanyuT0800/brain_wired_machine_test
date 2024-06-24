import 'package:brainwired_machine_test/core/constants/images_constants.dart';
import 'package:brainwired_machine_test/core/constants/user_page_constants.dart';
import 'package:brainwired_machine_test/core/utils/dynamic_sizes.dart';
import 'package:brainwired_machine_test/model/user_details_model/user_details_model.dart';
import 'package:brainwired_machine_test/view/widgets/personal_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_launcher/map_launcher.dart';

class UserDetailsPage extends ConsumerWidget {
  final UserDetailsModel model;
  const UserDetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //user page constants(text)
    final userPageConsts = ref.read(userPageConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        ///navigate to home page
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
        ),
        title: Text(
          model.name ?? userPageConsts.txtUnknown,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenHeight(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: context.screenWidth(50),
              child: Text(
                model.username!.substring(0, 1),
                style: GoogleFonts.poppins(
                    fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              model.username ?? userPageConsts.txtUnknown,
              style: GoogleFonts.poppins(
                  fontSize: 26, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.screenHeight(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.mail_outlined),
                  Text(model.email ?? userPageConsts.txtUnknown),
                  Padding(
                    padding: EdgeInsets.only(left: context.screenWidth(20)),
                    child: const Icon(Icons.call),
                  ),
                  Text(model.phone ?? userPageConsts.txtUnknown)
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                userPageConsts.txtPersonalInfo,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
            ),
            PersonlaInfoWidget(userPageConsts: userPageConsts, model: model),
            Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.screenHeight(20)),
                  child: InkWell(
                    ///lauch google map with mapLancher
                    ///title set to the current city
                    onTap: () async {
                      final availableMaps = await MapLauncher.installedMaps;
                      await availableMaps.first.showMarker(
                        coords: Coords(double.parse(model.address!.geo!.lat!),
                            double.parse(model.address!.geo!.lng!)),
                        title: model.address!.street!,
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        ImagesConstants.imgMap,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
