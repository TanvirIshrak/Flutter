import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jamat_e_islami_books_store/Models/BookModel.dart';
import 'package:jamat_e_islami_books_store/Models/Data.dart';
import 'package:jamat_e_islami_books_store/components/BookCard.dart';
import 'package:jamat_e_islami_books_store/components/BookTile.dart';
import 'package:jamat_e_islami_books_store/config/bdapps.dart';
import 'package:jamat_e_islami_books_store/controller/BookRepository.dart';
import 'package:jamat_e_islami_books_store/pages/BookDetails/BookDetails.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/AppBar.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/CategoryWidget.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/InputTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  get Get => null;
  bool _isUnsubscribing = false;

  // Posts the user's phone to the BDApps unsubscribe endpoint, then wipes
  // the local session (isLoggedIn + userPhone) and bounces them back to the
  // login screen so the next cold start also lands on /login.
  Future<void> _unsubscribe() async {
    if (_isUnsubscribing) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Unsubscribe?'),
        content: const Text(
          'You will lose access to the e-book catalogue. You can resubscribe anytime by logging in again.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx, true),
            child: const Text(
              'Unsubscribe',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
    if (confirm != true) return;

    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString('userPhone') ?? '';

    setState(() => _isUnsubscribing = true);

    try {
      if (phone.isNotEmpty) {
        await http
            .post(
              Uri.parse('${bdappsBaseUrl}unsubscribe.php'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({'phone': phone}),
            )
            .timeout(const Duration(seconds: 15));
      }
      // Whether or not the backend ack arrives, drop the local session
      // so the user can no longer browse without re-subscribing.
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('userPhone');

      if (!mounted) return;
      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
        '/login',
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unsubscribe failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isUnsubscribing = false);
    }
  }

  Widget _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    'Assets/Images/book.png',
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'E-Book',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.red),
              title: const Text(
                'Unsubscribe',
                style: TextStyle(color: Colors.red),
              ),
              onTap: _isUnsubscribing
                  ? null
                  : () {
                      Navigator.pop(context); // close drawer
                      _unsubscribe();
                    },
              trailing: _isUnsubscribing
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // upper blue bar container
            Container(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.primary,
              height: 400,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 60),

                          // Adding home app bar => pages/HomePage/Widgets/AppBar.dart
                          HomeAppbar(),

                          SizedBox(height: 35),
                          Row(
                            children: [
                              Text(
                                'Good Morning, ',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.background,
                                ),
                              ),
                              Text(
                                "Dear Learner",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.background,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Time to read book and enhance your knowledge",
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.background,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 35),

                          // Adding search bar => pages/HomePage/Widgets/InputTextField.dart
                          InputTextField(),

                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Topics",
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.background,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // categoryData => lib/Models/Data.dart
                              // here i just called the model and the widget to a list to make the same thing in a row
                              children: categoryData.map((e) => CategoryWidget(
                                  iconPath: e["icon"]!,
                                  buttonName: e["lebel"]!,
                                ),
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              // Obx re-renders the section whenever a new book is added to
              // BookRepository — i.e. published via AddNewBook.
              child: Obx(() {
                // 16 hardcoded books (PDFs already on Cloudinary) + any
                // freshly-published books live on top.
                final List<BookModel> allBooks = [
                  ...bookData,
                  ...BookRepository.instance.books,
                ];
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Trending",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                        // eitar somoi children er [] dewa jabena
                        allBooks.map((e) => BookCard(
                            title: e.title!,
                            coverURL: e.coverURL ?? e.bookurl ?? "",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetails(book: e),
                                ),
                              );
                            },
                          ),
                        ).toList(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(children: [Text("Your Interest")]),
                    SizedBox(height: 10),
                    Column(
                      children: allBooks
                          .map(
                            (e) => BookTile(
                              title: e.title!,
                              coverURL: e.coverURL ?? e.bookurl ?? "",
                              author: e.author!,
                              price: e.price!,
                              rating: e.rating!,
                              totalRating: e.numberOfRatings!,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      )
    );
  }
}
