// This is the main DLL file.

#include "stdafx.h"
#include <string.h>
#include <string>
#include <iostream>
#include <fstream>
#include "writevoice.h"

using namespace std;

#define DLL_EXPORT __declspec(dllexport)


extern "C" DLL_EXPORT const char* writevoicetext(int n, char *v[])
{
	ofstream voicefile;
	voicefile.open("scripts/voicequeue.txt", ios::out | ios::app);
	// extract args
	// ------------
	if (n < 1) return 0;
	string voicestring = v[0];
	voicefile << voicestring + "\n";
	voicefile.close();

	return "1";
}
