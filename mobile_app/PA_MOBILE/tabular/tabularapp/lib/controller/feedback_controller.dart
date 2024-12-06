import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class FeedbackController extends ChangeNotifier {
  
  Future<void> sendFeedback(String feedbackMessage, BuildContext context) async {
    try {
   
      List<String> emailList = [
        'aliffbatasa29@gmail.com',
        'gerryhasrom25@gmail.com',
        'rizkyputra1206@gmail.com',
        'Zaonly881@gmail.com',
      ];

      final smtpServer = gmail('your-email@gmail.com', 'your-app-password'); 

     
      final message = Message()
        ..from = Address('your-email@gmail.com', 'Muscles AI Feedback')  
        ..recipients.addAll(emailList)  
        ..subject = 'Feedback dari Pengguna Muscles AI'
        ..text = feedbackMessage;

      
      await send(message, smtpServer); 

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback berhasil dikirim!')),
      );
    } catch (e) {

      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan. Coba lagi nanti.')),
      );
    }
  }
}
