/proc/texttospeechstrip(var/t_in)
	var/t_out = ""

	for(var/i=1, i<=length(t_in), i++)
		var/ascii_char = text2ascii(t_in,i)
		switch(ascii_char)
			// A .. Z
			if(65 to 90)                        //Uppercase Letters
				if(lentext(t_out) <= 150)
					t_out += ascii2text(ascii_char)
			// a .. z
			if(97 to 122)                        //Lowercase Letters
				if(lentext(t_out) <= 150)
					t_out += ascii2text(ascii_char)

			// 0 .. 9
			if(48 to 57)                        //Numbers
				if(lentext(t_out) <= 150)
					t_out += ascii2text(ascii_char)


			// ` , - . ! ? : '
			if(39,44,45,46,33,63,58,96,60,62)                        //Common name punctuation
				if(lentext(t_out) <= 150)
					t_out += ascii2text(ascii_char)


			//Space
			if(32)
				if(lentext(t_out) <= 150)
					t_out += ascii2text(ascii_char)

	return t_out

/var/lastspeak = ""

/mob/proc/texttospeech(var/text)

	spawn(0)
		var/list/voiceslist = list()

		voiceslist["msg"] = text
		voiceslist["ckey"] = name2
		var/params = list2params(voiceslist)
		//params = replacetext(params, "&", "^&")

		call("writevoice.dll", "writevoicetext")(params)
		//shell("cmd /C echo [params]>>scripts\\voicequeue.txt")


/client/proc/texttospeech(var/text, var/clientkey)
	spawn(0)
		var/list/voiceslist = list()

		voiceslist["msg"] = text
		voiceslist["ckey"] = clientkey
		var/params = list2params(voiceslist)
		//params = replacetext(params, "&", "^&")

		call("writevoice.dll", "writevoicetext")(params)
		//shell("cmd /C echo [params]>>scripts\\voicequeue.txt")

/client/Command(var/command)
	return ..()