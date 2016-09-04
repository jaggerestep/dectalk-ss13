using System;
using SharpTalk;
using System.Web;
using System.Diagnostics;
class Program
{
    static void Main(string[] args)
    {
        Console.Title = "SharpTalk Speaking Terminal";
        long length;
        while (true)
        {
            length = new System.IO.FileInfo("scripts\\voicequeue.txt").Length;
            System.IO.FileStream file;
            if (length > 0)
            {
                System.Console.WriteLine(length);
                file = System.IO.File.Open("scripts\\voicequeue.txt", System.IO.FileMode.Open);

                byte[] result = new byte[file.Length];
                file.Read(result, 0, (int)file.Length);
                string result2 = System.Text.Encoding.UTF8.GetString(result);
                char delimiter = char.Parse("\n");
                if (result2.Contains("\n"))
                {
                    Array lines = result2.Split(delimiter);
                    foreach (string i in lines)
                    {
                        if (i != "")
                        {
                            System.Console.WriteLine("Multiline");
                            speak(i);
                        }
                    }
                }
                else
                {
                    System.Console.WriteLine($"Singleline: {result2}");
                    speak(result2);
                }
                file.SetLength(0);
                file.Close();
            }
            System.Threading.Thread.Sleep(50);
        }
    }

    static void speak(string msg)
    {
        using (var tts = new FonixTalkEngine())
        {
            
            System.Collections.Specialized.NameValueCollection list = HttpUtility.ParseQueryString(msg);
           
            string message = list["msg"];
            string ckey = list["ckey"];
            ckey = ckey.Replace(System.Environment.NewLine, string.Empty);
            ckey = ckey.Replace("\r", string.Empty);
            message = HttpUtility.HtmlDecode(message);
            Console.WriteLine($"{message} {ckey} length:{ckey.Length}");
            foreach (char c in ckey)
            {
                Console.WriteLine(System.Convert.ToInt32(c));
            }
            try
            {
                tts.SpeakToWavFile($"sound\\playervoices\\{ckey}.wav", message);
            }
            catch {
                Console.WriteLine("Failed");
            }
            

            Process process = new Process();
            ProcessStartInfo startInfo = new ProcessStartInfo();
            startInfo.WindowStyle = ProcessWindowStyle.Hidden;
            startInfo.FileName = "OggEnc.exe";
            startInfo.Arguments = $"sound\\playervoices\\{ckey}.wav";
            process.StartInfo = startInfo;
            process.Start();

        }
    }
}
