var hdnCount = 0;
alert("siema");
function readCheckBoxList() {
    getSelectionCount();
    var cbl = document.getElementById('<%=cblCustomerList.ClientID%>');
    var browser = navigator.appName;
    var pos = 0;
    if (browser.indexOf("Microsoft") >= 0) {
        pos = 0;
    }
    else {
        pos = 1;
    }
    var tbody = cbl.childNodes[pos];
    var length = tbody.childNodes.length–pos;

    if (hdnCount > 1) {
        var div = document.getElementById('<%=divDDL.ClientID%>');
        div.innerHTML = "Multiple customers selected";
        return;

    }
    else {
        for (i = 0; i < length; i++) {
            var td = tbody.childNodes[i].childNodes[pos];
            var chk = td.childNodes[0];
            if (chk.checked) {
                var div = document.getElementById('<%=divDDL.ClientID%>');
                div.innerHTML = chk.nextSibling.innerHTML;
            }
        }

    }
}
function getSelectionCount() {
    var cbl = document.getElementById('<%=cblCustomerList.ClientID%>');
    var browser = navigator.appName;
    var pos = 0;
    if (browser.indexOf("Microsoft") >= 0) {
        pos = 0;
    }
    else {
        pos = 1;
    }
    var tbody = cbl.childNodes[pos];
    var length = tbody.childNodes.length–pos;
    hdnCount = 0;
    for (i = 0; i < length; i++) {
        var td = tbody.childNodes[i].childNodes[pos];
        var chk = td.childNodes[0];
        if (chk.checked) {
            hdnCount++;
        }
    }
}