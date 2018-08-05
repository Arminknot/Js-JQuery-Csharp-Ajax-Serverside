using System;
using System.Collections.Generic;
using System.Collections;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Web.UI.HtmlControls;


public partial class script_index : System.Web.UI.Page
{

    class artists
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
    protected void Page_Load(object sender, EventArgs e)
    {

        List<artists> archive = new List<artists>();

        archive.Add(new artists("A$AP Ferg", "Striving", 8, "7.jpg",3.4, "The line between “mixtape” and a proper “album” has long been inexorably blurred, with the distinction lying mostly in how the artist chooses to refer to it. For Ferg, it appears to be an indictment of the record’s quality, or perhaps how much time he spent on it. "));
        archive.Add(new artists("Cardi B", "Invasion", 15, "8.jpg",4.4, "Invasion of Privacy is an emphatic response to those skeptics. The album is showy and upfront, at once brazen and vulnerable. On her assured and outspoken debut, Cardi shuffles from pop-rap to designer trap to sing-song ballads and strutting promenades. "));
        archive.Add(new artists("Drake", "Scorpion", 16, "9.jpg",5, "On ‘Survival’, the first of 25 tracks from Drake’s colossal, dual-sided album ‘Scorpion’, the rapper opens by directly addressing his current state of affairs: “All of this disorder, no addressin’ / The crown is broken in pieces, but there’s more in my possession”."));
        archive.Add(new artists("Wiz Khalifa", "Khalifa", 13, "10.jpg",4, "His sixth studio album, Khalifa, would suggest he’s splitting the difference—creating an album that is more personal (hence its partially eponymous title). After all, Wiz’s relationship with pot is a very personal thing (to him) and so is his need for success."));
        archive.Add(new artists("Tyga", "Rawwest", 10, "11.jpg",4, "Laced with 16 tracks in total, the follow up to Fuk Wat They Talkin Bout is led by the previously heard singles “Baller Alert,” & “Dope’d Up,” which if you remember received a Thriller-inspired video starring Kylie Jenner a couple months back."));
        archive.Add(new artists("G-Eazy", "The Plan", 12, "12.jpg",3.8, "G-Eazy continuously proves he's one of the most underrated artists. His catalog is filled with bangers and he consistently delivers every single time. The Bay Area recently revealed the album and release date of his upcoming album."));

        // all.InnerHtml = archive[4].album;



        for (int i = 0; i < archive.Count; i++)
        {
            HtmlGenericControl it = new HtmlGenericControl("div");
            it.Attributes["class"] = "items";

            HtmlGenericControl des = new HtmlGenericControl("div");
            des.Attributes["class"] = "detail";

                HtmlGenericControl head = new HtmlGenericControl("div");
                head.Attributes["class"] = "deshead";
                head.InnerHtml = "Description:";

                HtmlGenericControl note = new HtmlGenericControl("div");
                note.Attributes["class"] = "note";
                note.InnerHtml = archive[i].review;

            HtmlGenericControl nam = new HtmlGenericControl("div");
            nam.Attributes["class"] = "language";
            nam.Style["background"] = "purple";
            nam.InnerHtml = "C#";

            HtmlImage im = new HtmlImage();
            im.Src = "pic/" + archive[i].pic;

            HtmlGenericControl h = new HtmlGenericControl("h2");
            h.InnerHtml = archive[i].artist;

            HtmlAnchor anc = new HtmlAnchor();
            anc.HRef = "#";
            anc.InnerHtml = "Album: " + archive[i].album;

            HtmlAnchor caca = new HtmlAnchor();
            caca.Attributes["class"] = "price";
            caca.InnerHtml = "Price: " + archive[i].price + " $";

            HtmlGenericControl st = new HtmlGenericControl("div");
            st.Attributes["class"] = "star";
            st.Style["width"] = archive[i].rate*25+"px";

            it.Controls.Add(des);
                des.Controls.Add(head);
                des.Controls.Add(note);
            it.Controls.Add(nam);
            it.Controls.Add(im);
            it.Controls.Add(h);
            it.Controls.Add(anc);
            it.Controls.Add(caca);
            it.Controls.Add(st);

            all.Controls.Add(it);
        }

    }
}