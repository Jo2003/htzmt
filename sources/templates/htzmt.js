$(function () {$('[data-toggle="tooltip"]').tooltip();});

//------------------------------------------------------------------------------
//! check if element is visible on screen
//!
//! @param      {object}  elm     element
//! @return     {bool}  true -> is visible, false if not
//------------------------------------------------------------------------------
function checkVisible(elm)
{
    var rect = elm.getBoundingClientRect();
    var viewHeight = Math.max(document.documentElement.clientHeight, window.innerHeight);

    // make sure the whole object is visible!
    return ((rect.top > 0) && (rect.bottom < viewHeight));
}

//------------------------------------------------------------------------------
//! selection on select element changed
//!
//! @param      {string}  $name   select name
//! @param      {string}  $val    select value
//------------------------------------------------------------------------------
function selChanged($name, $val)
{
    location.href = URL_add_parameter(location.href, $name, $val);
}

//------------------------------------------------------------------------------
//! add a parameter to the url
//!
//! @param      {string}  url     The url
//! @param      {string}  param   The parameter
//! @param      {string}  value   The value
//! @return     {string}  new url string
//------------------------------------------------------------------------------
function URL_add_parameter(url, param, value)
{
    var hash       = {};
    var parser     = document.createElement("a");

    parser.href    = url;

    var parameters = parser.search.split(/\?|&/);

    for(var i=0; i < parameters.length; i++) {
        if(!parameters[i])
            continue;

        var ary      = parameters[i].split("=");
        hash[ary[0]] = ary[1];
    }

    hash[param] = value;

    var list = [];
    Object.keys(hash).forEach(function (key) {
        list.push(key + "=" + hash[key]);
    });

    parser.search = "?" + list.join("&");
    return parser.href;
}

// --------------------------------------
// reload on stamp change ...
// --------------------------------------
var lastStamp = "";
var loops     = 0;

setInterval(
    function()
    {
        var ajax = new XMLHttpRequest();
        ajax.onreadystatechange =
        function()
        {
            if (ajax.readyState == 4)
            {
                var reload = 0;
                if (ajax.responseText != lastStamp)
                {
                    if (lastStamp != "")
                    {
                        reload = lastStamp;
                    }
                    lastStamp = ajax.responseText;
                }

                if (reload != 0)
                {
                    loops = 0;
                    saveScrollPos();
                    Cookies.set('last_insert_id', reload);
                    location.reload(true);
                }
                else
                {
                    loops++;

                    // force reload every minute ...
                    if (!(loops % 5))
                    {
                        if (document.getElementById('scrollto') !== null)
                        {
                            saveScrollPos();
                            Cookies.remove('last_insert_id');
                            location.reload(true);
                        }
                    }
                }
            }
        };

        // Use POST to avoid caching
        ajax.open("POST", "http://htzmt.coujo.de/.logger/stamp.txt", true);
        ajax.send();
    },
2000);

//------------------------------------------------------------------------------
//! Saves a scroll position.
//------------------------------------------------------------------------------
function saveScrollPos()
{
    Cookies.set('last-scroll-top', $(window).scrollTop());
}

//------------------------------------------------------------------------------
//! scroll to saved scroll position
//------------------------------------------------------------------------------
function scrollToSaved()
{
    var lastScrollTop = Cookies.get('last-scroll-top');
    if (lastScrollTop)
    {
        $(window).scrollTop(lastScrollTop);
        Cookies.remove('last-scroll-top');
    }
}

//------------------------------------------------------------------------------
//! scroll to new inserted table item
//------------------------------------------------------------------------------
function scrollToNew()
{
    scrollToSaved();

    var scrollobj = document.getElementById('scrollto');
    if (scrollobj !== null)
    {
        if (!checkVisible (scrollobj))
        {
            $("html, body").delay(500).animate({scrollTop: $('#scrollto').offset().top }, 1000);
        }
    }
}

$(document).ready(scrollToNew);
$(document).scroll(saveScrollPos);
