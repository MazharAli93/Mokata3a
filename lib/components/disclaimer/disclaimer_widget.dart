import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'disclaimer_model.dart';
export 'disclaimer_model.dart';

class DisclaimerWidget extends StatefulWidget {
  const DisclaimerWidget({super.key});

  @override
  State<DisclaimerWidget> createState() => _DisclaimerWidgetState();
}

class _DisclaimerWidgetState extends State<DisclaimerWidget> {
  late DisclaimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisclaimerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
          FlutterFlowTimer(
            initialTime: _model.timerInitialTimeMs,
            getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
              value,
              hours: false,
              milliSecond: false,
            ),
            controller: _model.timerController,
            updateStateInterval: const Duration(milliseconds: 1000),
            onChanged: (value, displayTime, shouldUpdate) {
              _model.timerMilliseconds = value;
              _model.timerValue = displayTime;
              if (shouldUpdate) safeSetState(() {});
            },
            onEnded: () async {
              context.goNamed(
                'Auth2',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 500),
                  ),
                },
              );
            },
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  letterSpacing: 0.0,
                ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              'ei4096ae' /* Disclaimer */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '6byimzno' /* This Application is intended t... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
