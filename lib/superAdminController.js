var superAdminController=angular.module('superAdminController',[]);

superAdminController.controller('superAdminLoginController',['$scope','$http','$location',function($scope,$http,$location){
 document.title="Hs SuperAdmin";
$scope.submit=function(){
	//alert($scope.username);
	$scope.submitted = true;
	 $location.path("/dashboard");
} 
}]);
superAdminController.controller("dashboardController",['$scope','$http',function($scope,$http){
 document.title="Dashboard";
}]);