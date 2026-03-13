import 'package:flutter/material.dart'; 
import 'package:sample1/profiles/profile.dart';
// Flutter'ın Material Design kütüphanesini projeye ekler

void main() {
  runApp(const MyApp());  // Flutter uygulamasını başlatır ve MyApp widgetını çalıştırır
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // StatelessWidget = Durumu değişmeyen widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp uygulamanın temel yapısıdır
      debugShowCheckedModeBanner: false, // Sağ üstte çıkan DEBUG yazısını kaldırır
      title: "Gezdirelim", // Uygulama başlığı
      home: const HomePage(), // Uygulama açıldığında gösterilecek sayfa
    );
  }
}

//Variables
int counter = 0;

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      automaticallyImplyLeading: false,
      title: Text(
        "Gezdirelim",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Mont"
          ),
        ),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage())
              );
            }, 
            icon: Icon(Icons.account_circle_rounded,
            size: 30,
            color: Colors.white,
            ),
          ),
        SizedBox(width: 25),
        ],
      ),
      body: Center( // İçeriği ekranın ortasına yerleştirir
        child: Column( // Column widgetları dikey olarak sıralar
          mainAxisAlignment: MainAxisAlignment.center, // İçerikleri dikeyde ortalar
          
          children: [
            Text(
              "Merhaba Flutter", // Ekrana yazı yazdırır
              style: TextStyle(
                fontSize: 24, // Yazı boyutu
                fontWeight: FontWeight.bold, // Yazıyı kalın yapar
              ),
            ),

            SizedBox(height: 20), // Widgetlar arasında boşluk bırakır
            Container(
              width: 200, // Container genişliği
              height: 100, // Container yüksekliği
              color: Colors.blue, // Container arka plan rengi
              child: Center(
                child: Text(
                  "$counter",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            /* BUTTONLAR

            OutlinedButton(onPressed: (){}, child: Text("data")),
            IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            TextButton(onPressed: (){}, child: Text("data")),
            FloatingActionButton(onPressed: (){}),
            FilledButton(onPressed: (){}, child: Text("efe")),
            RawMaterialButton( onPressed: () {} , child: Text("data")), 

            */

            SizedBox(height: 20),
            ElevatedButton( // Tıklanabilir buton
              onPressed: () { // Butona basıldığında çalışacak kod
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyWidget()
                  )
                );
                print("Açıldı.");
              },
              child: Text("Butona Bas"), // Buton üzerinde yazan yazı
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => HomePage()
              )
            );
          },
        ),
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value Program",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              width: 200,
              color: Colors.amber[300],
              child: Center(
                child: Text("$counter"),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(()
                      {counter++;}
                    );
                  }, 
                  child: Text("Butona Bas")
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      counter = 0;
                    });
                }, child: Text("0"))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter = 0;
          });
        }
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.home))
        ],
      ),
    );
  }
}