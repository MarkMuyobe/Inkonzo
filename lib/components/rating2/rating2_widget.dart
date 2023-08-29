import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'rating2_model.dart';
export 'rating2_model.dart';

class Rating2Widget extends StatefulWidget {
  const Rating2Widget({Key? key}) : super(key: key);

  @override
  _Rating2WidgetState createState() => _Rating2WidgetState();
}

class _Rating2WidgetState extends State<Rating2Widget> {
  late Rating2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Rating2Model());

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
      rating: 3.0,
      unratedColor: Color(0xFF9E9E9E),
      itemCount: 5,
      itemSize: 20.0,
    );
  }
}
