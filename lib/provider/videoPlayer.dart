import 'package:flutter/foundation.dart';

class VideoPlayerState with ChangeNotifier{
    String _videoLink = '';
    String _videoTitle = '';
    String get videoLink => _videoLink;
    String get videoTitle => _videoTitle;
    void lectureLink(String link, String title){
        _videoLink = link;
        _videoTitle = title;
        notifyListeners();
    }
}