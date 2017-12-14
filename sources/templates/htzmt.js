$(function () {$('[data-toggle="tooltip"]').tooltip();});

function selChanged($name, $val)
{
    location.href = URL_add_parameter(location.href, $name, $val);
}

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
                    location.href = URL_add_parameter(location.href, "last_insert_id", reload);
                }
                else
                {
                    loops++;

                    // force reload every minute ...
                    if (!(loops % 30))
                    {
                        location.href = URL_add_parameter(location.href, "last_insert_id", "");
                    }
                }
            }
        };

        // Use POST to avoid caching
        ajax.open("POST", "http://htzmt.coujo.de/.logger/stamp.txt", true);
        ajax.send();
    },
2000);

// --------------------------------------
// scroll position after reload ...
// --------------------------------------
function saveScrollPos()
{
    sessionStorage.scrollTop = $(this).scrollTop();
}

function scrollToSaved()
{
    if (sessionStorage.scrollTop != "undefined")
    {
        $(window).scrollTop(sessionStorage.scrollTop);
    }
}

$(window).scroll(saveScrollPos);
$(document).ready(scrollToSaved);

