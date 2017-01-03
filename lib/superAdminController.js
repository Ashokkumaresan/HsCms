var superAdminController=angular.module('superAdminController',[]);

superAdminController.controller('superAdminLoginController',['$scope','$http',function($scope,$http){
 document.title="Hs SuperAdmin";
$scope.submit=function(){
	alert($scope.username);
	$scope.submitted = true;
} 
}]);