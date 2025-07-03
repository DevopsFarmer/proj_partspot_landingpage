import 'package:partyspot/module/settings/data/models/delete_user_response.dart';
import 'package:partyspot/module/settings/domain/repositories/setting_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class SettingRepositoryImpl extends PartySportApiService implements SettingRepository {
  @override
    Future<DeleteUserResponse> deleteAccount()async{
    final response = await deleteRequest(ApiUrl.users);
    return DeleteUserResponse.fromJson(response.data);
  }
}