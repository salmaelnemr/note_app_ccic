
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/features/sign_up/states.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/router_utils/route_utils.dart';
import '../../core/validator_utils/validator_utils.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_field.dart';
import 'cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: const AppAppBar(
          enableBackButton: true,
        ),
        body:  Builder(
          builder: (context) {
            final cubit = BlocProvider.of<SignUpCubit>(context);
            return Form(
              key: cubit.formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  const AppText(
                    title: 'Notes App',
                    textAlign: TextAlign.center,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const AppText(
                    title: 'Sign up',
                    textAlign: TextAlign.center,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AppTextField(
                    hint: 'Name',
                    onSaved: (v) => cubit.name = v,
                    validator: ValidatorUtils.name,
                  ),
                  const Divider(
                    height: 20,
                    color: AppColors.gray,
                  ),
                  AppTextField(
                    hint: 'Email',
                    onSaved: (v) => cubit.email = v,
                    validator: ValidatorUtils.email,
                  ),
                  const Divider(
                    height: 20,
                    color: AppColors.gray,
                  ),
                  AppTextField(
                    hint: 'Password',
                    onSaved: (v) => cubit.password = v,
                    validator: ValidatorUtils.password,
                  ),
                  SizedBox(
                    height: 64.h,
                  ),
                  //isLoading ? Center(child: CircularProgressIndicator(),):
                  BlocBuilder<SignUpCubit, SignUpStates>(
                    builder: (context, state) {
                      return AppButton(
                      isLoading: state is SignUpLoading,
                      title: 'Sign up',
                      onPressed: cubit.signUp,
                    );
                    },
                  ),
                  SizedBox(height: 40.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        title: 'Do you have an account?',
                        color: AppColors.gray,
                      ),
                      SizedBox(width: 4.w,),
                      AppText(
                        title: 'Login',
                        textDecoration: TextDecoration.underline,
                        onTap: () => RouteUtils.pop(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
