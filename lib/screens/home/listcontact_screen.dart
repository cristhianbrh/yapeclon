import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/subway.dart';
import 'package:yapeclon/data/models/user_model.dart';
import 'package:yapeclon/widgets/cards/contact_view_widget.dart';
import 'package:yapeclon/widgets/cards/new_number_view_widget.dart';

// Utils para normalizar
String normalizeName(String name) => name.trim().toLowerCase();
String normalizePhone(String phone) => phone.replaceAll(RegExp(r'\D'), '');

class ListcontactScreen extends StatefulWidget {
  const ListcontactScreen({super.key});

  @override
  State<ListcontactScreen> createState() => _ListcontactScreenState();
}

class _ListcontactScreenState extends State<ListcontactScreen> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      final contactsGet = await FlutterContacts.getContacts(
        withProperties: true,
      );
      final contacts = <String, Contact>{};

      for (var contact in contactsGet) {
        final name = normalizeName(contact.displayName);
        final phone =
            contact.phones.isNotEmpty
                ? normalizePhone(contact.phones.first.number)
                : '';
        final key = '$name|$phone';
        if (!contacts.containsKey(key)) {
          contacts[key] = contact;
        } else {
          await FlutterContacts.deleteContact(contact);
        }
      }
      setState(() {
        _contacts = contacts.values.toList();
        _filteredContacts = _contacts;
      });
    } else {
      print("Permiso denegado para leer contactos.");
    }
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchText = value;
      if (value.isEmpty) {
        _filteredContacts = _contacts;
      } else {
        final search = normalizePhone(value);
        _filteredContacts =
            _contacts.where((contact) {
              final name = normalizeName(contact.displayName);
              final phone =
                  contact.phones.isNotEmpty
                      ? normalizePhone(contact.phones.first.number)
                      : '';
              return name.contains(value.toLowerCase()) ||
                  phone.contains(search);
            }).toList();
      }
    });
  }

  // Header widgets ahora públicos
  Widget topHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        children: [
          IconButton(
            icon: Iconify(
              MaterialSymbols.close_rounded,
              color: Colors.black45,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            "Yapear",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget headerPageView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 5,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.purple, width: 5),
                ),
              ),
              child: Center(
                child: Text(
                  "Contactos",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.transparent, width: 5),
                ),
              ),
              child: Center(
                child: Text(
                  "Yapeos pendientes",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)!.settings.arguments as UserModel;
    final searchNumber = _searchText.replaceAll(RegExp(r'\D'), '');
    final exists = _filteredContacts.any(
      (contact) =>
          contact.phones.isNotEmpty &&
          contact.phones.first.number
              .replaceAll(RegExp(r'\D'), '')
              .contains(searchNumber),
    );
    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      body: SafeArea(
        child: Column(
          // Usar Column en lugar de SingleChildScrollView para evitar el error
          children: [
            topHeader(context),
            headerPageView(),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // spacing: 10, // Remove, not valid for Row
                children: [
                  Iconify(Subway.search, color: Colors.black26),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ingresa celular o busca contacto",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(62, 34, 34, 17),
                          fontSize: 15,
                        ),
                      ),
                      onChanged: _onSearchChanged,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              // Aquí hemos agregado Expanded para evitar el desbordamiento
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      ..._filteredContacts
                          .map(
                            (contact) =>
                                ContactViewWidget(contact, userData, context),
                          )
                          .toList(),
                      if (_searchText.isNotEmpty && !exists)
                        NewNumberViewWidget(_searchText, userData, context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
