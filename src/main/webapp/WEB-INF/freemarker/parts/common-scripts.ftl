<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type='text/javascript'>
    var leftBarShowCounter = 0;
    document.addEventListener("DOMContentLoaded", function (event) {
        const showNavbar = (toggleId, navId, bodyId, headerId) => {
            const toggle = document.getElementById(toggleId),
                nav = document.getElementById(navId),
                bodypd = document.getElementById(bodyId),
                headerpd = document.getElementById(headerId)

            if (toggle && nav && bodypd && headerpd) {
                toggle.addEventListener('click', () => {
                    leftBarShowCounter = leftBarShowCounter % 2;

                    nav.classList.toggle('show')

                    if(leftBarShowCounter === 0) {
                        nav.classList.add("left-bar-opened");
                    }else{
                        nav.classList.remove("left-bar-opened");
                    }
                    leftBarShowCounter++;

                    toggle.classList.toggle('bx-x')

                    bodypd.classList.toggle('body-pd')

                    headerpd.classList.toggle('body-pd')
                })
            }
        }

        showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header')

        const linkColor = document.querySelectorAll('.nav_link')

        function colorLink() {
            if (linkColor) {
                linkColor.forEach(l => l.classList.remove('active'))
                this.classList.add('active')
            }
        }

        linkColor.forEach(l => l.addEventListener('click', colorLink))

    });
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>

<script type='text/javascript'>

document.addEventListener("DOMContentLoaded", function() {
    var filterBtn = document.getElementById('filter-btn');
    var btnTxt = document.getElementById('btn-txt');
    var filterAngle = document.getElementById('filter-angle');


    $('#filterbar').collapse(false);
    var count = 0, count2 = 0;

    function changeBtnTxt() {
        $('#filterbar').collapse(true);
        count++;
        if (count % 2 !== 0) {
            filterAngle.classList.add("fa-angle-right");
            btnTxt.innerText = "hide filters"
        } else {
            filterAngle.classList.remove("fa-angle-right")
            btnTxt.innerText = "show filters"
        }

    }

    $('#inner-box').collapse(true);
    $('#inner-box2').collapse(true);
    $('#inner-box3').collapse(true);

    var icon = document.getElementById('icon');

    function chnageIcon() {
        count2++;
        if (count2 % 2 != 0) {
            icon.innerText = "";
            icon.innerHTML = '<span class="far fa-times-circle" style="width:100%"></span>';
        }
        else {
            icon.innerText = "";
            icon.innerHTML = '<span class="navbar-toggler-icon"></span>';
        }
    }

});
function showPwd(id, el) {
    let x = document.getElementById(id);
    if (x.type === "password") {
        x.type = "text";
        el.className = 'fa fa-eye-slash align-self-center text-decoration-none text-dark-choco mr-2';
    } else {
        x.type = "password";
        el.className = 'fa fa-eye align-self-center text-decoration-none text-dark-choco mr-2';
    }
}
</script>