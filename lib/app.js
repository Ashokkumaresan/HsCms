var HsApp=angular.module('HsApp',['ngRoute','superAdminController']);
HsApp.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){

	$routeProvider.when('/superAdmin',{
		templateUrl:'pages/superAdmin.html',
		controller:'superAdminLoginController'
	}).
	when('/dashboard',{
		templateUrl:'pages/hs-dashboard.html',
		controller:'dashboardController'
	}).
	otherwise({
		redirectTo:'/superAdmin'
	});

}]);