import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_rating_bar_model.dart';
export 'app_rating_bar_model.dart';

class AppRatingBarWidget extends StatefulWidget {
  const AppRatingBarWidget({
    Key? key,
    double? ratingValue,
  })  : this.ratingValue = ratingValue ?? 3.0,
        super(key: key);

  final double ratingValue;

  @override
  _AppRatingBarWidgetState createState() => _AppRatingBarWidgetState();
}

class _AppRatingBarWidgetState extends State<AppRatingBarWidget> {
  late AppRatingBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppRatingBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return RatingBarIndicator(
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).primary,
      ),
      direction: Axis.horizontal,
      rating: widget.ratingValue,
      unratedColor: Color(0xFF9E9E9E),
      itemCount: 5,
      itemSize: 20.0,
    );
  }
}
