import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final homeUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!(Theme.of(context).brightness == Brightness.dark) ?? true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        setDarkModeSetting(context, ThemeMode.dark);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.solidMoon,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                if (Theme.of(context).brightness == Brightness.dark ?? true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        setDarkModeSetting(context, ThemeMode.light);
                      },
                      child: Icon(
                        Icons.wb_sunny,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
              ],
            ),
            title: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Igreja Adventista do',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Work Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DIST. JARAGUÁ',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Work Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 5),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarPage(initialPage: 'Perfil'),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      valueOrDefault<String>(
                        homeUsersRecord.photoUrl,
                        'https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/3/f/4/7/3f4782a691f4b5986ea9f9697010a16d.jpg',
                      ),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Anuncios Distrital',
                          style: FlutterFlowTheme.of(context).title2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Jaraguá Anuncios',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
