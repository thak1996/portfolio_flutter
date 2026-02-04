import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DashboardCategorias extends StatelessWidget {
  const DashboardCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MaxWidthBox(
          maxWidth: 1200,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('Dashboard Categorias'),
              ),
              ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).isMobile
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowMainAxisAlignment: MainAxisAlignment.center,
                columnSpacing: 20,
                rowSpacing: 20,
                children: [
                  ResponsiveRowColumnItem(
                      child: _cardCategoria("Mudanças Local", Colors.blue)),
                  ResponsiveRowColumnItem(
                      child: _cardCategoria("Interestadual", Colors.green)),
                  ResponsiveRowColumnItem(
                      child: _cardCategoria("Guarda Móveis", Colors.orange)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardCategoria(String titulo, Color cor) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: cor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: cor),
      ),
      child: Center(
          child: Text(titulo,
              style: TextStyle(color: cor, fontWeight: FontWeight.bold))),
    );
  }
}
