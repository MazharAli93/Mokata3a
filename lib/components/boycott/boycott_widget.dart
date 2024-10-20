import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'boycott_model.dart';
export 'boycott_model.dart';

class BoycottWidget extends StatefulWidget {
  const BoycottWidget({super.key});

  @override
  State<BoycottWidget> createState() => _BoycottWidgetState();
}

class _BoycottWidgetState extends State<BoycottWidget> {
  late BoycottModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoycottModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            FFLocalizations.of(context).getText(
              'fdrt4w49' /* Mokata3a */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: const Color(0xFFF90A0A),
                  fontSize: 40.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ].divide(const SizedBox(height: 20.0)).addToStart(const SizedBox(height: 30.0)),
      ),
    );
  }
}
