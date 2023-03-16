import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_component_model.dart';
export 'rating_component_model.dart';

class RatingComponentWidget extends StatefulWidget {
  const RatingComponentWidget({Key? key}) : super(key: key);

  @override
  _RatingComponentWidgetState createState() => _RatingComponentWidgetState();
}

class _RatingComponentWidgetState extends State<RatingComponentWidget> {
  late RatingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: RatingBar.builder(
        onRatingUpdate: (newValue) =>
            setState(() => _model.ratingBarValue = newValue),
        itemBuilder: (context, index) => Icon(
          Icons.star_rounded,
          color: FlutterFlowTheme.of(context).primaryColor,
        ),
        direction: Axis.horizontal,
        initialRating: _model.ratingBarValue ??= 3.0,
        unratedColor: Color(0xFF9E9E9E),
        itemCount: 5,
        itemSize: 25.0,
        glowColor: FlutterFlowTheme.of(context).primaryColor,
      ),
    );
  }
}
