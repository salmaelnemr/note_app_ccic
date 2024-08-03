
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/features/login/states.dart';
import '../../core/app_colors/app_colors.dart';
import '../../core/router_utils/route_utils.dart';
import '../../core/validator_utils/validator_utils.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_field.dart';
import '../sign_up/view.dart';
import 'cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Builder(
          builder: (context) {
            final cubit = BlocProvider.of<LoginCubit>(context);
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
                    height: 48.h,
                  ),
                  const AppText(
                    title: 'Login',
                    textAlign: TextAlign.center,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 64.h,
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
                  BlocBuilder<LoginCubit, LoginStates>(
                    builder: (context, state) {
                      return AppButton(
                       title: 'Login',
                       isLoading: state is LoginLoading,
                       onPressed: cubit.login,
                      );
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        title: 'Do not have an account?',
                        color: AppColors.gray,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      AppText(
                        title: 'Sign up!',
                        textDecoration: TextDecoration.underline,
                        onTap: () => RouteUtils.push(
                          const SignUpView(),
                        ),
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
