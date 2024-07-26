import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_nav_model.dart';
export 'chat_nav_model.dart';

class ChatNavWidget extends StatefulWidget {
  const ChatNavWidget({super.key});

  @override
  State<ChatNavWidget> createState() => _ChatNavWidgetState();
}

class _ChatNavWidgetState extends State<ChatNavWidget> {
  late ChatNavModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatNavModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(
              'chat_2_InviteUsers',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.bottomToTop,
                  duration: Duration(milliseconds: 270),
                ),
              },
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          title: Text(
            'Chats',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: StreamBuilder<List<ChatsRecord>>(
                  stream: queryChatsRecord(
                    queryBuilder: (chatsRecord) => chatsRecord
                        .where(
                          'users',
                          arrayContains: currentUserReference,
                        )
                        .orderBy('last_message_time', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                    if (listViewChatsRecordList.isEmpty) {
                      return Center(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          child: EmptyStateSimpleWidget(
                            icon: Icon(
                              Icons.mark_chat_unread_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 90.0,
                            ),
                            title: 'No Chats',
                            body: 'You don\'t have any chats created, start a chat by tapping the button in the top right. ',
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewChatsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewChatsRecord = listViewChatsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'Chat',
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    listViewChatsRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatRef': listViewChatsRecord,
                                },
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.0,
                                      color: FlutterFlowTheme.of(context).alternate,
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    if (listViewChatsRecord.users.length <= 2) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 12.0, 12.0),
                                        child: FutureBuilder<UsersRecord>(
                                          future: FFAppState().userDocQuery(
                                            uniqueQueryKey: listViewChatsRecord.reference.id,
                                            requestFn: () => UsersRecord.getDocumentOnce(
                                                listViewChatsRecord.users.where((e) => e != currentUserReference).toList().first),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: CircularProgressIndicator(
                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                      FlutterFlowTheme.of(context).primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowUsersRecord = snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        rowUsersRecord.photoUrl,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/teams/GzvajSxrHvi1zwJQsfLk/assets/tjm1k7ywi5dr/@3xlogoMark_outlineOnWhite.png',
                                                      ),
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                        'assets/images/error_image.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                valueOrDefault<String>(
                                                                  rowUsersRecord.displayName,
                                                                  'Ghost User',
                                                                ),
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      fontFamily: 'Poppins',
                                                                      fontSize: 16.0,
                                                                      letterSpacing: 0.0,
                                                                      fontWeight: FontWeight.normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (!listViewChatsRecord.lastMessageSeenBy.contains(currentUserReference))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                child: Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration: BoxDecoration(
                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                    shape: BoxShape.circle,
                                                                    border: Border.all(
                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                      width: 2.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Text(
                                                          listViewChatsRecord.lastMessage,
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Poppins',
                                                                fontSize: 15.0,
                                                                letterSpacing: 0.0,
                                                                fontWeight: FontWeight.w300,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              dateTimeFormat('relative', listViewChatsRecord.lastMessageTime!),
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    fontFamily: 'Poppins',
                                                                    fontSize: 15.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FontWeight.w300,
                                                                  ),
                                                            ),
                                                            Icon(
                                                              Icons.chevron_right_rounded,
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ].divide(SizedBox(width: 16.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 12.0, 12.0),
                                        child: FutureBuilder<UsersRecord>(
                                          future: FFAppState().userDocQuery(
                                            uniqueQueryKey: listViewChatsRecord.reference.id,
                                            requestFn: () => UsersRecord.getDocumentOnce(
                                                listViewChatsRecord.users.where((e) => e != currentUserReference).toList().first),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: CircularProgressIndicator(
                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                      FlutterFlowTheme.of(context).primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowUsersRecord = snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: 44.0,
                                                    height: 54.0,
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                                                          child: FutureBuilder<UsersRecord>(
                                                            future: UsersRecord.getDocumentOnce(
                                                                listViewChatsRecord.users.where((e) => e != currentUserReference).toList().last),
                                                            builder: (context, snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot.hasData) {
                                                                return Center(
                                                                  child: SizedBox(
                                                                    width: 50.0,
                                                                    height: 50.0,
                                                                    child: CircularProgressIndicator(
                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                        FlutterFlowTheme.of(context).primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final circleImageUsersRecord = snapshot.data!;
                                                              return Container(
                                                                width: 44.0,
                                                                height: 44.0,
                                                                clipBehavior: Clip.antiAlias,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                ),
                                                                child: CachedNetworkImage(
                                                                  fadeInDuration: Duration(milliseconds: 200),
                                                                  fadeOutDuration: Duration(milliseconds: 200),
                                                                  imageUrl: valueOrDefault<String>(
                                                                    rowUsersRecord.photoUrl,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-flow-at3mts/assets/jozbfglfd548/flutterflow_future%402x.jpg',
                                                                  ),
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                          child: Container(
                                                            width: 44.0,
                                                            height: 44.0,
                                                            clipBehavior: Clip.antiAlias,
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: CachedNetworkImage(
                                                              fadeInDuration: Duration(milliseconds: 200),
                                                              fadeOutDuration: Duration(milliseconds: 200),
                                                              imageUrl: valueOrDefault<String>(
                                                                rowUsersRecord.photoUrl,
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-flow-at3mts/assets/jozbfglfd548/flutterflow_future%402x.jpg',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Group Chat',
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      fontFamily: 'Poppins',
                                                                      fontSize: 16.0,
                                                                      letterSpacing: 0.0,
                                                                      fontWeight: FontWeight.normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (!listViewChatsRecord.lastMessageSeenBy.contains(currentUserReference))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                child: Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration: BoxDecoration(
                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                    shape: BoxShape.circle,
                                                                    border: Border.all(
                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                      width: 2.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Text(
                                                          valueOrDefault<String>(
                                                            listViewChatsRecord.lastMessage,
                                                            'No messages yet.',
                                                          ),
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Poppins',
                                                                fontSize: 15.0,
                                                                letterSpacing: 0.0,
                                                                fontWeight: FontWeight.w300,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<String>(
                                                                dateTimeFormat('relative', listViewChatsRecord.lastMessageTime),
                                                                '--',
                                                              ),
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    fontFamily: 'Poppins',
                                                                    fontSize: 15.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FontWeight.w300,
                                                                  ),
                                                            ),
                                                            Icon(
                                                              Icons.chevron_right_rounded,
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ].divide(SizedBox(width: 16.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
