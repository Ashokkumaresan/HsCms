var superAdminController=angular.module('superAdminController',[]);

superAdminController.controller('superAdminLoginController',['$scope','$http','$location',function($scope,$http,$location){
 document.title="Hs SuperAdmin";
 $scope.Test=function(){
	console.log($scope.username); 
	$scope.security=12345;
 };
$scope.submit=function(){
	//alert($scope.username);
	$scope.submitted = true;
	 $location.path("/dashboard");
}; 
}]);
superAdminController.directive('ngSparkline',function(){
	return{
		restrict:"EAC",
		replace:true,
		template:'<div class="sparkline active"></div>'
	}
});
superAdminController.directive('checkCode',function(){
	return{
		require:"ng-model",
		link:function(scope,elem,attrs,ctrl){
			ctrl.$parsers.push(codeLength);
			ctrl.$parsers.push(checkSqrt);			
			ctrl.$formatters.unshift(codeLength);
			
			function codeLength(viewValue){
				if(viewValue.length==4)
					ctrl.$setValidity('checkCode',true);
				else
					ctrl.$setValidity('checkCode',false);
				return viewValue;
			}
			function checkSqrt(viewValue){
				if(Math.sqrt(viewValue)==80)
					ctrl.$setValidity('checkSqr',false);
				else
					ctrl.$setValidity('checkSqr',true);
				return viewValue;
			}
		}
	}
});
superAdminController.controller("dashboardController",['$scope','$http',function($scope,$http){
 document.title="Dashboard";
}]);

