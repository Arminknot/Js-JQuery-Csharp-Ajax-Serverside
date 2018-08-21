<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="script_index" %>

<!DOCTYPE html>

<html>

<head>

    <title>Music Revolution</title>

    <link href="style/base.css" rel="stylesheet" />

    <script src="script/jquery.js"></script>


    <!--Creatin Elements Whit jQuery =====================================================-->
    <script>
        fo = [];
        v = "v1";


        $(document).ready(function () {

            createtab(6);
            fill_items(0, 6);

            $("#select").change(function () {

                itemnumber = $("#select>option:selected").html();
                createtab(itemnumber);

                fill_items(0, itemnumber); //change item according to select view
            })


            $("#nav").on("click", "div:not(:eq(0)):not(:last-child)", function () {
                //all div's exept right & left
                $("#nav>div").removeClass("set");
                $(this).addClass("set");

                $("#nav>div:eq(0)").addClass("left");
                $("#nav>div:last-child").addClass("right");

                page = $(this).html();
                itemnumber = $("#select>option:selected").html();

                start = (page - 1) * itemnumber;
                fill_items(start, itemnumber);
            });


            ////call for right tab click function========================
            $("#nav").on("click", ".right", function () {
                sis = $("#nav>.set").html();
                if (num > sis) {
                    nexttab(sis);
                }
            });

            ////call for left tab click function========================
            $("#nav").on("click", ".left", function () {
                kiss = $("#nav>.set").html();
                if (1 < kiss) {
                    prevtab(kiss);
                }
            });

        })

        ////right tab click function==============================
        function nexttab(sis) {
            n = ++sis;
            //alert(n);
            $("#nav>div").removeClass("set");
            $("#nav>div:eq(" + n + ")").addClass("set");

            $("#nav>div:eq(0)").addClass("left");
            $("#nav>div:last-child").addClass("right");

            page = $("#nav>div:eq(" + n + ")").html();
            itemnumber = $("#select>option:selected").html();

            start = (page - 1) * itemnumber;
            fill_items(start, itemnumber);
        }

        ////left tab click function==============================
        function prevtab(kiss) {
            n = --kiss;
            //alert(n);
            $("#nav>div").removeClass("set");
            $("#nav>div:eq(" + n + ")").addClass("set");

            $("#nav>div:eq(0)").addClass("left");
            $("#nav>div:last-child").addClass("right");

            page = $("#nav>div:eq(" + n + ")").html();
            itemnumber = $("#select>option:selected").html();

            start = (page - 1) * itemnumber;
            fill_items(start, itemnumber);
        }

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
                        nam = $("<div>").addClass("language").html("jQ").css({
                            background: "brown"
                        });
                        im = $("<img>").attr({
                            src: "pic/" + fo[i].pic
                        });
                        h = $("<h2>").html(fo[i].artist);
                        anc = $("<a>").html("Album: " + fo[i].album);
                        pipi = $("<a>").addClass("price").html("Price: " + fo[i].price);
                        st = $("<div>").addClass("star").css({
                            width: (25 * fo[i].rate) - 2 + "px"
                        });

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

            <div id="sixitem" runat="server" onclick="normalview()" style="color: orangered">Normal</div>

            <div id="detailview" runat="server" onclick="detailview()">Details</div>

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
    //==============switch view botton=================================
    caca = "";

    function detailview() {
        $("#all").addClass("view2");
        $("#detailview").css({ color: "orangered" });
        $("#sixitem").css({ color: "" });
        caca = "view2";
    }

    function normalview() {
        all.className = all.className.replace("view2", "");
        $("#detailview").css({ color: "" });
        $("#sixitem").css({ color: "orangered" });
        caca = "";
    }

    //switch left tab=================================================

    tt = 0;

    function openmenu() {
        if (tt == 0) {
            switcher();
        }
    }

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
        $("#switcher>.mainarrow").css({ background: "#00c853" });
        $("#switcher>.mainarrow>.top").css({ background: "#00c853" });
        $("#switcher>.mainarrow>.down").css({ background: "#00c853" });
        $("#grid>#sixitem").removeClass().addClass("green");
        $("#grid>#detailview").removeClass().addClass("green");
        $("#nav").removeClass().addClass("green");
        $("#fixing>.menu").removeClass().addClass("menu green");
        $("#all").removeClass().addClass("green " + caca);

    }

    function yellow() {
        $("#switcher>.mainarrow").css({ background: "#FFA726" });
        $("#switcher>.mainarrow>.top").css({ background: "#FFA726" });
        $("#switcher>.mainarrow>.down").css({ background: "#FFA726" });
        $("#grid>#sixitem").removeClass().addClass("yellow");
        $("#grid>#detailview").removeClass().addClass("yellow");
        $("#nav").removeClass().addClass("yellow");
        $(".fix>.menu").removeClass().addClass("menu yellow");
        $("#all").removeClass().addClass("yellow " + caca);
    }

    function purple() {
        $("#switcher>.mainarrow").css({ background: "#AB47AC" });
        $("#switcher>.mainarrow>.top").css({ background: "#AB47AC" });
        $("#switcher>.mainarrow>.down").css({ background: "#AB47AC" });
        $("#grid>#sixitem").removeClass().addClass("purple");
        $("#grid>#detailview").removeClass().addClass("purple");
        $("#nav").removeClass().addClass("purple");
        $(".fix>.menu").removeClass().addClass("menu purple");
        $("#all").removeClass().addClass("purple " + caca);

    }

    function pink() {
        $("#switcher>.mainarrow").css({ background: "#EC407A" });
        $("#switcher>.mainarrow>.top").css({ background: "#EC407A" });
        $("#switcher>.mainarrow>.down").css({ background: "#EC407A" });
        $("#grid>#sixitem").removeClass().addClass("pink");
        $("#grid>#detailview").removeClass().addClass("pink");
        $("#nav").removeClass().addClass("pink");
        $(".fix>.menu").removeClass().addClass("menu pink");
        $("#all").removeClass().addClass("pink " + caca);
    }

    function blue() {
        $("#switcher>.mainarrow").css({ background: "#448AFF" });
        $("#switcher>.mainarrow>.top").css({ background: "#448AFF" });
        $("#switcher>.mainarrow>.down").css({ background: "#448AFF" });
        $("#grid>#sixitem").removeClass().addClass("blue");
        $("#grid>#detailview").removeClass().addClass("blue");
        $("#nav").removeClass().addClass("blue");
        $(".fix>.menu").removeClass().addClass("menu blue");
        $("#all").removeClass().addClass("blue " + caca);

    }
</script>


</html>
