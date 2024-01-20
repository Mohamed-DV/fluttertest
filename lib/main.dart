import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
final List<Video> videos = [
  Video(
      thumbnail: 'images/firebase.jpeg',
      username: 'HeyFluttercom',
      caption: 'Flutter Tutorial - Firebase Setup [2022] Easy and Quick Firebase Setup!',
      vediourl: 'https://www.youtube.com/watch?v=YMx8Bbev6T4'
  ),
  Video(
      thumbnail: 'images/api.jpeg',
      username: 'Proto Coders Point',
      caption: 'Flutter Dio - Make API get request & show data in ListView',
      vediourl: 'https://www.youtube.com/watch?v=6x098QQM7Ew'
  ),
  Video(
      thumbnail: 'images/podcast.webp',
      username: 'GeeksBlaBla',
      caption: 'What are the differences and similarities between Objective C and Swift ?',
      vediourl: 'https://www.youtube.com/watch?v=OGNWgRaiWJg'
  ),
  Video(
      thumbnail: 'images/farouk.jpeg',
      username: 'Farouk Life',
      caption: 'حقيقة إحتفالية أوناحي ! شكون قصد ؟',
      vediourl: 'https://www.youtube.com/watch?v=gAqg4bSLlN8'
  ),
  Video(
      thumbnail: 'images/Protoje.jpg',
      username: 'Protoje',
      caption: 'Protoje - Ten Cane Row Ft. Jorja Smith (Visualizer)',
      vediourl: 'https://www.youtube.com/watch?v=r7GoEu5ddSI&list=RDZ04PEg2QwNY&index=6'
  ),


  Video(
      thumbnail: 'images/labradore.webp',
      username: 'Marvelous Dogs',
      caption: 'Labrador Colors: Your Complete Guide to All 6 Popular Labrador Colors!',
      vediourl: 'https://www.youtube.com/watch?v=xxC4iePyfNo&t=122s'
  ),

  Video(
      thumbnail: 'images/surf.webp',
      username: 'The Surf Tribe',
      caption: 'Arakmaja - A Moroccan Surf Documentary',
      vediourl: 'https://www.youtube.com/watch?v=8zCOASi24oA'
  ),

  Video(
      thumbnail: 'images/comping.jpeg',
      username: 'Gingium',
      caption: 'College Dropout Converts an OLD SCHOOL BUS into the ULTIMATE ADVENTURE VEHICLE',
      vediourl: 'https://www.youtube.com/watch?v=3BpxCrdKUV8'
  ),
  Video(
      thumbnail: 'images/inkonnu.jpeg',
      username: 'inkonnu',
      caption: 'Inkonnu - BREDA ( OFFICIAL MUSIC VIDEO) prod by Orpheus',
      vediourl: 'https://www.youtube.com/watch?v=fzTT75K-dWU'
  ),







];
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(VideoApp());
}

class VideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:
      ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(child: VideoDetailScreen(video: videos[index]), type: PageTransitionType.bottomToTop),
                // MaterialPageRoute(
                //   builder: (context) => VideoDetailScreen(video: videos[index]),
                // ),
              );
            },
            // child: ClipRRect(
            //   Image.asset(videos[index].thumbnail)
            // ),
            child: ListTile(

              leading: Image.asset(videos[index].thumbnail, ),
              title: Text(videos[index].caption,style: TextStyle(fontFamily: 'EBGramond',fontSize: 15,)),
              subtitle: Text(videos[index].username,style: TextStyle(fontFamily: 'VesperLibre',fontSize: 10),),

            ),
          );

        },
      ),
    );
  }
}

class VideoDetailScreen extends StatefulWidget {
  final Video video;


  VideoDetailScreen({required this.video});



  @override
  State<VideoDetailScreen> createState()=> _VideoDetailScreenState(video: video);
}

class _VideoDetailScreenState extends State<VideoDetailScreen>{
  final  Video video;

  _VideoDetailScreenState({required this.video});



  late YoutubePlayerController _controller;
  @override
  void initState(){
    final videourl=video.vediourl;
    final videoId=YoutubePlayer.convertUrlToId(videourl)as String;
    _controller=YoutubePlayerController(initialVideoId: videoId,flags: YoutubePlayerFlags(
      autoPlay: false,)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

          children: [
            
              YoutubePlayer(controller: _controller,showVideoProgressIndicator: true,bottomActions: [
                CurrentPosition(),
              ],),

           SizedBox(height: 16.0),
            Text(
              video.caption,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,fontFamily: 'EBGramond',),
            ),
            SizedBox(height: 8.0),
            Text(video.username,style: TextStyle(fontSize: 16,fontFamily: 'VesperLibre',color: Colors.grey[800]),).animate().fade(duration: 2000.ms,begin: .1,end: .8).slideY(curve: Curves.easeIn,begin: 5,end: 1),

          ],

      ),
    );
  }
}


class Video {
  final String thumbnail;
  final String username;
  final String caption;
  final String vediourl;

  Video({required this.thumbnail, required this.username, required this.caption, required this.vediourl});
}