<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="script_index" %>

<!DOCTYPE html>

<html>

<head>

    <title>Music Revolution</title>

    <link href="style/base.css" rel="stylesheet" />

    <script src="script/jquery.js"></script>


    <!--Creatin Elements Whit jQuery =====================================================-->

    <%--<script>

        window.onload = function () { }

        $(document).ready(function () {

            

        });

    </script>--%>

    <script>

        fo = [];
        v = "v1";


        $(document).ready(function () {

            createtab(6);
            fill_items(0, 6);

            $("#select").change(function () {

                itemnumber = $("#select>option:selected").html();
                createtab(itemnumber);

                fill_items(0, itemnumber);//change item according to select view
            })


            $("#nav").on("click", "div", function () {

                $("#nav>div").removeClass("set");
                $(this).addClass("set");
                $("#nav>div:eq(0)").addClass("left");
                $("#nav>div:last-child").addClass("right");

                page = $(this).html();
                itemnumber = $("#select>option:selected").html();

                start = (page - 1) * itemnumber;
                fill_items(start, itemnumber);
            });
        })


        function createtab(psize) {
            $.ajax({
                url: "index.aspx/getSize",
                data: {},
                dataType: "json",
                contentType: "application/json",
                type: "post",
                success: function (response) {

                    wsize = response.d;
                    num = Math.ceil(wsize / psize);

                    $("#nav>div").remove();
                    l = $("<div>").addClass("left");
                    r = $("<div>").addClass("right");

                    $("#nav").append(l);

                    for (i = 0; i < num; i++) {
                        tab = $("<div>").html(i + 1);
                        $("#nav").append(tab);
                    }

                    $("#nav").append(r); //right button must be last append

                    $("#nav>div:eq(1)").addClass("set");

                },
                error: function () { },

            });
        }




        //fill all items in page==================
        function fill_items(start, count) {
            $.ajax({
                url: "index.aspx/getAll",
                data: "{st:" + start + ",cu:" + count + "}",
                dataType: "json",
                contentType: "application/json",
                type: "post",
                success: function (response) {
                    fo = response.d;

                    $("#all").empty();

                    for (i = 0; i < fo.length; i++) {

                        it = $("<div>").addClass("items");
                        des = $("<div>").addClass("detail");
                        head = $("<div>").addClass("deshead").html("Description:");
                        note = $("<div>").addClass("note").html(fo[i].review);
                        nam = $("<div>").addClass("language").html("jQ").css({ background: "green" });
                        im = $("<img>").attr({ src: "pic/" + fo[i].pic });
                        h = $("<h2>").html(fo[i].artist);
                        anc = $("<a>").html("Album: " + fo[i].album);
                        pipi = $("<a>").addClass("price").html("Price: " + fo[i].price);
                        st = $("<div>").addClass("star").css({ width: (25 * fo[i].rate) - 2 + "px" });

                        it.append(des).append(nam).append(im).append(h).append(anc).append(pipi).append(st);
                        des.append(head).append(note);

                        $("#all").append(it);
                    }

                },
                error: function () { }

            });
        }

    </script>

</head>






