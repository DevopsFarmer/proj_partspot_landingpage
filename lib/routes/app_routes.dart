import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/presentation/binding/app_entry_binding.dart';
import 'package:partyspot/module/app_entry/presentation/view/app_entry_screen.dart';
import 'package:partyspot/module/bookings/presentation/binding/booking_binding.dart';
import 'package:partyspot/module/bookings/presentation/view/booking_screen.dart';
import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';
import 'package:partyspot/module/curated_events_list/presentation/view/curated_events_list_screen.dart';
import 'package:partyspot/module/event_info/binding/curated_event_info_binding.dart';
import 'package:partyspot/module/event_info/presentation/curated_event_info_screen.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/module/plan_a_wedding/data/models/plan_event_response.dart';
import 'package:partyspot/module/profile/binding/profile_binding.dart';
import 'package:partyspot/module/profile/binding/user_detail_binding.dart';
import 'package:partyspot/module/profile/view/profile_screen.dart';
import 'package:partyspot/module/login/presentation/binding/otp_binding.dart';
import 'package:partyspot/module/plan_a_wedding/presentation/wedding_way_selection_screen.dart';
import 'package:partyspot/module/plan_your_event/presentation/plan_your_event_screen.dart';
import 'package:partyspot/module/profile/view/user_detail_screen.dart';
import 'package:partyspot/module/representative/binding/representative_binding.dart';
import 'package:partyspot/module/representative/view/representative_screen.dart';
import 'package:partyspot/module/self_hosted_party/presentation/self_host_part_selection_screen.dart';
import 'package:partyspot/module/settings/presentation/binding/settings_binding.dart';
import 'package:partyspot/module/settings/presentation/view/settings_screen.dart';
import 'package:partyspot/module/vip_plans/binding/beast_binding.dart';
import 'package:partyspot/module/vip_plans/view/beast_plan.dart';
import 'package:partyspot/module/explore/binding/explore_binding.dart';
import 'package:partyspot/module/explore/view/explore_screen.dart';
import 'package:partyspot/module/login/presentation/binding/login_binding.dart';
import 'package:partyspot/module/login/presentation/view/login_screen.dart';
import 'package:partyspot/module/login/presentation/view/otp_screen.dart';
import 'package:partyspot/module/onboarding/presentation/binding/onboarding_binding.dart';
import 'package:partyspot/module/onboarding/presentation/view/onboarding_screen.dart';
import 'package:partyspot/module/party_spot_vip/binding/vip_binding.dart';
import 'package:partyspot/module/party_spot_vip/view/vip_screen.dart';
import 'package:partyspot/module/plan_a_wedding/presentation/plan_a_wedding_overview_screen.dart';
import 'package:partyspot/module/self_hosted_party/presentation/self_hosted_overview_screen.dart';
import 'package:partyspot/module/splash/presentation/binding/splash_binding.dart';
import 'package:partyspot/module/splash/presentation/view/splash_screen.dart';
import 'package:partyspot/module/vip_plans/view/monster_plan_screen.dart';
import 'package:partyspot/routes/routes_const.dart';

