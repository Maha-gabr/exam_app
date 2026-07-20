import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/constants/app_string.dart';
import 'package:online_exam_app/core/theme/app_color.dart';
import 'package:online_exam_app/features/auth/domain/entity/request/register/register_request.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_states.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_view_model.dart';
import '../../../../../config/router/app_routes_names.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../../../../core/validators.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }
  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
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
          onPressed: () => context.pushNamed(AppRoutesNames.login),
        ),
        title: Text(
          AppStrings.register,
          style: AppTextStyle.med20Black,
        ),
        centerTitle: false,
      ),
      body: BlocConsumer<AuthViewModel, AuthState>(
          listenWhen: (previous, current) {
            return previous.registerState != current.registerState;
          },
        builder: (BuildContext context, AuthState state) {
          final registerState = state.registerState;
          // if(registerState!.isLoading){
          //   return Center(
          //     child: CircularProgressIndicator(backgroundColor: AppColors.grey,),
          //   );
          // }
          return SingleChildScrollView(
            child: Stack(
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
                              controller: usernameController,
                              decoration: InputDecoration(
                                  hintText: AppStrings.enterYourUserName,
                                  labelText:AppStrings.userName
                              ),
                              validator:AppValidators.validateUsername,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                            ),
                            Row(
                              spacing: 16.w,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: firstNameController,
                                    decoration: InputDecoration(
                                      labelText: AppStrings.firstName,
                                      hintText: AppStrings.enterFirstName,
                                    ),
                                    validator:AppValidators.validateUsername,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.name,
                                  ),),
                                Expanded(
                                  child: TextFormField(
                                    controller: lastNameController,
                                    decoration: InputDecoration(
                                      labelText: AppStrings.lastName,
                                      hintText: AppStrings.enterLastName,
                                    ),
                                    validator:AppValidators.validateUsername,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.name,
                                  ),)
                              ],
                            ),
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
                            Row(
                              spacing: 16.w,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      // helperText: ' ',
                                      labelText:AppStrings.password ,
                                      hintText: AppStrings.enterYourPassword,
                                    ),
                                    validator:AppValidators.validatePassword,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                  ),),
                                Expanded(
                                  child: TextFormField(
                                    controller: confirmPasswordController,
                                    decoration: InputDecoration(
                                      labelText:AppStrings.confirmPassword ,
                                      hintText: AppStrings.confirmPassword,
                                    ),
                                    validator:(val){
                                      return AppValidators.validateConfirmPassword(val, passwordController.text);
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.name,
                                  ),)
                              ],
                            ),
                            TextFormField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                  hintText: AppStrings.phoneNumber,
                                  labelText:AppStrings.enterPhoneNumber
                              ),
                              validator:AppValidators.validatePhoneNumber,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.phone,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Form is valid
                             final authViewModel= context.read<AuthViewModel>();
                             RegisterRequest register =RegisterRequest(
                               username: usernameController.text,
                               firstName: firstNameController.text,
                               lastName: lastNameController.text,
                               email: emailController.text,
                               password: passwordController.text,
                               rePassword: confirmPasswordController.text,
                               phone: phoneController.text,
                             );
                            await authViewModel.register(register);
                              log('✔✔✔user sign up');
                            }
                          },
                          child: Text(AppStrings.register, style: AppTextStyle.med16White,)),
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
                              context.pushNamed(AppRoutesNames.login);
                            },
                            child: Text(
                              AppStrings.login,
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
            ),
          );
        },
        listener: (context, state) {
        final registerState = state.registerState;
        if (registerState?.data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: AppColors.green,
                content: Text('Registration successful')),
          );
          context.pushNamed(AppRoutesNames.login);
        }
        if (registerState?.errMessage != null && registerState!.errMessage.isNotEmpty ) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: AppColors.red,
                content: Text(registerState.errMessage)),
          );
        }
      },

      ),
    );
  }
}
