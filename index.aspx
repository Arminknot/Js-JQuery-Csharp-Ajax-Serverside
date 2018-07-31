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

                it.append(nam).append(im).append(h).append(anc).append(pipi);

                $("#all").append(it);
            }

        });

    </script>

</head>

<body>

    <div id="title">Hip Hop
        <br />
        Revolution</div>

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
                <h2>  اسم </h2>
                <a href="#">  شهر</a>
            </div>
        -->

    </div>

</body>

<script>
    artists = [{ artist: "Drake", album: "More Life", price: 12, pic: "1.jpg" },
            { artist: "2 Chainz", album: "Tyti Boi", price: 10, pic: "2.jpg" },
            { artist: "21 Savage", album: "Issa", price: 13, pic: "3.jpg" },
            { artist: "A$AP Rockey", album: "Testing", price: 9, pic: "4.jpg" },
            { artist: "Kendrick Lamar", album: "Damn", price: 13, pic: "5.jpg" },
            { artist: "Post Malone", album: "Beerbongs", price: 11, pic: "6.jpg" }]

    artists1 = [{ artist: "Behzad Leito", album: "23", price: "Free", pic: "13.jpg" },
            { artist: "Gdaal", album: "70", price: "Free", pic: "14.jpg" },
            { artist: "Poobon", album: "Wolfie", price: "Free", pic: "15.jpg" },
            { artist: "Sepehr Khalse ", album: "Yadegari", price: "Free", pic: "16.jpg" },
            { artist: "Tik Taak", album: "Tabie Bash", price: "Free", pic: "17.jpg" },
            { artist: "Mehrad Hidden", album: "Toonel", price: "Free", pic: "18.jpg" }]

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

        it.appendChild(nam);
        it.appendChild(im);
        it.appendChild(h);
        it.appendChild(anc);
        it.appendChild(pipi);


        all.appendChild(it);
    }
</script>


</html>
