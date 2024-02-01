import 'package:flutter/material.dart';
import 'package:saidlity/core/styles/app_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * .04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * .06,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saidlity pharmacy',
                        style: AppFont.getTitleLargeFont(
                          context,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height * .03,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.pin_drop,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: screenSize.width * .04,
                  ),
                  Text(
                    'Pharmacy area',
                    style: AppFont.getSubtitle1(context, fontSize: 18),
                  ),
                  const Spacer(),
                  Text(
                    'Dubai Silicon Oasis',
                    style: AppFont.getCaptionFont(
                      context,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.black.withOpacity(
                        .6,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width * .11,
                ),
                child: Divider(
                  height: screenSize.height * .04,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: screenSize.width * .04,
                  ),
                  Text(
                    'Opening hours',
                    style: AppFont.getSubtitle1(context, fontSize: 18),
                  ),
                  const Spacer(),
                  Text(
                    '10:00AM - 3:00AM',
                    style: AppFont.getCaptionFont(
                      context,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.black.withOpacity(
                        .6,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width * .11,
                ),
                child: Divider(
                  height: screenSize.height * .04,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: screenSize.width * .04,
                  ),
                  Text(
                    'Phone Number',
                    style: AppFont.getSubtitle1(context, fontSize: 18),
                  ),
                  const Spacer(),
                  Text(
                    '01275318664',
                    style: AppFont.getCaptionFont(
                      context,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.black.withOpacity(
                        .6,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
