import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'inkonzo_splash_dark_model.dart';
export 'inkonzo_splash_dark_model.dart';

class InkonzoSplashDarkWidget extends StatefulWidget {
  const InkonzoSplashDarkWidget({Key? key}) : super(key: key);

  @override
  _InkonzoSplashDarkWidgetState createState() =>
      _InkonzoSplashDarkWidgetState();
}

class _InkonzoSplashDarkWidgetState extends State<InkonzoSplashDarkWidget>
    with TickerProviderStateMixin {
  late InkonzoSplashDarkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InkonzoSplashDarkModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'inkonzoSplashDark'});
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
                'assets/images/Image_2023-06-23_at_13.49.JPG',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'INKONZO',
              style: FlutterFlowTheme.of(context).displayMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 45.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
