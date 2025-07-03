import 'package:partyspot/module/settings/data/models/delete_user_response.dart';

abstract class SettingRepository {
  Future<DeleteUserResponse?> deleteAccount();
}
