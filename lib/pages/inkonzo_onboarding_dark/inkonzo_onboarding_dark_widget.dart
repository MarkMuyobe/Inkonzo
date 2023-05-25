import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inkonzo_onboarding_dark_model.dart';
export 'inkonzo_onboarding_dark_model.dart';

class InkonzoOnboardingDarkWidget extends StatefulWidget {
  const InkonzoOnboardingDarkWidget({Key? key}) : super(key: key);

  @override
  _InkonzoOnboardingDarkWidgetState createState() =>
      _InkonzoOnboardingDarkWidgetState();
}

class _InkonzoOnboardingDarkWidgetState
    extends State<InkonzoOnboardingDarkWidget> with TickerProviderStateMixin {
  late InkonzoOnboardingDarkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InkonzoOnboardingDarkModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1E2429),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.asset(
                'assets/images/Logo.png',
                width: 240.0,
                height: 340.0,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              'INKONZO',
              style: FlutterFlowTheme.of(context).displayMedium.override(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
