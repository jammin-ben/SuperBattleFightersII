var list=argument0
var value=argument1

var arrayHasValue = false;
for (var i = 0, iLen = array_length_1d(list); i < iLen; i++) {
   if (list[i] == value) {
       arrayHasValue = true;
       break;
   }
}
return arrayHasValue