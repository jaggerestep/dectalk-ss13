

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
