import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'no_boycott_model.dart';
export 'no_boycott_model.dart';

class NoBoycottWidget extends StatefulWidget {
  const NoBoycottWidget({super.key});

  @override
  State<NoBoycottWidget> createState() => _NoBoycottWidgetState();
}

class _NoBoycottWidgetState extends State<NoBoycottWidget> {
  late NoBoycottModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoBoycottModel());
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: AutoSizeText(
              FFLocalizations.of(context).getText(
                '8cpgb8bq' /* Product is Not In Our List */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).success,
                    fontSize: 40.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: AutoSizeText(
              FFLocalizations.of(context).getText(
                'pth3qiwj' /* If you have any other informat... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).success,
                    fontSize: 25.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await launchURL('https://forms.gle/ss853pWVJZpFtvAc6');
              },
              child: Icon(
                Icons.list_alt,
                color: FlutterFlowTheme.of(context).success,
                size: 40.0,
              ),
            ),
          ),
        ].divide(const SizedBox(height: 10.0)).addToStart(const SizedBox(height: 0.0)),
      ),
    );
  }
}
