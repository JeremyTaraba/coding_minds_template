import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_signup_model.dart';
export 'login_signup_model.dart';

class LoginSignupWidget extends StatefulWidget {
  const LoginSignupWidget({super.key});

  @override
  State<LoginSignupWidget> createState() => _LoginSignupWidgetState();
}

class _LoginSignupWidgetState extends State<LoginSignupWidget> with TickerProviderStateMixin {
  late LoginSignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginSignupModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.emailAddressCreateTextController1 ??= TextEditingController();
    _model.emailAddressCreateFocusNode1 ??= FocusNode();

    _model.emailAddressCreateTextController2 ??= TextEditingController();
    _model.emailAddressCreateFocusNode2 ??= FocusNode();

    _model.passwordCreateTextController ??= TextEditingController();
    _model.passwordCreateFocusNode ??= FocusNode();

    _model.passwordCreateConfirmTextController ??= TextEditingController();
    _model.passwordCreateConfirmFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.lightBlueAccent],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 73.0, 32.0, 32.0),
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Color(0x76000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'CounselorAI',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        fontSize: 40.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 170.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).width >= 768.0 ? 530.0 : 630.0,
                          constraints: BoxConstraints(
                            maxWidth: 570.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: Color(0x81000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    isScrollable: true,
                                    labelColor: FlutterFlowTheme.of(context).primaryText,
                                    unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
                                    labelPadding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                                    labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    unselectedLabelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    indicatorColor: FlutterFlowTheme.of(context).primary,
                                    indicatorWeight: 3.0,
                                    tabs: [
                                      Tab(
                                        text: 'Create Account',
                                      ),
                                      Tab(
                                        text: 'Log In',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 230.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                    ),
                                                  ),
                                                Text(
                                                  'Let\'s get started!',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model.emailAddressCreateTextController1,
                                                      focusNode: _model.emailAddressCreateFocusNode1,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        labelText: 'Email',
                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        filled: true,
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      keyboardType: TextInputType.emailAddress,
                                                      validator: _model.emailAddressCreateTextController1Validator.asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model.emailAddressCreateTextController2,
                                                      focusNode: _model.emailAddressCreateFocusNode2,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        labelText: 'Username',
                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        filled: true,
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model.emailAddressCreateTextController2Validator.asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model.passwordCreateTextController,
                                                      focusNode: _model.passwordCreateFocusNode,
                                                      autofocus: true,
                                                      obscureText: !_model.passwordCreateVisibility,
                                                      decoration: InputDecoration(
                                                        labelText: 'Password',
                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        filled: true,
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => _model.passwordCreateVisibility = !_model.passwordCreateVisibility,
                                                          ),
                                                          focusNode: FocusNode(skipTraversal: true),
                                                          child: Icon(
                                                            _model.passwordCreateVisibility
                                                                ? Icons.visibility_outlined
                                                                : Icons.visibility_off_outlined,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model.passwordCreateTextControllerValidator.asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model.passwordCreateConfirmTextController,
                                                      focusNode: _model.passwordCreateConfirmFocusNode,
                                                      autofocus: true,
                                                      obscureText: !_model.passwordCreateConfirmVisibility,
                                                      decoration: InputDecoration(
                                                        labelText: 'Confirm Password',
                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        filled: true,
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => _model.passwordCreateConfirmVisibility = !_model.passwordCreateConfirmVisibility,
                                                          ),
                                                          focusNode: FocusNode(skipTraversal: true),
                                                          child: Icon(
                                                            _model.passwordCreateConfirmVisibility
                                                                ? Icons.visibility_outlined
                                                                : Icons.visibility_off_outlined,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model.passwordCreateConfirmTextControllerValidator.asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      GoRouter.of(context).prepareAuthEvent();
                                                      if (_model.passwordCreateTextController.text !=
                                                          _model.passwordCreateConfirmTextController.text) {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Passwords don\'t match!',
                                                            ),
                                                          ),
                                                        );
                                                        return;
                                                      }

                                                      final user = await authManager.createAccountWithEmail(
                                                        context,
                                                        _model.emailAddressCreateTextController1.text,
                                                        _model.passwordCreateTextController.text,
                                                      );
                                                      if (user == null) {
                                                        return;
                                                      }

                                                      await UsersRecord.collection.doc(user.uid).update(createUsersRecordData(
                                                            email: _model.emailAddressCreateTextController1.text,
                                                            displayName: _model.emailAddressCreateTextController2.text,
                                                            photoUrl:
                                                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                                            createdTime: getCurrentTimestamp,
                                                            description: '',
                                                          ));

                                                      context.goNamedAuth('HomePage', context.mounted);
                                                    },
                                                    text: 'Get Started',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                      color: Colors.deepPurple,
                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                            letterSpacing: 0.2,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16,
                                                          ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 230.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                    ),
                                                  ),
                                                Text(
                                                  'Welcome back!',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model.emailAddressTextController,
                                                      focusNode: _model.emailAddressFocusNode,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        labelText: 'Email',
                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        filled: true,
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      keyboardType: TextInputType.emailAddress,
                                                      validator: _model.emailAddressTextControllerValidator.asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model.passwordTextController,
                                                      focusNode: _model.passwordFocusNode,
                                                      autofocus: true,
                                                      obscureText: !_model.passwordVisibility,
                                                      decoration: InputDecoration(
                                                        labelText: 'Password',
                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                              fontFamily: 'Poppins',
                                                              letterSpacing: 0.0,
                                                            ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        filled: true,
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => _model.passwordVisibility = !_model.passwordVisibility,
                                                          ),
                                                          focusNode: FocusNode(skipTraversal: true),
                                                          child: Icon(
                                                            _model.passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model.passwordTextControllerValidator.asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      GoRouter.of(context).prepareAuthEvent();

                                                      final user = await authManager.signInWithEmail(
                                                        context,
                                                        _model.emailAddressTextController.text,
                                                        _model.passwordTextController.text,
                                                      );
                                                      if (user == null) {
                                                        return;
                                                      }

                                                      context.goNamedAuth('HomePage', context.mounted);
                                                    },
                                                    text: 'Sign In',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                      color: Colors.deepPurple,
                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                            letterSpacing: 0.2,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_model.emailAddressTextController.text.isEmpty) {
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Email required!',
                                                              ),
                                                            ),
                                                          );
                                                          return;
                                                        }
                                                        await authManager.resetPassword(
                                                          email: _model.emailAddressTextController.text,
                                                          context: context,
                                                        );
                                                      },
                                                      text: 'Forgot Password?',
                                                      options: FFButtonOptions(
                                                        height: 44.0,
                                                        padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontFamily: 'Readex Pro',
                                                              letterSpacing: 0.0,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius: BorderRadius.circular(40.0),
                                                        hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation2']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
