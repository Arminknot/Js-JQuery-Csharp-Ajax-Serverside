<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="script_index" %>

<!DOCTYPE html>

<html>

<head>
    <link href="style/base.css" rel="stylesheet" />
    <script src="script/jquery.js"></script>

</head>

<body>

    <div id="title">Hip Hop <br /> Revolution</div>

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

    artists = [{artist: "Drake", album: "More Life", price: 12,pic:"1.jpg" },
                {artist: "2 Chainz", album: "Tyti Boi", price: 10  ,pic:"2.jpg" },
                {artist: "21 Savage", album: "Issa", price: 13  ,pic:"3.jpg"},
                {artist: "A$AP Rockey", album: "Testing", price: 9  ,pic:"4.jpg"},
                {artist: "Kendrick Lamar", album: "Damn", price: 13 ,pic:"5.jpg" },
                {artist: "Post Malone", album: "Beerbongs", price: 11 , pic: "6.jpg" }]

    // all.innerHTML = artists[3].album;

    for (i = 0; i < artists.length;i++){

        it = document.createElement("div");
        it.className = "items";

            im = document.createElement("img");        
            im.src = "pic/" + artists[i].pic;


            h = document.createElement("h2");
            h.innerHTML = artists[i].artist;

            anc = document.createElement("a");
            anc.innerHTML = "Album: " + artists[i].album;
            anc.href = "#";

            pipi = document.createElement("a");
            pipi.className = "price";
            pipi.innerHTML ="Price: "+ artists[i].price +" $";

            it.appendChild(im);
            it.appendChild(h);
            it.appendChild(anc);
            it.appendChild(pipi);


            all.appendChild(it);
    }


</script>


</html>
