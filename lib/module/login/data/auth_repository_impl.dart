import 'dart:io';

import 'package:dio/dio.dart';
import 'package:partyspot/module/login/data/models/file_upload_response.dart';
import 'package:partyspot/module/login/data/models/login_response_model.dart';
import 'package:partyspot/module/login/data/models/phone_login_response.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class AuthRepositoryImpl extends PartySportApiService
    implements AuthRepository {
  @override
  Future<LoginResponse?> socialLogin({
    String? provider,
    String? idToken,
    String? pushToken,
  }) async {
    final response = await postRequest(
      ApiUrl.socialLogin,
      data: {
        'provider': provider,
        'id_token': idToken,
        if (pushToken?.isNotEmpty ?? false) 'deviceToken': pushToken,
      },
    );
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<UserLoginResponse?> phoneLogin({
    String? code,
    int? phoneNumber,
  }) async {
    final response = await postRequest(
      ApiUrl.loginPhone,
      data: {'code': code, 'phone': phoneNumber},
    );
    return UserLoginResponse.fromJson(response.data);
  }

  @override
  Future<UserLoginResponse?> resendOtp({String? code, int? phoneNumber}) async {
    final response = await postRequest(
      ApiUrl.resendOtp,
      data: {'code': code, 'phone': phoneNumber},
    );
    return UserLoginResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse?> verifyOTP({
    required String? code,
    required int? phoneNumber,
    required String? otp,
    String? pushToken,
  }) async {
    final response = await postRequest(
      ApiUrl.verifyOtp,
      data: {
        'code': code,
        'phone': phoneNumber,
        'otp': otp,
        if(pushToken?.isNotEmpty ?? false) 'deviceToken': pushToken,
      },
    );
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse?> updateProfile({
    String? fullName,
    String? gender,
    String? profilePicture,
    String? deviceToken,
    String? dob,
    String? email,
  }) async {
    final response = await putRequest(
      ApiUrl.profile,
      data: {
        'full_name': fullName,
        'gender': gender,
        'deviceToken': deviceToken,
        'profilePictureUrl': profilePicture,
        'email': email,
        'dob': dob,
      },
    );
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<FileUploadResponse?> uploadFile({File? file}) async {
    if (file == null || !file.existsSync()) {
      throw ErrorResponse(message: 'File is missing or invalid');
    }

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
    });

    final response = await postRequest(ApiUrl.fileUpload, data: formData);

    final fileUploadResponse = FileUploadResponse.fromJson(response.data);
    final uploadedUrl = fileUploadResponse.data?.url;

    print("Uploaded file URL: $uploadedUrl");

    if (uploadedUrl != null && uploadedUrl.isNotEmpty) {
      await updateProfile(profilePicture: uploadedUrl);
    }

    return fileUploadResponse;
  }

  @override
  Future<LoginResponse?> userDetail() async {
    final response = await getRequest(ApiUrl.getProfile);
    return LoginResponse.fromJson(response.data);
  }
}
