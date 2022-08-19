import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_one/componant/add_credit_debit_card.dart';
import 'package:project_one/screens/Add_pages/add_study/add_study_binding.dart';
import 'package:project_one/screens/Add_pages/add_trainig/add_training_binding.dart';
import 'package:project_one/screens/Add_pages/add_trainig/add_training_page.dart';
import 'package:project_one/screens/Add_pages/add_work/add_work_binding.dart';
import 'package:project_one/screens/applying/applyWarrenty/applyWarentyPage.dart';
import 'package:project_one/screens/donat/donaton_binding.dart';
import 'package:project_one/screens/edite/editStudyZone/edit_study_binding.dart';
import 'package:project_one/screens/edite/edite%20beneficiary/edite_beneficiary.dart';
import 'package:project_one/screens/edite/edite%20beneficiary/edite_beneficiary_binding.dart';
import 'package:project_one/screens/edite/edite%20work/edit_work_page.dart';
import 'package:project_one/screens/job_oppertenty/job_opportuity_binding.dart';
import 'package:project_one/screens/job_oppertenty/job_opportunity.dart';
import 'package:project_one/screens/login/loginBinding.dart';
import 'package:project_one/screens/login/loginpage.dart';
import 'package:project_one/screens/notification/notification_page.dart';
import 'package:project_one/screens/rigester/registerbinding.dart';
import 'package:project_one/screens/setting/setting_binding.dart';
import 'package:project_one/screens/setting/setting_psge.dart';
import 'package:project_one/screens/study_zone/studyZon_binding.dart';
import 'package:project_one/screens/training_opportunity/trainig_opportunity_page.dart';
import 'package:project_one/screens/training_opportunity/training_opprtunity_binding.dart';
import 'package:project_one/screens/user_home/user_home_binding.dart';
import 'package:project_one/screens/user_profile/user_profile_binding.dart';
import 'package:project_one/screens/user_profile/user_profile_page.dart';
import 'package:project_one/screens/warrenty/warrently_binding.dart';
import 'package:project_one/screens/warrenty/warrenty_page.dart';
import 'package:project_one/screens/study_zone/study_zones.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_one/screens/Add_pages/add_beneficiary/add_beneficiary_page.dart';
import 'package:project_one/screens/Add_pages/add_scolarship/add_scolarship_page.dart';
import 'package:project_one/screens/Add_pages/add_study/add_study_page.dart';
import 'package:project_one/screens/Add_pages/add_work/add_work_page.dart';
import 'package:project_one/screens/admin_home/admin_home_page.dart';
import 'package:project_one/screens/beneficiary_home/beneficiary.dart';
import 'package:project_one/screens/challenges/chaleenges_page.dart';
import 'package:project_one/screens/charity_profile/charity_profile.dart';
import 'package:project_one/screens/charity_profile/charity_profile_binding.dart';
import 'package:project_one/screens/donat/donat_page.dart';
import 'package:project_one/screens/rigester/rigester.dart';
import 'package:project_one/screens/statistics/statistics_binding.dart';
import 'package:project_one/screens/statistics/statistics_page.dart';
import 'package:project_one/screens/user_home/user_home.dart';
import 'const.dart';
import 'screens/Add_pages/add_beneficiary/add_benificiary_binding.dart';
import 'screens/Add_pages/add_challenge/add_chaleenge_binding.dart';
import 'screens/Add_pages/add_challenge/add_challenge.dart';
import 'screens/Add_pages/add_scolarship/add_scolarship_binding.dart';
import 'screens/applying/applyWarrenty/applyWarrentyBinding.dart';
import 'screens/applying/applyscolarshipbinding/applyScolarShipPage.dart';
import 'screens/applying/applyscolarshipbinding/applyscolarshipBinding.dart';
import 'screens/beneficiary_home/beneficiary_binding.dart';
import 'screens/challenges/challenge_binding.dart';
import 'screens/edite/editStudyZone/edit_study_page.dart';
import 'screens/edite/editTraining/edit_training_binding.dart';
import 'screens/edite/editTraining/edit_training_page.dart';
import 'screens/edite/edite work/edit_work_binding.dart';
import 'screens/landing/onboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/scolarship/scolarship_binding.dart';
import 'screens/scolarship/scolarship_page.dart';
import 'package:easy_localization/easy_localization.dart';

