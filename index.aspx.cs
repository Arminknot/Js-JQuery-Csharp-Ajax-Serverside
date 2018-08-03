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


        public artists(string artist, string album, int price, string pic, double rate)
        {
            this.artist = artist;
            this.album = album;
            this.price = price;
            this.pic = pic;
            this.rate = rate;

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        List<artists> archive = new List<artists>();

        archive.Add(new artists("A$AP Ferg", "Striving", 8, "7.jpg",3.4));
        archive.Add(new artists("Cardi B", "Invasion", 15, "8.jpg",4.4));
        archive.Add(new artists("Drake", "Scorpion", 16, "9.jpg",5));
        archive.Add(new artists("Wiz Khalifa", "Khalifa", 13, "10.jpg",4));
        archive.Add(new artists("Tyga", "Rawwest", 10, "11.jpg",4));
        archive.Add(new artists("G-Eazy", "The Plan", 12, "12.jpg",3.8));

        // all.InnerHtml = archive[4].album;



        for (int i = 0; i < archive.Count; i++)
        {
            HtmlGenericControl it = new HtmlGenericControl("div");
            it.Attributes["class"] = "items";

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