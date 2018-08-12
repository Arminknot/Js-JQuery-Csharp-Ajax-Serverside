using System;
using System.Collections.Generic;
using System.Collections;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;


public partial class script_index : System.Web.UI.Page
{

    public class artists
    {
        public string artist;
        public string album;
        public int price;
        public string pic;
        public double rate;
        public string review;


        public artists(string artist, string album, int price, string pic, double rate, string review)
        {
            this.artist = artist;
            this.album = album;
            this.price = price;
            this.pic = pic;
            this.rate = rate;
            this.review = review;
        }
    }

    public static List<artists> archive = new List<artists>();


    //get size of DB========================================

    [WebMethod]
    public static int getSize()
    {
        return archive.Count;
    }


    [WebMethod]
    public static List<artists> getAll(string st,string cu)
    {
        int s = Convert.ToInt32(st);
        int c = Convert.ToInt32(cu);

        if (s + c > archive.Count)
        {
            c = archive.Count - s;
        }

        return archive.GetRange(s, c);
    } 

    protected void Page_Load(object sender, EventArgs e)
    {
        archive.Clear();

        archive.Add(new artists("A$AP Ferg", "Striving", 8, "7.jpg", 3.4, "The line between “mixtape” and a proper “album” has long been inexorably blurred, with the distinction lying mostly in how the artist chooses to refer to it. For Ferg, it appears to be an indictment of the record’s quality, or perhaps how much time he spent on it."));
        archive.Add(new artists("Cardi B", "Invasion", 15, "8.jpg", 4.4, "Invasion of Privacy is an emphatic response to those skeptics. The album is showy and upfront, at once brazen and vulnerable. On her assured and outspoken debut, Cardi shuffles from pop-rap to designer trap to sing-song ballads and strutting promenades."));
        archive.Add(new artists("Drake", "Scorpion", 16, "9.jpg", 5, "On ‘Survival’, the first of 25 tracks from Drake’s colossal, dual-sided album ‘Scorpion’, the rapper opens by directly addressing his current state of affairs: “All of this disorder, no addressin’ / The crown is broken in pieces, but there’s more in my possession”."));
        archive.Add(new artists("Wiz Khalifa", "Khalifa", 13, "10.jpg", 4, "His sixth studio album, Khalifa, would suggest he’s splitting the difference—creating an album that is more personal (hence its partially eponymous title). After all, Wiz’s relationship with pot is a very personal thing (to him) and so is his need for success."));
        archive.Add(new artists("Tyga", "Rawwest", 10, "11.jpg", 4, "Laced with 16 tracks in total, the follow up to Fuk Wat They Talkin Bout is led by the previously heard singles “Baller Alert,” & “Dope’d Up,” which if you remember received a Thriller-inspired video starring Kylie Jenner a couple months back."));
        archive.Add(new artists("G-Eazy", "The Plan", 12, "12.jpg", 3.8, "G-Eazy continuously proves he's one of the most underrated artists. His catalog is filled with bangers and he consistently delivers every single time. The Bay Area recently revealed the album and release date of his upcoming album."));

        archive.Add(new artists("Drake", "More Life", 12, "1.jpg", 4.5, "He seems to be tacitly admitting to this stagnation throughout the warm, pulsing, and generous More Life. His solution is a “Playlist” that forces Drake out into the sunlight again."));
        archive.Add(new artists("2 Chainz", "Tyti Boi", 15, "2.jpg", 4.2, "For one, 2 Chainz knows how fortunate he is. Daniel Son ; Necklace Don, his third project this year, is informed—at points consumed—by the circumstances in which Tauheed Epps grew up."));
        archive.Add(new artists("21 Savage", "Issa", 16, "3.jpg", 5, "Capitalizing on the momentum, 21 Savage has returned with his debut, again accompanied by Metro, this time with assistance from Southside, Zaytoven, DJ Mustard, Jake One, Pi’erre Bourne (of “Magnolia” fame), and more."));
        archive.Add(new artists("A$AP Rockey", "Testing", 13, "4.jpg", 4, "Testing, Rocky’s third studio album and first outing without the direct oversight of his late friend and counsel A$AP Yams, uses intuition as its guiding force, broadening Rocky’s palette by simply trusting what he likes and what he doesn’t."));
        archive.Add(new artists("Kendrick Lamar", "Damn", 10, "5.jpg", 5, "Storytelling has been Lamar’s greatest skill and most primary mission, to put into (lots of) words what it's like to grow up as he did—to articulate, in human terms, the intimate specifics of daily self-defense from your surroundings."));
        archive.Add(new artists("Post Malone", "Beerbongs", 12, "6.jpg", 4.2, "Lil Uzi Vert, Lil Yachty, and their peers may have ushered in rap’s current rock-star era, but none have run quite as far with the premise as Post Malone. For Post, “rock star” is less a genre signifier and more a declaration of mass appeal."));

        archive.Add(new artists("Behzad Leito", "23", 0, "13.jpg", 4, "After khakestari album he started new album 23 with famouse persian artists like Alireza JJ and Sijal. main style in this album is Trap and produced well. as an artist he work great and he is one of biggest persian third generation Hiphop artist."));
        archive.Add(new artists("Taham", "Esfand", 0, "14.jpg", 3.5, "This is newest taham album that released in her birthday month Esfan as you see album name is the same. this is an artistic album and he say his words as an headmaster of tribe called 'Degaran' with 4 main characters Shabbin, Chaz, Ati, Dayan"));
        archive.Add(new artists("Poobon", "Wolfie", 0, "15.jpg", 4.5, "one of welltuned and high quality persians album is Wolfie by Poobon he is talented artist and producer from canada work with Mo Fiyah and many talented Iranians in canada main style is melodic trap musics we counting down months for his new release Wolfie 2"));
        archive.Add(new artists("Sepehr Khalse", "Yadegari", 0, "16.jpg", 4, "After releasing album with Behzad Leito Sepehr work with Alireza JJ for his personal Album yadegari. Yadegari is story of Sepehr's personal life as rapper and contain all kind of styles and songs tracks are heavily tuned and music are catchy as he said in before"));
        archive.Add(new artists("Erfan", "Khodafezi", 0, "17.jpg", 4.3, "After deciding to say goodbye to rap and his music career Erfan release his album named Khodafezi. like before main song worked with A+ musics and we see all Paydar's member takepart in his Album including former member Khashayar. "));
        archive.Add(new artists("Mehrad Hidden", "Toonel", 0, "18.jpg", 4.5, "There is no doubt that Mehrad is one the biggest Persian artist both in hiphop and rock. now he releasing toonel album with various international Persians like Arash dara Rassek and ... album is Artistic and 100% recommended."));

        archive.Add(new artists("Black Sabbath", "Black Sabbath", 8, "19.jpg", 3.4, "The line between “mixtape” and a proper “album” has long been inexorably blurred, with the distinction lying mostly in how the artist chooses to refer to it. For Ferg, it appears to be an indictment of the record’s quality, or perhaps how much time he spent on it."));
        archive.Add(new artists("Black Sabbath", "Paranoid", 15, "20.jpg", 4.4, "Invasion of Privacy is an emphatic response to those skeptics. The album is showy and upfront, at once brazen and vulnerable. On her assured and outspoken debut, Cardi shuffles from pop-rap to designer trap to sing-song ballads and strutting promenades."));
        archive.Add(new artists("Black Sabbath", "Master", 16, "21.jpg", 5, "On ‘Survival’, the first of 25 tracks from Drake’s colossal, dual-sided album ‘Scorpion’, the rapper opens by directly addressing his current state of affairs: “All of this disorder, no addressin’ / The crown is broken in pieces, but there’s more in my possession”."));
        archive.Add(new artists("Black Sabbath", "Sabotage", 13, "22.jpg", 4, "His sixth studio album, Khalifa, would suggest he’s splitting the difference—creating an album that is more personal (hence its partially eponymous title). After all, Wiz’s relationship with pot is a very personal thing (to him) and so is his need for success."));
        archive.Add(new artists("Black Sabbath", "Mob Rules", 10, "23.jpg", 4, "Laced with 16 tracks in total, the follow up to Fuk Wat They Talkin Bout is led by the previously heard singles “Baller Alert,” & “Dope’d Up,” which if you remember received a Thriller-inspired video starring Kylie Jenner a couple months back."));
        archive.Add(new artists("Black Sabbath", "Forbidden", 12, "24.jpg", 3.8, "G-Eazy continuously proves he's one of the most underrated artists. His catalog is filled with bangers and he consistently delivers every single time. The Bay Area recently revealed the album and release date of his upcoming album."));
        
        archive.Add(new artists("Elle King", "Love Stuff", 12, "25.jpg", 4.5, "He seems to be tacitly admitting to this stagnation throughout the warm, pulsing, and generous More Life. His solution is a “Playlist” that forces Drake out into the sunlight again."));
        archive.Add(new artists("Grimes", "Visions", 15, "26.jpg", 4.2, "For one, 2 Chainz knows how fortunate he is. Daniel Son ; Necklace Don, his third project this year, is informed—at points consumed—by the circumstances in which Tauheed Epps grew up."));
        archive.Add(new artists("Grimes", "Art Angels", 16, "27.jpg", 5, "Capitalizing on the momentum, 21 Savage has returned with his debut, again accompanied by Metro, this time with assistance from Southside, Zaytoven, DJ Mustard, Jake One, Pi’erre Bourne (of “Magnolia” fame), and more."));
        archive.Add(new artists("Gun N' Roses", "G N' R Lies", 13, "28.png", 4, "Testing, Rocky’s third studio album and first outing without the direct oversight of his late friend and counsel A$AP Yams, uses intuition as its guiding force, broadening Rocky’s palette by simply trusting what he likes and what he doesn’t."));
        archive.Add(new artists("Metallica", "Kill 'em All", 10, "29.jpg", 5, "Storytelling has been Lamar’s greatest skill and most primary mission, to put into (lots of) words what it's like to grow up as he did—to articulate, in human terms, the intimate specifics of daily self-defense from your surroundings."));
        archive.Add(new artists("Metallica", "Creeping Death", 12, "30.jpg", 4.2, "Lil Uzi Vert, Lil Yachty, and their peers may have ushered in rap’s current rock-star era, but none have run quite as far with the premise as Post Malone. For Post, “rock star” is less a genre signifier and more a declaration of mass appeal."));

        archive.Add(new artists("Metallica", "Load", 0, "31.jpg", 4, "After khakestari album he started new album 23 with famouse persian artists like Alireza JJ and Sijal. main style in this album is Trap and produced well. as an artist he work great and he is one of biggest persian third generation Hiphop artist."));
        archive.Add(new artists("Metallica", "Reload", 0, "32.jpg", 3.5, "This is newest taham album that released in her birthday month Esfan as you see album name is the same. this is an artistic album and he say his words as an headmaster of tribe called 'Degaran' with 4 main characters Shabbin, Chaz, Ati, Dayan"));
        archive.Add(new artists("Metallica", "Garage Inc", 0, "33.jpg", 4.5, "one of welltuned and high quality persians album is Wolfie by Poobon he is talented artist and producer from canada work with Mo Fiyah and many talented Iranians in canada main style is melodic trap musics we counting down months for his new release Wolfie 2"));
        archive.Add(new artists("Metallica", "St. Anger", 0, "34.jpg", 4, "After releasing album with Behzad Leito Sepehr work with Alireza JJ for his personal Album yadegari. Yadegari is story of Sepehr's personal life as rapper and contain all kind of styles and songs tracks are heavily tuned and music are catchy as he said in before"));
        archive.Add(new artists("Nirvana", "Bleach", 0, "35.jpg", 4.3, "After deciding to say goodbye to rap and his music career Erfan release his album named Khodafezi. like before main song worked with A+ musics and we see all Paydar's member takepart in his Album including former member Khashayar. "));
        archive.Add(new artists("Nirvana", "Nevermind", 0, "36.jpg", 4.5, "There is no doubt that Mehrad is one the biggest Persian artist both in hiphop and rock. now he releasing toonel album with various international Persians like Arash dara Rassek and ... album is Artistic and 100% recommended."));

        archive.Add(new artists("Pink Floyd", "More", 8, "37.jpg", 3.4, "The line between “mixtape” and a proper “album” has long been inexorably blurred, with the distinction lying mostly in how the artist chooses to refer to it. For Ferg, it appears to be an indictment of the record’s quality, or perhaps how much time he spent on it."));
        archive.Add(new artists("Pink Floyd", "Ummagumma", 15, "38.jpg", 4.4, "Invasion of Privacy is an emphatic response to those skeptics. The album is showy and upfront, at once brazen and vulnerable. On her assured and outspoken debut, Cardi shuffles from pop-rap to designer trap to sing-song ballads and strutting promenades."));
        archive.Add(new artists("Pink Floyd", "Meddle", 16, "39.jpg", 5, "On ‘Survival’, the first of 25 tracks from Drake’s colossal, dual-sided album ‘Scorpion’, the rapper opens by directly addressing his current state of affairs: “All of this disorder, no addressin’ / The crown is broken in pieces, but there’s more in my possession”."));
        archive.Add(new artists("Pink Floyd", "Relics", 13, "40.jpg", 4, "His sixth studio album, Khalifa, would suggest he’s splitting the difference—creating an album that is more personal (hence its partially eponymous title). After all, Wiz’s relationship with pot is a very personal thing (to him) and so is his need for success."));
        archive.Add(new artists("Pink Floyd", "Animals", 10, "41.jpg", 4, "Laced with 16 tracks in total, the follow up to Fuk Wat They Talkin Bout is led by the previously heard singles “Baller Alert,” & “Dope’d Up,” which if you remember received a Thriller-inspired video starring Kylie Jenner a couple months back."));
        archive.Add(new artists("Pink Floyd", "The Wall", 12, "42.jpg", 3.8, "G-Eazy continuously proves he's one of the most underrated artists. His catalog is filled with bangers and he consistently delivers every single time. The Bay Area recently revealed the album and release date of his upcoming album."));

        archive.Add(new artists("Poets of the Fall", "Jealous Gods", 12, "43.jpg", 4.5, "He seems to be tacitly admitting to this stagnation throughout the warm, pulsing, and generous More Life. His solution is a “Playlist” that forces Drake out into the sunlight again."));
        archive.Add(new artists("Queen", "Jazz", 15, "44.png", 4.2, "For one, 2 Chainz knows how fortunate he is. Daniel Son ; Necklace Don, his third project this year, is informed—at points consumed—by the circumstances in which Tauheed Epps grew up."));
        archive.Add(new artists("Queen", "The Game", 16, "45.png", 5, "Capitalizing on the momentum, 21 Savage has returned with his debut, again accompanied by Metro, this time with assistance from Southside, Zaytoven, DJ Mustard, Jake One, Pi’erre Bourne (of “Magnolia” fame), and more."));
        archive.Add(new artists("Queen", "Hot Space", 13, "46.png", 4, "Testing, Rocky’s third studio album and first outing without the direct oversight of his late friend and counsel A$AP Yams, uses intuition as its guiding force, broadening Rocky’s palette by simply trusting what he likes and what he doesn’t."));
        archive.Add(new artists("Queen", "The Miracle", 10, "47.png", 5, "Storytelling has been Lamar’s greatest skill and most primary mission, to put into (lots of) words what it's like to grow up as he did—to articulate, in human terms, the intimate specifics of daily self-defense from your surroundings."));
        archive.Add(new artists("Queen", "Innuendo", 12, "48.png", 4.2, "Lil Uzi Vert, Lil Yachty, and their peers may have ushered in rap’s current rock-star era, but none have run quite as far with the premise as Post Malone. For Post, “rock star” is less a genre signifier and more a declaration of mass appeal."));

        archive.Add(new artists("Lana Del Rey", "Honeymoon", 0, "49.jpg", 4, "After khakestari album he started new album 23 with famouse persian artists like Alireza JJ and Sijal. main style in this album is Trap and produced well. as an artist he work great and he is one of biggest persian third generation Hiphop artist."));
        archive.Add(new artists("Grimes", "Halfaxa", 0, "50.jpg", 3.5, "This is newest taham album that released in her birthday month Esfan as you see album name is the same. this is an artistic album and he say his words as an headmaster of tribe called 'Degaran' with 4 main characters Shabbin, Chaz, Ati, Dayan"));
        archive.Add(new artists("Pink Floyd", "Works", 0, "51.jpg", 4.5, "one of welltuned and high quality persians album is Wolfie by Poobon he is talented artist and producer from canada work with Mo Fiyah and many talented Iranians in canada main style is melodic trap musics we counting down months for his new release Wolfie 2"));
        archive.Add(new artists("Pink Floyd", "Pulse", 0, "52.jpg", 4, "After releasing album with Behzad Leito Sepehr work with Alireza JJ for his personal Album yadegari. Yadegari is story of Sepehr's personal life as rapper and contain all kind of styles and songs tracks are heavily tuned and music are catchy as he said in before"));
        archive.Add(new artists("Rammstein", "Rosenrot", 0, "53.jpg", 4.3, "After deciding to say goodbye to rap and his music career Erfan release his album named Khodafezi. like before main song worked with A+ musics and we see all Paydar's member takepart in his Album including former member Khashayar. "));
        archive.Add(new artists("Rammstein", "Mutter", 0, "54.jpg", 4.5, "There is no doubt that Mehrad is one the biggest Persian artist both in hiphop and rock. now he releasing toonel album with various international Persians like Arash dara Rassek and ... album is Artistic and 100% recommended."));

    }
}