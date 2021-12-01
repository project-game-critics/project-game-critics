import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/models/company.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/company_repository.dart';
import 'package:project_game_critics/repository/game_repository.dart';
import 'package:project_game_critics/repository/news_repository.dart';

class HomePageController extends GetxController {
  NewsRepository newsRepository = NewsRepository();
  CompanyRepository companyRepository = CompanyRepository();
  GameRepository gameRepository = GameRepository();
  List<News> homeNews = [];
  List<Company> companies = [];
  List<Game> games = [];

  @override
  void onInit() async {
    super.onInit();
    homeNews = await newsRepository.getHomeNews();
    companies = await companyRepository.getCompanies();
    games = await gameRepository.getGames();
    update();
  }

  void animateToPage(TabController tabController, int pageIndex) {
    tabController.animateTo(pageIndex);
    update();
  }
}
