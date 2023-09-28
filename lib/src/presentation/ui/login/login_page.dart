import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waitress_project/src/presentation/ui/login/cubit/login_cubit.dart';
import 'package:waitress_project/src/presentation/ui/scanner/scanner_page.dart';
import 'package:waitress_project/src/presentation/ui/select_table/select_table_page.dart';

import '../../utils/Colors.dart';
import '../../utils/route_animat.dart';
import '../../widgets/common_button.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_textfield.dart';
import '../navigation/navigation.dart';
import 'cubit/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundLight,
      body: BlocProvider(
        create: (_) => LoginCubit()..fetch(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 803.h,
            child: Column(
              children: <Widget>[
                const CustomAppBar(),
                SizedBox(
                  height: 40.h,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    final cubit = context.read<LoginCubit>();
                    return CustomTextField(
                      controller: cubit.loginController,
                      hintText: 'Login',
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previousState, currentState) => previousState.passwordView != currentState.passwordView,
                    builder: (context, state) {
                      final cubit = context.read<LoginCubit>();
                      return CustomTextField(
                        controller: cubit.passwordController,
                        hintText: 'Password',
                        isPassword: true,
                        isPasswordVisible: state.passwordView,
                        isPasswordVisibleTap: (bool isPasswordVisible) {
                          context.read<LoginCubit>().passwordViewClicked(isPasswordVisible);
                        },
                      );
                    }),
                SizedBox(
                  height: 160.h,
                ),
                BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
                  return CommonButtonWidget(
                    titleColor: state.loginButton ? MyColors.whiteText : MyColors.notActiveTextLight,
                    onTaps: state.loginButton ? () {
                      Navigator.of(context).pushAndRemoveUntil(
                        AnimateRoute.createRoute(const NavigationPage()),
                            (Route<dynamic> route) => false,
                      );
                    } : null,
                    colorOfButton: state.loginButton ? MyColors.activeTextLight : MyColors.listLight,
                    title: "Войти",
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                CommonButtonWidget(
                  titleColor: MyColors.notActiveTextLight,
                  onTaps: () {
                    Navigator.of(context).push(AnimateRoute.createRoute(const ScannerPage()));
                  },
                  colorOfButton: MyColors.listLight,
                  title: "Сканировать QR код",
                ),
                SizedBox(
                  height: 120.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
