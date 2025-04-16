import 'package:flutter/material.dart';
import 'package:yapeclon/models/ServiceCard.dart';

class ServicesCardWidget extends StatelessWidget {
  final List<ServiceCard> _servicesCard = [
    ServiceCard(page: "/", name: "Recargar celular"),
    ServiceCard(page: "/", name: "Yapear servicios"),
    ServiceCard(page: "/", name: "Promos           "),
    ServiceCard(page: "/", name: "Código de aprobación"),
    ServiceCard(page: "/", name: "Créditos"),
    ServiceCard(page: "/", name: "Tienda"),
    ServiceCard(page: "/", name: "Dólares"),
    ServiceCard(page: "/", name: "Ver todos"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5.0, 20, 8.0),
      height: 220,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 7,
          childAspectRatio: .74,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return _serviceCardView(context, _servicesCard[index]);
        },
      ),
    );
  }

  Widget _serviceCardView(context, ServiceCard serviceCurrent) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 47,
            height: 47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.white,
            ),
            child: Center(
              child: Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 22,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            serviceCurrent.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
