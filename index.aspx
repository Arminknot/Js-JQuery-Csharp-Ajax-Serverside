<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="script_index" %>

<!DOCTYPE html>

<html>

<head>

    <title>HipHop Revelution</title>

    <link href="style/base.css" rel="stylesheet" />

    <script src="script/jquery.js"></script>

    <script>

        window.onload = function () {
        }

        $(document).ready(function () {

            for (i = 0; i < artists1.length ;i++){

                it = $("<div>").addClass("items");

                nam = $("<div>").addClass("language").html("jQ").css({background:"green"});

                im = $("<img>").attr({ src: "pic/" + artists1[i].pic });

                h = $("<h2>").html(artists1[i].artist);

                anc = $("<a>").html("Album: " + artists1[i].album);

                pipi = $("<a>").addClass("price").html("Price: " + artists1[i].price);

                st = $("<div>").addClass("star").css({ width: 25 * artists1[i].rate + "px" });

                it.append(nam).append(im).append(h).append(anc).append(pipi).append(st);

                $("#all").append(it);
            }

        });

    </script>

</head>

<body>



    <div id="title">Hip Hop
        <br />
        Revolution</div>



    <!--Right side menu ====================------------------------------------------->

    <div class="fix">
        <div class="menu">Home</div>
        <div class="menu">New</div>
        <div class="menu">Artists</div>
        <div class="menu">Genres</div>
        <div class="menu">App</div>

        <div class="icon ic1" title="iTunes"></div>
        <div class="icon ic2" title="Deezer"></div>
        <div class="icon ic3" title="Google Music"></div>
        <div class="icon ic4" title="Spotify"></div>
        <div class="icon ic5" title="iHeart Radio"></div>

    </div>

    <div id="head">Buy New Albums</div>

    <div id="all" runat="server">

        <!--     <div class="items">
                    <img> 
                    <h2>اسم</h2>
                    <a href="#">شهر</a>
                 </div>
        -->

    </div>

</body>

<script>

    // data for Javascript section=================----------------------
    artists = [{ artist: "Drake", album: "More Life", price: 12, pic: "1.jpg", rate:4.5 },
            { artist: "2 Chainz", album: "Tyti Boi", price: 10, pic: "2.jpg",rate:4.2 },
            { artist: "21 Savage", album: "Issa", price: 13, pic: "3.jpg",rate:5 },
            { artist: "A$AP Rockey", album: "Testing", price: 9, pic: "6.jpg",rate:4 },
            { artist: "Kendrick Lamar", album: "Damn", price: 13, pic: "5.jpg",rate:5 },
            { artist: "Post Malone", album: "Beerbongs", price: 11, pic: "4.jpg",rate:4.2 }]


    // data for jQuery section=====================----------------------
    artists1 = [{ artist: "Behzad Leito", album: "23", price: "Free", pic: "13.jpg",rate:4 },
            { artist: "Taham", album: "Esfand", price: "Free", pic: "14.jpg",rate:3.5 },
            { artist: "Poobon", album: "Wolfie", price: "Free", pic: "15.jpg" ,rate:4.5},
            { artist: "Sepehr Khalse ", album: "Yadegari", price: "Free", pic: "16.jpg",rate:4 },
            { artist: "Erfan", album: "Khodafezi", price: "Free", pic: "17.jpg",rate:4.3 },
            { artist: "Mehrad Hidden", album: "Toonel", price: "Free", pic: "18.jpg",rate:4.5 }]

    // all.innerHTML = artists[3].album;

    for (i = 0; i < artists.length; i++) {

        it = document.createElement("div");
        it.className = "items";

        nam = document.createElement("div");
        nam.className = "language";
        nam.innerHTML = "JS"

        im = document.createElement("img");
        im.src = "pic/" + artists[i].pic;


        h = document.createElement("h2");
        h.innerHTML = artists[i].artist;

        anc = document.createElement("a");
        anc.innerHTML = "Album: " + artists[i].album;

        pipi = document.createElement("a");
        pipi.className = "price";
        pipi.innerHTML = "Price: " + artists[i].price + " $";

        st = document.createElement("div");
        st.className = "star";
        st.style.width = 25 * artists[i].rate + "px";

        it.appendChild(nam);
        it.appendChild(im);
        it.appendChild(h);
        it.appendChild(anc);
        it.appendChild(pipi);
        it.appendChild(st);


        all.appendChild(it);
    }

</script>


</html>
