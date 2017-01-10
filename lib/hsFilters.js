var customFilters=angular.module('customFilters',[]).filter('capitalize', function() {
return function(input) {
// input will be the string we pass in
if (input)
return input[0].toLowerCase() +
input.slice(1);
}
});