<body>


    <!--add option to change main accent color-->

    <div id="color">
        <div class="pallet">
            <div id="green" onclick="green()"></div>
            <div id="yellow" onclick="yellow()"></div>
            <div id="purple" onclick="purple()"></div>
            <div id="pink" onclick="pink()"></div>
            <div id="blue" onclick="blue()" class="border"></div>
        </div>
    </div>


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

            <div id="sixitem" runat="server" onclick="normalview()" style="color: orangered">Normal View</div>

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

        <%--<div class="left"></div>
        <div class="set">1</div>
        <div>2</div>
        <div>3</div>
        <div class="right"></div>--%>

        <!--Grid Count Options-->
        <select id="select">

            <option selected>6</option>
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
        $("#detailview").css({ color: "orangered" });
        $("#sixitem").css({ color: "" });
    }

    function normalview() {
        all.className = all.className.replace("view2", "");
        $("#detailview").css({ color: "" });
        $("#sixitem").css({ color: "orangered" });
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

    //change theme=================================================
    $("#color>.pallet>div").click(function () {
        $("#color>.pallet>div").removeClass();
        $(this).addClass("border");
    })


    function green() {
        $("#switcher>.mainarrow").removeClass().addClass("mainarrow").addClass("green");
        $("#switcher>.mainarrow>.top").removeClass().addClass("top").addClass("green");
        $("#switcher>.mainarrow>.down").removeClass().addClass("down").addClass("green");
        $("#grid>#sixitem").removeClass().addClass("green");
        $("#grid>#detailview").removeClass().addClass("green");
        $("#nav>div").removeClass().addClass("green");
        $("#nav>div:eq(0)").removeClass().addClass("left");
        $("#nav>div:eq(1)").addClass("set");
        $("#nav>div:last-child").removeClass().addClass("right");
        $("#all>.items").removeClass().addClass("items").addClass("green");
        $(".fix>.menu").removeClass().addClass("menu").addClass("green");
    }

    function yellow() {
        $("#switcher>.mainarrow").removeClass().addClass("mainarrow").addClass("yellow");
        $("#switcher>.mainarrow>.top").removeClass().addClass("top").addClass("yellow");
        $("#switcher>.mainarrow>.down").removeClass().addClass("down").addClass("yellow");
        $("#grid>#sixitem").removeClass().addClass("yellow");
        $("#grid>#detailview").removeClass().addClass("yellow");
        $("#nav>div").removeClass().addClass("yellow");
        $("#nav>div:eq(0)").removeClass().addClass("left");
        $("#nav>div:eq(1)").addClass("set");
        $("#nav>div:last-child").removeClass().addClass("right");
        $("#all>.items").removeClass().addClass("items").addClass("yellow");
        $(".fix>.menu").removeClass().addClass("menu").addClass("yellow");
    }

    function purple() {
        $("#switcher>.mainarrow").removeClass().addClass("mainarrow").addClass("purple");
        $("#switcher>.mainarrow>.top").removeClass().addClass("top").addClass("purple");
        $("#switcher>.mainarrow>.down").removeClass().addClass("down").addClass("purple");
        $("#grid>#sixitem").removeClass().addClass("purple");
        $("#grid>#detailview").removeClass().addClass("purple");
        $("#nav>div").removeClass().addClass("purple");
        $("#nav>div:eq(0)").removeClass().addClass("left");
        $("#nav>div:eq(1)").addClass("set");
        $("#nav>div:last-child").removeClass().addClass("right");
        $("#all>.items").removeClass().addClass("items").addClass("purple");
        $(".fix>.menu").removeClass().addClass("menu").addClass("purple");
    }

    function pink() {
        $("#switcher>.mainarrow").removeClass().addClass("mainarrow").addClass("pink");
        $("#switcher>.mainarrow>.top").removeClass().addClass("top").addClass("pink");
        $("#switcher>.mainarrow>.down").removeClass().addClass("down").addClass("pink");
        $("#grid>#sixitem").removeClass().addClass("pink");
        $("#grid>#detailview").removeClass().addClass("pink");
        $("#nav>div").removeClass().addClass("pink");
        $("#nav>div:eq(0)").removeClass().addClass("left");
        $("#nav>div:eq(1)").addClass("set");
        $("#nav>div:last-child").removeClass().addClass("right");
        $("#all>.items").removeClass().addClass("items").addClass("pink");
        $(".fix>.menu").removeClass().addClass("menu").addClass("pink");
    }

    function blue() {
        $("#switcher>.mainarrow").removeClass().addClass("mainarrow").addClass("blue");
        $("#switcher>.mainarrow>.top").removeClass().addClass("top").addClass("blue");
        $("#switcher>.mainarrow>.down").removeClass().addClass("down").addClass("blue");
        $("#grid>#sixitem").removeClass().addClass("blue");
        $("#grid>#detailview").removeClass().addClass("blue");
        $("#nav>div").removeClass().addClass("blue");
        $("#nav>div:eq(0)").removeClass().addClass("left");
        $("#nav>div:eq(1)").addClass("set");
        $("#nav>div:last-child").removeClass().addClass("right");
        $("#all>.items").removeClass().addClass("items").addClass("blue");
        $(".fix>.menu").removeClass().addClass("menu").addClass("blue");
    }

</script>


</html>
