//Login-Register validation

import 'dart:io';

Map<String, Map<String, String>> users = {
  "mail": {'mail': 'mail', 'password': 'password'}
};

void main() {
  menu();
}

void loginCheck(String mail, String password) {
  if (!users.containsKey(mail)) {
    print("User not found. Returning to the main menu");
    menu();
  } else {
    while (password != users[mail]?["password"]) {
      print("Wrong password! Try again.");
      print('Please Enter Password:');
      password = stdin.readLineSync()?.trim() ?? "";
    }

    print("\nLogin successful! \n  \nYour info: ${users[mail]?.values} \n");
  }
}

void register() {
  String? mail;
  String? password;
  String? confirmPassword;

  do {
    /* print */ stdout.write('Please Enter mail:  ');
    mail = stdin.readLineSync()?.trim();
  } while (mail == null || mail.isEmpty);

  do {
    /* print */ stdout.write('Please Enter Password:  ');
    password = stdin.readLineSync()?.trim();
  } while (password == null || password.isEmpty);

  do {
    /* print */ stdout.write('Please Enter Confirm Password:  ');
    String? confirmPasswordText = stdin.readLineSync()?.trim();
    if (confirmPasswordText != password) {
      print("Confirm password is incorrect!");
    } else {
      confirmPassword = confirmPasswordText;
    }
  } while (confirmPassword == null || confirmPassword.isEmpty);

  Map<String, String> userData = {};
  userData['mail'] = mail;
  userData['password'] = password;
  users[mail] = userData;
  print("Account has been created");

  menu();
}

void login() {
  String? mail;
  String? password;

  do {
    /* print */ stdout.write('Please Enter mail:  ');
    mail = stdin.readLineSync()?.trim();
  } while (mail == null || mail.isEmpty);

  do {
    /* print */ stdout.write('Please Enter Password:  ');
    password = stdin.readLineSync()?.trim();
  } while (password == null || password.isEmpty);

  loginCheck(mail, password);
}

void menu() {
  print("\nUsers: ${users}\n");

  int? number;

  print('Welcome! Enter number to continue.\n1-Login\n2-Register\n ');

  do {
    number = int.tryParse(stdin.readLineSync()!);

    switch (number) {
      case 1:
        login();
        break;
      case 2:
        register();
        break;
      default:
        print('\n--- Please Enter correct number! ---');
        print("1-Login \n2-Register");
        break;
    }
  } while (number != 1 && number != 2);
}
