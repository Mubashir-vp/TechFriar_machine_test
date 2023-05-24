import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:machinetest_techfriar/view/home_screen/homescreen.dart';

import '../../core/blocs/auth_bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AuthBloc authBloc = AuthBloc();
  String phoneNum = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, authState) {
          if (authState is Authenticated) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    HexColor('#ECECED'),
                    Colors.white,
                  ],
                  stops: const [0.5, 0.5],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 30,
                          top: 20,
                        ),
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                    ]),
                    Image.asset(
                      'assets/images/log.png',
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      height: 500,
                      width: 335,
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  top: 15,
                                ),
                                child: Text(
                                  'Log In with Phone Number',
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w900,
                                  ),
                                  //  Theme.of(context).textTheme.titleLarge!.copyWith(
                                  //       fontFamily: 'Outfit',
                                  //       fontWeight: FontWeight.w900,
                                  //       fontSize: 18,
                                  //     ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  top: 10,
                                  right: 10,
                                ),
                                child: Text(
                                  'Enter your phone number and password to\nLog in and start predicting.',
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w400,
                                  ),
                                  // Theme.of(context).textTheme.titleMedium!.copyWith(
                                  //       fontWeight: FontWeight.w600,
                                  //       fontSize: 14,
                                  //       color: HexColor(
                                  //         '#88888C',
                                  //       ),
                                  //     ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 12.0,
                              //     right: 12,
                              //     top: 37,
                              //   ),
                              //   child: TextFormField(
                              //     validator: (value) {
                              //       if (value == null) {
                              //         return 'Please enter your Phone Number';
                              //       } else if (value.isEmpty) {
                              //         return 'Phone number cannot be empty';
                              //       } else {
                              //         return null;
                              //       }
                              //     },
                              //     controller: phoneController,
                              //     obscureText: true,
                              //     decoration: const InputDecoration(
                              //       labelText: 'Enter your Phone Number',
                              //       border: OutlineInputBorder(
                              //         borderSide: BorderSide(),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12.0,
                                  right: 12,
                                  top: 37,
                                ),
                                child: IntlPhoneField(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter your Phone number';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: phoneController,
                                  flagsButtonPadding: const EdgeInsets.all(
                                    6,
                                  ),
                                  dropdownIconPosition: IconPosition.trailing,
                                  dropdownIcon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.black,
                                  ),
                                  disableLengthCheck: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Enter your Phone Number',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  initialCountryCode: 'IN',
                                  onChanged: (phone) {
                                    phoneNum = phone.completeNumber;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12.0,
                                  right: 12,
                                  top: 27,
                                  bottom: 8,
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter your password';
                                    } else if (value.isEmpty) {
                                      return 'Password cannot be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 14.0,
                                    ),
                                    child: Text(
                                      'Forget Password?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: HexColor(
                                              '#88888C',
                                            ),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  log('Tapped');
                                  if (formKey.currentState!.validate()) {
                                    authBloc.add(LoginUser(
                                      phone: phoneNum,
                                      pass: passwordController.text,
                                    ));
                                  } else {
                                    log('not validate');
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    20.0,
                                  ),
                                  child: Container(
                                    width: 305,
                                    height: 50,
                                    color: HexColor(
                                      '#32A693',
                                    ),
                                    child: Center(
                                      child: state is LoadingState
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              'Log In',
                                              style: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'OR',
                                  style: GoogleFonts.outfit(
                                      color: HexColor(
                                    '#88888C',
                                  )),
                                ),
                              ),
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    20.0,
                                  ),
                                  child: Container(
                                    width: 305,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: HexColor(
                                      '#32A693',
                                    ))),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/email.png',
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Log In with Email',
                                            style: GoogleFonts.outfit(
                                              fontWeight: FontWeight.w500,
                                              color: HexColor(
                                                '#88888C',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: GoogleFonts.outfit(
                          color: HexColor(
                            '#88888C',
                          ),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign up',
                            style: GoogleFonts.outfit(
                              color: HexColor(
                                '#32A693',
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
