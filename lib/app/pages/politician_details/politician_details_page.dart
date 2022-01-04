import 'package:flutter/material.dart';
import 'package:politicando/app/core/errors/connection_exception.dart';
import 'package:provider/provider.dart';

import 'components/politician_details_header/politician_details_header_widget.dart';
import 'subpages/candidacy_info_subpage.dart';
import 'subpages/personal_info_subpage.dart';
import 'subpages/expenses_subpage.dart';
import '../../core/controllers/politicians_controller.dart';
import '../../core/models/detailed_politician/detailed_politician_model.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class PoliticianDetailsPage extends StatefulWidget {
  final int politicianId;

  const PoliticianDetailsPage({
    Key? key,
    required this.politicianId
  }) : super(key: key);

  @override
  _PoliticianDetailsPageState createState() => _PoliticianDetailsPageState();
}

class _PoliticianDetailsPageState extends State<PoliticianDetailsPage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: FutureBuilder<DetailedPoliticianModel>(
          future: context.read<PoliticiansController>().getDetailedPolitician(widget.politicianId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              String error = snapshot.error?.toString() ?? 'Um erro inesperado ocorreu';

              if (snapshot.error is ConnectionException) {
                error = (snapshot.error as ConnectionException).message;
              }

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    error,
                    style: AppTextStyles.body.copyWith(color: AppColors.error),
                  ),
                )
              );
            }
    
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
    
            final detailedPolitician = snapshot.data!;
    
            return NestedScrollView(
              body: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  PersonalInfoSubPage(detailedPolitician: detailedPolitician),
                  CandidacyInfoSubPage(detailedPolitician: detailedPolitician),
                  ExpensesSubPage()
                ]
              ),
              headerSliverBuilder: (context, _) {
                return [
                  SliverAppBar(
                    title: const Text('Detalhes'),
                    centerTitle: true,
                    snap: true,
                    floating: true,
                    pinned: true,
                    expandedHeight: 300.0,
                    flexibleSpace: Container(
                      margin: const EdgeInsets.only(top: 85.0),
                      height: 180.0,
                      child: PoliticianDetailsHeaderWidget(detailedPolitician: detailedPolitician)
                    ),
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: const [
                        Tab(child: Text('Informações pessoais')),
                        Tab(child: Text('Informações de candidatura')),
                        Tab(child: Text('Despesas'))
                      ],
                      onTap: (index) {
                        pageController.animateToPage(
                          index, 
                          duration: const Duration(milliseconds: 600), 
                          curve: Curves.easeOut
                        );
                      }
                    )
                  )
                ];
              }
            );
          }
        )
      )
    );
  }
}