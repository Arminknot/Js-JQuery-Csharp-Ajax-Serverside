<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="script_index" %>

<!DOCTYPE html>

<html>

<head>

    <title>HipHop Revelution</title>

    <link href="style/base.css" rel="stylesheet" />

    <script src="script/jquery.js"></script>


    <!--Creatin Elements Whit jQuery =====================================================-->

    <script>

        window.onload = function () { }

        $(document).ready(function () {

            for (i = 0; i < artists1.length; i++) {

                it = $("<div>").addClass("items");

                des = $("<div>").addClass("detail");

                head = $("<div>").addClass("deshead").html("Description:");

                note = $("<div>").addClass("note").html(artists1[i].review);

                nam = $("<div>").addClass("language").html("jQ").css({ background: "green" });

                im = $("<img>").attr({ src: "pic/" + artists1[i].pic });

                h = $("<h2>").html(artists1[i].artist);

                anc = $("<a>").html("Album: " + artists1[i].album);

                pipi = $("<a>").addClass("price").html("Price: " + artists1[i].price);

                st = $("<div>").addClass("star").css({ width: (25 * artists1[i].rate)-2 + "px" });

                it.append(des).append(nam).append(im).append(h).append(anc).append(pipi).append(st);

                des.append(head).append(note);

                $("#all").append(it);
            }

        });

    </script>


</head>






<body>


    <!--Left Side Menu ====================-------------------------------------------->


    <!--////Menu Switcher////-->


    <div id="fixing" class="fix ">

        <div id="switcher" onclick="switcher()">

            <div class="mainarrow">

                <div id="topi" class="top "></div>
                <div id="downi" class="down "></div>

            </div>

        </div>


        <!--Menu Items-->

        <div class="menu">Home</div>
        <div class="menu">Albums</div>
        <div class="menu">Artists</div>
        <div class="menu">Genres</div>



        <!--Grid View Changer-->

        <div id="grid" onclick="openmenu()">

            <div class="text">View</div>

            <div id="sixitem" runat="server" onclick="normalview()" style="color: #534fe2">Normal View</div>

            <div id="detailview" runat="server" onclick="detailview()">Show Details</div>

        </div>


        <!--Search Box-->

        <div class="searchbox" onclick="openmenu()">

            <div class="look">Look</div>

            <input class="button" placeholder="Search ..." />
        </div>

    </div>


    <!--Navigation Panel on Top ====================-------------------------------------------->

    <div id="nav">


        <!--Page Changer-->

        <div id="left"></div>
        <div class="set">1</div>
        <div>2</div>
        <div>3</div>
        <div id="right"></div>

        <!--Grid Count Options-->

        <select id="select">

            <option selected>View Count</option>
            <option>6</option>
            <option>12</option>
            <option>18</option>

        </select>

    </div>


    <!--Main Music Box ====================!!!!!!!!!!!!!!!!!!!!!!!!!!!!--------->
    <div id="all" runat="server">
        <!--including items and elements made in jQuery above -->
    </div>



</body>






<script>

        function openmenu() {
        if (tt == 0) {
            switcher();
        }
    }


        //==============switch view botton=================================
        function detailview() {
            all.className = "view2";
            $("#detailview").css({ color: "#534fe2" });
            $("#sixitem").css({ color: "" });
        }

        function normalview() {
            all.className = all.className.replace("view2", "");
            $("#detailview").css({ color: "" });
            $("#sixitem").css({ color: "#534fe2" });
        }

        //switch left tab=================================================

        tt = 0;
        function switcher() {

            if (tt == 0) {
                $("#fixing").addClass("fixed");
                $("#topi").addClass("open");
                $("#downi").addClass("open");
                $("body").css({ padding: "0 0 0 300px" });
                tt = 1;
            } else {
                $("#fixing").removeClass("fixed");
                $("#topi").removeClass("open");
                $("#downi").removeClass("open");
                $("body").css({ padding: "0 0 0 50px" });
                tt = 0;
            }
        }

    

</script>


</html>
