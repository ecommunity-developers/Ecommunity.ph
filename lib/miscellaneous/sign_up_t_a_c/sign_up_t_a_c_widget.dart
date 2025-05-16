import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up_t_a_c_model.dart';
export 'sign_up_t_a_c_model.dart';

class SignUpTACWidget extends StatefulWidget {
  const SignUpTACWidget({super.key});

  @override
  State<SignUpTACWidget> createState() => _SignUpTACWidgetState();
}

class _SignUpTACWidgetState extends State<SignUpTACWidget> {
  late SignUpTACModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpTACModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Text(
                    'Ecommunity.ph - Terms and Conditions',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.karla(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 15.0),
                        child: Text(
                          'These Terms and Conditions (\"Agreement\") govern your use of the Ecommunity.ph mobile application (\"App\") provided by Ecommunity.ph Technologies, Inc. (\"Company,\" \"we,\" \"us,\" or \"our\"). By accessing or using the App, you agree to be bound by these terms. If you do not agree to all of the terms and conditions, please do not use the App.',
                          textAlign: TextAlign.justify,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.karla(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '1. Acceptance of Terms',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.karla(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  '\nBy using the Ecommunity.ph Mobile App, you acknowledge that you have read, understood, and agree to comply with these Terms and Conditions. The Company reserves the right to update, modify, or revise these terms at any time without notice. Your continued use of the App after such changes will constitute your acceptance of the new terms.',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: '\n\n2. Use of the App',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: '\n2.1 Eligibility: ',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'You must be at least 18 years old to use the App. By using the App, you represent and warrant that you are at least 18 years old.',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: '\n2.2 License: ',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Subject to your compliance with these terms, the Company grants you a limited, non-exclusive, non-transferable, and revocable license to use the App for personal and commercial purposes.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\n3. User Account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '\n3.1 Registration: ',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'To use certain features of the App, you may be required to create a user account. You agree to provide accurate, current, and complete information during the registration process.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n3.2 Security: ',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. Notify us immediately of any unauthorized use or security breaches.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\n4. Content and User Conduct',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '\n4.1 Content: ',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'You agree not to upload, post, or transmit any content that is illegal, infringes on the rights of others, or violates these Terms and Conditions.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n4.2 User Conduct: ',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'You agree to use the App in accordance with all applicable laws and regulations. Any use of the App for illegal or unauthorized purposes is strictly prohibited.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\n5. Privacy',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nYour use of the App is also governed by our Privacy Policy, which can be found here. By using the App, you consent to the collection, use, and sharing of your information as described in the Privacy Policy.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\n6. Termination',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nThe Company reserves the right to suspend or terminate your access to the App at its sole discretion, without prior notice, for any reason, including, but not limited to, a breach of these Terms and Conditions',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\n7. Disclaimer of Warranties',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nThe App is provided \"as is\" without any warranties, express or implied. The Company does not warrant that the App will be error-free or uninterrupted. ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\n8. Limitation of Liability',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nTo the fullest extent permitted by applicable law, the Company shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\n9. Governing Law',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nThese Terms and Conditions are governed by and construed in accordance with the laws of the Philippines.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\n10. Contact Information',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nFor questions, concerns, or feedback regarding these Terms and Conditions, please contact us at developers.ecommunity@gmail.com.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text:
                                  '\n\nBy using the Ecommunity.ph Mobile App, you agree to abide by these Terms and Conditions. Thank you for your cooperation.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\nLast Updated: February 20, 2024',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.6,
                                  ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Agree & Continue',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.karla(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
