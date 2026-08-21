import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_e_islami_books_store/Models/Data.dart';
import 'package:jamat_e_islami_books_store/components/AppBackButton.dart';
import 'package:jamat_e_islami_books_store/components/BookTile.dart';
import 'package:jamat_e_islami_books_store/components/PrimaryButton.dart';
import 'package:jamat_e_islami_books_store/pages/BookDetails/BookDetails.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/HomePage.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/AppBar.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        },
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.background,),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        
                // height: 600,
                color: Theme.of(context).colorScheme.primary,
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Flexible(
                      child: Column(
                        
                        mainAxisAlignment: .center,
                        children: [
                          SizedBox(height: 20),
                          
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AppBackButton(),
                              ),
                              Text(
                                "Profile",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.background,
                                    ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 20,),
                          SizedBox(height: 80,),
                          // Profile Picture
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              // color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.background,
                                width: 2,
                              ),
                            ),
                            child: Container(
                              height: 150,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "Assets/Images/self.png", fit: BoxFit.cover, scale: 1.0,)),
                            ),
                          ),
        
                          SizedBox(height: 10,),
                          Text("Tanvir Ishrak", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                          ),
                          Text("tanvirishrak@gmail.com", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5)),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    )
                  ],
                  
                ),
              ),
              SizedBox(height: 10,),
              // Spacer(),
              Padding(padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                      Row(
                        children: [
                          Text("Your Books ", style: Theme.of(context).textTheme.bodyMedium,),
                        ],
                      ),
        
                      Column(
                        children: bookData.map((e) => BookTile(
                          
                          coverURL: e.bookurl!,
                          title: e.title!,
                          author: e.author!,
                          price: e.price!,
                          rating: e.rating!,
                          totalRating: e.numberOfRatings ?? 0,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetails(book: e,)));
                          },
                        )).toList(), 
                      )   
                    
                  ],
                ),
              )
        
            ],
          ),
      ),


    );
  }
}