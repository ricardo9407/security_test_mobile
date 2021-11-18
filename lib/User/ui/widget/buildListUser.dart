//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Company/model/company.dart';
import 'package:security_test_mobile/Company/model/company_list.dart';
import 'package:security_test_mobile/Company/repository/repository_company.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/model/user_list.dart';
import 'package:security_test_mobile/User/repository/repository_user.dart';
import 'package:security_test_mobile/User/ui/screen/loguin.dart';

class BuildListUser extends StatefulWidget {
  @override
  State<BuildListUser> createState() => _BuildListUser();
}

class _BuildListUser extends State<BuildListUser> {
  final urep = RepositoryUser();
  final crep = RepositoryCompany();

  List<UserModel> userList = [];
  List<CompanyModel> companyList = [];

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserList>(context);
    final company = Provider.of<CompanyList>(context);

    urep.fetchUser();
    crep.fetchCompany();

    return Center(
      child: StreamBuilder(
          stream: urep.getUserModel,
          builder: (_, AsyncSnapshot<List<UserModel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.active:
                if (snapshot.data != null) {
                  return buildListUser(snapshot.data, company, users, context);
                }
                return CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.data != null) {
                  return buildListUser(snapshot.data, company, users, context);
                }
                return CircularProgressIndicator();
              default:
                if (snapshot.data != null) {
                  return buildListUser(snapshot.data, company, users, context);
                }
                return CircularProgressIndicator();
            }
          }),
    );
  }

  Widget buildListUser(List<UserModel> user, CompanyList company,
      UserList users, BuildContext context) {
    UserModel us;
    if (userList.length == 0 || userList == null) {
      for (var i = 0; i < user.length; i++) {
        us = UserModel(
          id: user[i].id,
          name: user[i].name,
          email: user[i].email,
          cargo: user[i].cargo,
          idOrg: user[i].idOrg,
          admin: user[i].admin,
          nivel: user[i].nivel,
          ptsF1: user[i].ptsF1,
          ptsF2: user[i].ptsF2,
          ptsF3: user[i].ptsF3,
          ptsF4: user[i].ptsF4,
          ptsF5: user[i].ptsF5,
        );
        userList.add(us);
      }
    }
    return buildList(company, users, context);
  }

  Widget buildList(CompanyList company, UserList users, BuildContext context) {
    return StreamBuilder(
        stream: crep.getCompanyModel,
        builder: (_, AsyncSnapshot<List<CompanyModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.active:
              if (snapshot.data != null) {
                return buildListCompany(snapshot.data, company, users, context);
              }
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.data != null) {
                return buildListCompany(snapshot.data, company, users, context);
              }
              return CircularProgressIndicator();
            default:
              if (snapshot.data != null) {
                return buildListCompany(snapshot.data, company, users, context);
              }
              return CircularProgressIndicator();
          }
        });
  }

  Widget buildListCompany(List<CompanyModel> companies, CompanyList company,
      UserList users, BuildContext context) {
    CompanyModel com;
    if (companyList.length == 0 || companyList == null) {
      for (var i = 0; i < companies.length; i++) {
        com = CompanyModel(
          id: companies[i].id,
          name: companies[i].name,
          address: companies[i].address,
          phone: companies[i].phone,
        );
        companyList.add(com);
      }
    }
    return Center(
      child: FloatingActionButton(
        onPressed: () {
          users.setUsers = userList;
          company.setCompanies = companyList;
          print(users.getUsers.length);
          print(company.getCompanies.length);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Loguin(),
            ),
          );
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
