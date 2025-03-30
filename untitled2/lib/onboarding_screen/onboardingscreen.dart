import 'package:flutter/material.dart';
import 'package:untitled2/onboarding_screen/widget/header.dart';
import 'package:untitled2/onboarding_screen/widget/next_page_button.dart';
import 'package:untitled2/onboarding_screen/widget/onboarding_page_indicator.dart';
import 'package:untitled2/onboarding_screen/widget/pages/community/community_dark_card_content.dart';
import 'package:untitled2/onboarding_screen/widget/pages/community/community_light_card_content.dart';
import 'package:untitled2/onboarding_screen/widget/pages/community/community_text_column.dart';
import 'package:untitled2/onboarding_screen/widget/pages/onboarding_page.dart';
import 'package:untitled2/onboarding_screen/widget/pages/relationships/relationships_dark_card_content.dart';
import 'package:untitled2/onboarding_screen/widget/pages/relationships/relationships_light_card_content.dart';
import 'package:untitled2/onboarding_screen/widget/pages/relationships/relationships_text_column.dart';
import 'package:untitled2/onboarding_screen/widget/pages/work/work_dark_card_content.dart';
import 'package:untitled2/onboarding_screen/widget/pages/work/work_light_card_content.dart';
import 'package:untitled2/onboarding_screen/widget/pages/work/work_text_column.dart';
import '../constants.dart';
import '../login/loginscreen.dart';



class Onboarding  extends StatefulWidget
{
  const Onboarding ({super.key});

  @override
  State<Onboarding > createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding > {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: kBrown,
      body: SafeArea
        (
        child: Column
          (
            children: <Widget>
            [
              Header(onSkip: _goToLogin),

              Expanded(child: _getpage()),

              OnboardingPageIndicator(
                currentPage: _currentPage,
                child: NextPageButton(onPressed: _nextPage),
              ),
            ]
        ),

      ),
    );
  }

  _goToLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }


  void _nextPage() {
    switch (_currentPage)
    {
      case 1:
        _setNextPage(2);
        break;
      case 2:
        _setNextPage(3);
        break;
      case 3:
        _goToLogin();
        break;
    }
  }

  Widget _getpage() {
    switch (_currentPage) {
      case 1:
        return const OnboardingPage(
          number: 1,
          lightCardChild: CommunityLightCardContent(),
          darkCardChild: CommunityDarkCardContent(),
          textColumn: CommunityTextColumn(),
        );
      case 2:
        return const OnboardingPage(
          number: 2,
          lightCardChild: EducationLightCardContent(),
          darkCardChild: EducationDarkCardContent(),
          textColumn: EducationTextColumn(),
        );
      case 3:
        return const OnboardingPage(
          number: 3,
          lightCardChild: WorkLightCardContent(),
          darkCardChild: WorkDarkCardContent(),
          textColumn: WorkTextColumn(),
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }
}