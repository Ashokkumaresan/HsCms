var HsApp=angular.module('HsApp',['ngRoute','superAdminController']);
HsApp.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){
	$routeProvider.when('/superAdmin',{
		templateUrl:'pages/superAdmin.html',
		controller:'superAdminLoginController'
	}).
	otherwise({
		redirectTo:'/superAdmin'
	});
$locationProvider.html5Mode(true);
}]);