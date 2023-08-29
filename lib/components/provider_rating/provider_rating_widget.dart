import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'provider_rating_model.dart';
export 'provider_rating_model.dart';

class ProviderRatingWidget extends StatefulWidget {
  const ProviderRatingWidget({Key? key}) : super(key: key);

  @override
  _ProviderRatingWidgetState createState() => _ProviderRatingWidgetState();
}

class _ProviderRatingWidgetState extends State<ProviderRatingWidget> {
  late ProviderRatingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProviderRatingModel());

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

    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          setState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).primary,
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??= 3.0,
      unratedColor: Color(0xFF9E9E9E),
      itemCount: 5,
      itemSize: 20.0,
      glowColor: FlutterFlowTheme.of(context).primary,
    );
  }
}
