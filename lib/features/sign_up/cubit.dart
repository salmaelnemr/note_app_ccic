//import 'package:design5/features/sign_up/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/sign_up/states.dart';

import '../../core/caching_utils/caching_utils.dart';
import '../../core/network_utils/network_utils.dart';
import '../../core/router_utils/route_utils.dart';
import '../../widgets/snack_bar.dart';
import '../home/view.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInit());

  final formKey = GlobalKey<FormState>();
  String? name, email, password;

  Future<void> signUp() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return ;
    }
    emit(SignUpLoading());
    try {
      final response = await NetworkUtils.post(
        'auth/register',
        data: {
          "email": email,
          "password": password,
          "name": name,
        },
      );
      await CachingUtils.cacheUser(response.data);
      emit(SignUpInit());
      RouteUtils.pushAndPopAll(
        const HomeView(),
      );
    } on DioException catch (e) {
      showSnackBar(
        e.response?.data['message'] ?? '',
        error: true,
      );
    }
  }
}