SharedPreferences? shared;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  shared = await SharedPreferences.getInstance();

  runApp(EasyLocalization(
      child: const MyApp(),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations'));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Project one',
      theme: Get.isDarkMode ? Themes.customdarktheme : Themes.customlighttheme,
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/Add_study',
            page: () => AddStudy(),
            binding: AddStudyZoneBinding()),
        GetPage(
            name: '/ApplayScolarShip',
            page: () => ApplayScolarShip(),
            binding: ApplyScoalrShipBinding()),
        GetPage(
            name: '/EditeWork',
            page: () => EditWork(),
            binding: EditWorkBinding()),
        GetPage(
            name: '/EditStudy',
            page: () => EditStudy(),
            binding: EditStudyZoneBinding()),
        GetPage(
            name: '/ApplyWarrenty',
            page: () => ApplyWarrenty(),
            binding: ApplyWarrentyBinding()),
        GetPage(
            name: '/Add_Work',
            page: () => AddWork(),
            binding: AddWorkBinding()),
        GetPage(
            name: '/Add_Trining',
            page: () => AddTraining(),
            binding: AddTrainingBinding()),
        GetPage(
            name: '/Add_scolarship',
            page: () => AddScolar(),
            binding: AddScolarshipBinding()),
        GetPage(
            name: '/setting',
            page: () => SettingPage(),
            binding: SettingBinding()),
        GetPage(
            name: '/Add_beneficiary',
            page: () => AddBeneficiary(),
            binding: AddBenificaryBinding()),
        GetPage(
            name: '/addchalenge',
            page: () => AddChallenge(),
            binding: AddChallengeBinding()),
        GetPage(name: '/Login', page: () => Login(), binding: LoginBinding()),
        GetPage(
          name: '/TrainingOpportunity',
          page: () => TrainingOpportunityPage(),
          binding: TriningOpprtunityBinding(),
        ),
        GetPage(
            name: '/Studyzone',
            page: () => StudyZonesPage(),
            binding: StudyZoneBinding()),
        GetPage(
            name: '/Donat',
            page: () => DonatPage(),
            binding: DonationBinding()),
        GetPage(
            name: '/Register',
            page: () => Register(),
            binding: RegisterBinding()),
        GetPage(
            name: '/Warrenty',
            page: () => Warrenty(),
            binding: WarrentyBinding()),
        GetPage(
          name: '/',
          page: () => OnBoardPAge(), /*middlewares: [AuthMiddlwar()]*/
        ),
        GetPage(
            name: '/UserHome',
            page: () => UserHome(),
            binding: UserHomeBinding()),
        GetPage(
            name: '/Charity_profile',
            page: () => CharityProfile(),
            binding: CharityProfileBinding()),
        GetPage(
            name: '/Challenges',
            page: () => ChallengesPage(),
            binding: ChallengeBinding()),
        GetPage(name: '/Admin_Home', page: () => AdminHome()),
        GetPage(
            name: '/Beneficiary',
            page: () => Beneficiary(),
            binding: BeneficiaryBindind()),
        GetPage(
            name: '/Statistics',
            page: () => StatisticsPage(),
            binding: StatisticsBinding()),
        GetPage(
          name: '/AddCreditCard',
          page: () => const AddCreditCard(),
        ),
        GetPage(
          name: '/UserProfile',
          page: () => UserProfile(),
          binding: UserProfileBinding(),
        ),
        GetPage(
          name: '/editeTrainingOpportunity',
          page: () => EditTraining(),
          binding: EditTrainingBinding(),
        ),
        GetPage(
          name: '/editeBeneficiary',
          page: () => EditBeneficiary(),
          binding: EditBeneficiaryBinding(),
        ),
        GetPage(
          name: '/jobOpportunity',
          page: () => JobOpportunityPage(),
          binding: JobBinding(),
        ),
        GetPage(
          name: '/Notification',
          page: () => const NotificationPage(),
        ),
        GetPage(
            name: '/Scoraleerchape',
            page: () => ScolarShipPage(),
            binding: ScolarShipBinding()),
      ],
      builder: EasyLoading.init(),
    );
  }
}
