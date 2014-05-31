/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function object() {
    if (window.XMLHttpRequest) {
        xmhttp = new XMLHttpRequest();
    }
    else {
        xmhttp = new ActiveXObject('Microsoft.XMLHTTP');
    }
    return xmhttp;
}
var http = new object();

function checkin() {
    //document.getElementById('ress').innerHTML= "<p align='center'><img src='482.gif'/></p>"
    http.open('post', '../../CheckIn.jsp', false);
    http.onreadystatechange = process;
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
    nameuser = document.getElementById("field1").value;
    password=  document.getElementById("field2").value;
    //document.writeln(keyword);
    http.send('nameuser=' + nameuser+'&password='+password);
}
function process() {
    if (http.readyState == 4 && http.status == 200) {
        result = http.responseText;
        document.getElementById("show").innerHTML = result;
    }
}