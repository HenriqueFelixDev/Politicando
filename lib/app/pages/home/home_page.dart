import 'package:flutter/material.dart';
import 'package:politicando/app/core/controllers/connection_controller.dart';
import 'package:provider/provider.dart';

import '../../components/politician_card/politician_card_widget.dart';
import '../../components/search_text_field/search_text_field_widget.dart';
import '../../core/controllers/app_controller.dart';
import '../../core/controllers/politicians_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/config/app_images.dart';
import '../../core/config/app_routes.dart';
import '../../core/config/app_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
  with SingleTickerProviderStateMixin {

  final searchController = TextEditingController();
  final searchFocus = FocusNode();

  bool isSearching = false;

  late AnimationController animationController;
  late Animation<AlignmentGeometry> alignAnimation;
  late Animation<double> imageAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this
    );

    final animationCurves = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate
    );

    alignAnimation = Tween(
      begin: Alignment.center,
      end: Alignment.topCenter
    ).animate(animationCurves);
    
    imageAnimation = Tween(
      begin: 1.0,
      end: 0.0
    ).animate(animationCurves);

    searchFocus.addListener(() { 
      if (searchFocus.hasFocus) {
        setIsSearch(true);
      }
    });
  }

  void setIsSearch(bool value) {
    setState(() => isSearching = value);

    if (isSearching) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  Future<bool> _resetPageBeforeExit() {
    if (isSearching) {
      setIsSearch(false);
      searchFocus.unfocus();
      searchController.clear();
      context.read<PoliticiansController>().clearPoliticiansList();
      return Future.value(false);
    }

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _resetPageBeforeExit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConfig.appName),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AlignTransition(
                alignment: alignAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizeTransition(
                      sizeFactor: imageAnimation,
                      child: Center(
                        child: Image.asset(AppImages.politician, width: 200)
                      )
                    ),

                    const SizedBox(height: 16.0),

                    SearchTextFieldWidget(
                      controller: searchController,
                      focusNode: searchFocus,
                      onSearch: (search) { 
                        context.read<PoliticiansController>().searchPoliticians(search);
                      }
                    )
                  ]
                )
              ),
            ),
            
            Offstage(
              offstage: !isSearching,
              child: Container(
                margin: const EdgeInsets.only(top: 100.0),
                child: Consumer<PoliticiansController>(
                  builder: (context, controller, child) {
                    if (controller.state == AppState.error) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          controller.error ?? 'Um erro inesperado ocorreu',
                          style: AppTextStyles.body.copyWith(color: AppColors.error)
                        ),
                      );
                    }

                    if (controller.state == AppState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    
                    if (controller.state == AppState.none || controller.politicians.isEmpty) {
                      return Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Image.asset(AppImages.noData, width: 250.0)
                      );
                    }

                    return ListView.builder(
                      itemCount: controller.politicians.length,
                      itemBuilder: (context, index) {
                        final politician = controller.politicians[index];

                        return PoliticianCardWidget(
                          politicianSearch: politician,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.politicianDetails,
                              arguments: politician.id
                            );
                          },
                        );
                      },
                    );
                  }
                )
              ),
            )
          ]
        ),
        bottomNavigationBar: Consumer<ConnectionController>(
          builder: (context, connectionController, child) {
            return ValueListenableBuilder(
              valueListenable: connectionController.connectionState,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: AppColors.error,
                child: Row(
                  children: const [
                    Icon(
                      Icons.wifi,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Sem conexão com a internet',
                      style: TextStyle(color: Colors.white)
                    )
                  ]
                )
              ),
              builder: (context, value, child) {
                return Offstage(
                  offstage: value != InternetConnectionState.none,
                  child: child
                );
              },
            );
          }
        ),
      ),
    );
  }
}