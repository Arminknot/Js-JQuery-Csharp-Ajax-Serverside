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


        public artists(string artist, string album, int price, string pic)
        {
            this.artist = artist;
            this.album = album;
            this.price = price;
            this.pic = pic;

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        List<artists> archive = new List<artists>();

        archive.Add(new artists("A$AP Ferg", "Striving", 8, "7.jpg"));
        archive.Add(new artists("Cardi B", "Invasion", 15, "8.jpg"));
        archive.Add(new artists("Drake", "Scorpion", 16, "9.jpg"));
        archive.Add(new artists("Wiz Khalifa", "Khalifa", 13, "10.jpg"));
        archive.Add(new artists("Tyga", "Rawwest", 10, "11.jpg"));
        archive.Add(new artists("G-Eazy", "The Plan", 12, "12.jpg"));

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

            it.Controls.Add(nam);
            it.Controls.Add(im);
            it.Controls.Add(h);
            it.Controls.Add(anc);
            it.Controls.Add(caca);
 
            all.Controls.Add(it);
        }

    }
}