class AppRoutes {
  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: '/',
        transition: Transition.circularReveal,
        page: () => SplashScreen(),
        binding: SplashBinding(),
      ),

      GetPage(
        name: Routes.appEntryScreen,
        page: () => AppEntryScreen(),
        binding: AppEntryBinding(),
      ),

      GetPage(
        name: Routes.onBoardingScreen,
        transition: Transition.circularReveal,
        page: () => OnboardingScreen(),
        binding: OnboardingBinding(),
      ),

      GetPage(
        name: Routes.loginScreen,
        transition: Transition.circularReveal,
        page: () => LoginScreen(),
        binding: LoginBinding(),
      ),

      GetPage(
        name: Routes.otpScreen,
        transition: Transition.circularReveal,
        page: () {
          final int? phoneNumber =
              Get.arguments?[RoutesArgument.phoneNumber] ?? 0;
          final String? code = Get.arguments?[RoutesArgument.code] ?? '';
          return OtpScreen(phoneNumber: phoneNumber, code: code);
        },
        binding: OtpBinding(),
      ),
      GetPage(
        name: Routes.exploreScreen,
        transition: Transition.circularReveal,
        page: () => ExploreScreen(),
        binding: ExploreBinding(),
      ),
      GetPage(
        name: Routes.curatedEventsListScreen,
        transition: Transition.circularReveal,
        page: () {
          final String? eventId = Get.arguments?[RoutesArgument.eventId] ?? '';
          return CuratedEventsListScreen(eventId: eventId);
        },
        // binding: CuratedEventListBinding(),
      ),
      GetPage(
        name: Routes.curatedEventInfoScreen,
        transition: Transition.circularReveal,
        page: () {
          final Datum? partyInfo = Get.arguments?[RoutesArgument.curatedPartyInfo];
          return EventInfoScreen(curatedEventList: partyInfo);
        },
        binding: CuratedEventInfoBinding(),
      ),

      GetPage(
        name: Routes.selfHostedOverviewScreen,
        transition: Transition.circularReveal,
        page: () {
          final List<EventSubType?>? subTypes = Get.arguments?[RoutesArgument.subTypes] ?? [];
          final List<Venue?>? venueTypes = Get.arguments?[RoutesArgument.venueTypes] ?? [];
          final List<FoodPref?>? foodPreferences = Get.arguments?[RoutesArgument.foodPreferences] ?? [];
          final EventType? eventType = Get.arguments?[RoutesArgument.eventType] ?? [];

          return SelfHostedOverviewScreen(subTypes: subTypes,foodPreferences: foodPreferences,venueTypes: venueTypes,eventType: eventType);
        },
      ),
      GetPage(
        name: Routes.planAWeddingOverviewScreen,
        transition: Transition.circularReveal,
        page: () {
          final List<EventSubType?>? subTypes = Get.arguments?[RoutesArgument.subTypes] ?? [];
          final List<Venue?>? venueTypes = Get.arguments?[RoutesArgument.venueTypes] ?? [];
          final List<FoodPref?>? foodPreferences = Get.arguments?[RoutesArgument.foodPreferences] ?? [];
          final EventType? eventType = Get.arguments?[RoutesArgument.eventType] ?? [];

          return PlanAWeddingOverviewScreen(subTypes: subTypes,foodPreferences: foodPreferences,venueTypes: venueTypes,eventType: eventType,);
        },
      ),
      GetPage(
        name: Routes.VipScreen,
        transition: Transition.circularReveal,
        page: () => VipScreen(),
        binding: VipBinding(),
      ),

      GetPage(
        name: Routes.settingsScreen,
        transition: Transition.circularReveal,
        page: () => SettingsScreen(),
        binding: SettingsBinding(),
      ),

      GetPage(
        name: Routes.beastPlanScreen,
        transition: Transition.circularReveal,
        page: () => BeastPlanScreen(),
        binding: BeastMonsterBinding(),
      ),

      GetPage(
        name: Routes.monsterPlanScreen,
        transition: Transition.circularReveal,
        page: () => monsterPlanScreen(),
        binding: BeastMonsterBinding(),
      ),
      GetPage(
        name: Routes.representativeScreen,
        transition: Transition.circularReveal,
        page: () {
          final AssignedAgent? assignedAgent = Get.arguments?[RoutesArgument.assignedAgent] ?? [];
          return  RepresentativeScreen(assignedAgent: assignedAgent);
        },
        binding: RepresentativeBinding(),
      ),
      GetPage(
        name: Routes.selfHostedPartySelectionScreen,
        transition: Transition.circularReveal,
        page: () => SelfHostPartSelectionScreen(),
      ),
      GetPage(
        name: Routes.weddingWaySelectionScreen,
        transition: Transition.circularReveal,
        page: () => WeddingWaySelectionScreen(),
      ),
      GetPage(
        name: Routes.planEventScreen,
        transition: Transition.circularReveal,
        page: () {
          final String? title = Get.arguments?[RoutesArgument.title] ?? '';
          return PlanYourEventScreen(title: title);
        },
      ),

      GetPage(
        name: Routes.profileScreen,
        transition: Transition.circularReveal,
        page: () => ProfileScreen(),
        binding: ProfileBinding(),
      ),

      GetPage(
        name: Routes.bookingScreen,
        transition: Transition.circularReveal,
        page: () => BookingScreen(),
        binding: BookingBinding(),
      ),

      GetPage(
        name: Routes.userDetailScreen,
        transition: Transition.circularReveal,
        page: () {
          final bool? fromEdit =
              Get.arguments?[RoutesArgument.fromEdit] ?? false;

          return UserDetailScreen(fromEdit: fromEdit);
        },
        binding: UserDetailBinding(),
      ),
    ];
  }
}
