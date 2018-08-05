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

            for (i = 0; i < artists1.length ; i++) {

                it = $("<div>").addClass("items");

                des = $("<div>").addClass("detail");

                head = $("<div>").addClass("deshead").html("Description:");

                note = $("<div>").addClass("note").html(artists1[i].review);

                nam = $("<div>").addClass("language").html("jQ").css({ background: "green" });

                im = $("<img>").attr({ src: "pic/" + artists1[i].pic });

                h = $("<h2>").html(artists1[i].artist);

                anc = $("<a>").html("Album: " + artists1[i].album);

                pipi = $("<a>").addClass("price").html("Price: " + artists1[i].price);

                st = $("<div>").addClass("star").css({ width: 25 * artists1[i].rate + "px" });

                it.append(des).append(nam).append(im).append(h).append(anc).append(pipi).append(st);

                des.append(head).append(note);

                $("#all").append(it);
            }

        });

    </script>

</head>

<body>




    <div id="savage"></div>


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

        <div id="sixitem" runat="server" onclick="normalview()">Normal<br>
            View</div>

        <div id="detailview" runat="server" onclick="detailview()">Show<br>
            Details</div>

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
    artists = [{ artist: "Drake", album: "More Life", price: 12, pic: "1.jpg", rate: 4.5, review: "He seems to be tacitly admitting to this stagnation throughout the warm, pulsing, and generous More Life. His solution is a “Playlist” that forces Drake out into the sunlight again." },
    { artist: "2 Chainz", album: "Tyti Boi", price: 10, pic: "2.jpg", rate: 4.2, review: "For one, 2 Chainz knows how fortunate he is. Daniel Son ; Necklace Don, his third project this year, is informed—at points consumed—by the circumstances in which Tauheed Epps grew up. " },
    { artist: "21 Savage", album: "Issa", price: 13, pic: "3.jpg", rate: 5, review: "Capitalizing on the momentum, 21 Savage has returned with his debut, again accompanied by Metro, this time with assistance from Southside, Zaytoven, DJ Mustard, Jake One, Pi’erre Bourne (of “Magnolia” fame), and more. " },
    { artist: "A$AP Rockey", album: "Testing", price: 9, pic: "6.jpg", rate: 4, review: "Testing, Rocky’s third studio album and first outing without the direct oversight of his late friend and counsel A$AP Yams, uses intuition as its guiding force, broadening Rocky’s palette by simply trusting what he likes and what he doesn’t. " },
    { artist: "Kendrick Lamar", album: "Damn", price: 13, pic: "5.jpg", rate: 5, review: "Storytelling has been Lamar’s greatest skill and most primary mission, to put into (lots of) words what it's like to grow up as he did—to articulate, in human terms, the intimate specifics of daily self-defense from your surroundings." },
    { artist: "Post Malone", album: "Beerbongs", price: 11, pic: "4.jpg", rate: 4.2, review: "Lil Uzi Vert, Lil Yachty, and their peers may have ushered in rap’s current rock-star era, but none have run quite as far with the premise as Post Malone. For Post, “rock star” is less a genre signifier and more a declaration of mass appeal. " }]


    // data for jQuery section=====================----------------------
    artists1 = [{ artist: "Behzad Leito", album: "23", price: "Free", pic: "13.jpg", rate: 4, review: "After khakestari album he started new album 23 with famouse persian artists like Alireza JJ and Sijal. main style in this album is Trap and produced well. as an artist he work great and he is one of biggest persian third generation Hiphop artist." },
            { artist: "Taham", album: "Esfand", price: "Free", pic: "14.jpg", rate: 3.5, review: "This is newest taham album that released in her birthday month Esfan as you see album name is the same. this is an artistic album and he say his words as an headmaster of tribe called 'Degaran' with 4 main characters Shabbin, Chaz, Ati, Dayan" },
            { artist: "Poobon", album: "Wolfie", price: "Free", pic: "15.jpg", rate: 4.5, review: "one of welltuned and high quality persians album is Wolfie by Poobon he is talented artist and producer from canada work with Mo Fiyah and many talented Iranians in canada main style is melodic trap musics we counting down months for his new release Wolfie 2" },
            { artist: "Sepehr Khalse ", album: "Yadegari", price: "Free", pic: "16.jpg", rate: 4, review: "After releasing album with Behzad Leito Sepehr work with Alireza JJ for his personal Album yadegari. Yadegari is story of Sepehr's personal life as rapper and contain all kind of styles and songs tracks are heavily tuned and music are catchy as he said in before" },
            { artist: "Erfan", album: "Khodafezi", price: "Free", pic: "17.jpg", rate: 4.3, review: "After deciding to say goodbye to rap and his music career Erfan release his album named Khodafezi. like before main song worked with A+ musics and we see all Paydar's member takepart in his Album including former member Khashayar. " },
            { artist: "Mehrad Hidden", album: "Toonel", price: "Free", pic: "18.jpg", rate: 4.5, review: "There is no doubt that Mehrad is one the biggest Persian artist both in hiphop and rock. now he releasing toonel album with various international Persians like Arash dara Rassek and ... album is Artistic and 100% recommended." }]

    // all.innerHTML = artists[3].album;

    for (i = 0; i < artists.length; i++) {

        it = document.createElement("div");
        it.className = "items";

        des = document.createElement("div");
        des.className = "detail";

        head = document.createElement("div");
        head.className = "deshead";
        head.innerHTML = "Description:";

        note = document.createElement("div");
        note.className = "note";
        note.innerHTML = artists[i].review;

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

        it.appendChild(des);
        des.appendChild(head);
        des.appendChild(note);
        it.appendChild(nam);
        it.appendChild(im);
        it.appendChild(h);
        it.appendChild(anc);
        it.appendChild(pipi);
        it.appendChild(st);


        all.appendChild(it);
    }


    //===============================================
    function detailview(){
        all.className = "view2";
    }

    function normalview() {
        all.className = all.className.replace("view2", "");
    }

</script>


</html>
