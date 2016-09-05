This is a FonixTalk (Formerly known as DecTalk) wrapper for ss13.

It uses: 

[SharpTalk](https://github.com/whatsecretproject/SharpTalk) For the C# program which reads scripts/voicequeue.txt in the ss13 folder (where the dmb is located) which is written to by ss13.

[WinVorbis](http://www.stationplaylist.com/winvorbis/) for OggEnc to convert the generated .wav to .ogg for saving bandwidth, you could skip this if you felt like it. OggEnc goes where dmb is.

I didn't make these and all credits go to the creators

texttospeech.dm is my implementation, you can do it however you want and for whatever you want.


You'll have to locate your own FonixTalk libraries because I cannot distribute them.

writevoice-dll is a separate c++ project for writing to the voicequeue, you can use it, or implement some other sort of interface.