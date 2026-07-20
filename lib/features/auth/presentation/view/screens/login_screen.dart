import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/constants/app_string.dart';
import 'package:online_exam_app/core/theme/app_color.dart';
import 'package:online_exam_app/features/auth/domain/entity/request/login/login_request.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_states.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_view_model.dart';
import '../../../../../config/services/shared_prefs_service.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../../../../core/validators.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe =false;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.w,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          AppStrings.login,
          style: AppTextStyle.med20Black,
        ),
        centerTitle: false,
      ),

      body: BlocConsumer<AuthViewModel, AuthState>(
          listenWhen: (previous, current) {
            return previous.loginState != current.loginState;
          },
        builder: (BuildContext context, AuthState state) {
            final registerState = state.loginState;
          // if(registerState!.isLoading){
          //   return Center(
          //     child: CircularProgressIndicator(backgroundColor: AppColors.grey,),
          //   );
          // }
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w,  vertical: 10.h),
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          spacing: 16.w,
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: AppStrings.enterYourEmail,
                                  labelText:AppStrings.email
                              ),
                              validator:AppValidators.validateEmail,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  hintText: AppStrings.enterYourPassword,
                                  labelText:AppStrings.password
                              ),
                              validator:AppValidators.validatePassword,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ],
                        )
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) async {
                            if (value == null) return;
                            setState(() {
                              rememberMe = value;
                            });
                            await SharedPrefsService.saveData(
                              key: SharedPrefsService.rememberMe,
                              value: value,
                            );
                            log('${SharedPrefsService.getData(
                              key: SharedPrefsService.rememberMe,
                            )
                          }');
                          },
                        ),
                        Text(
                          AppStrings.rememberMe,
                          style: AppTextStyle.reg14lightGrey.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                           ///toDo: navigate to forget pass screen
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            AppStrings.forgotPassword,
                            style: AppTextStyle.reg14lightGrey.copyWith(
                              color: AppColors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final authViewModel= context.read<AuthViewModel>();
                            LoginRequest loginRequest =LoginRequest(
                              email: emailController.text,
                              password: passwordController.text
                            );
                              await authViewModel.login(loginRequest);
                            log('✔✔✔user logged in');
                          }
                        },
                        child: Text(AppStrings.login, style: AppTextStyle.med16White,)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.alreadyHaveAnAccount,
                          style: AppTextStyle.reg16Black,),
                        GestureDetector(
                          onTap: (){
                            context.pop();
                          },
                          child: Text(
                            AppStrings.register,
                            style: AppTextStyle.reg16Primary.copyWith(
                              decoration: TextDecoration.underline,
                            ),),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              if (registerState?.isLoading == true)
                Container(
                  color: Colors.black38,
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColors.primary,)
                  ),
                ),
            ],
          );
        },
          listener: (context, state) {
            final loginState = state.loginState;
            final userName = loginState?.data?.user?.username??'';
            if (loginState?.data != null) {
              ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                SnackBar(
                    backgroundColor: AppColors.green,
                    content: Text('${AppStrings.welcomeBack} $userName ',style: AppTextStyle.med16White.copyWith(fontSize: 14.sp),)),
              );
              ///todo: navigate to home
            }
           else if (loginState?.errMessage != null && loginState!.errMessage.isNotEmpty ) {
              ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                SnackBar(
                    backgroundColor: AppColors.red,
                    content: Text(loginState.errMessage,style: AppTextStyle.med16White.copyWith(fontSize: 14.sp))),
              );
            }
          },


      ),
    );
  }
}
