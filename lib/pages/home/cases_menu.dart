import 'package:flutter/material.dart';
import '../classes/scroll_menu.dart';

class CasesMenu extends StatelessWidget {
  List<CaseCard> cases;

  CasesMenu(List<CaseCard> cases) {
    this.cases = cases;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollCases(cases);
  }
}
