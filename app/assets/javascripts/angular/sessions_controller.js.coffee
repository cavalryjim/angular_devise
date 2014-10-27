AngulaRails.controller "SessionsController", ($scope, $http) ->
  $scope.current_user = JSON.parse($("meta[name='current_user']").attr('content'))
  $scope.signOut = () ->
    $http(
      method: "DELETE"
      url: "/users/sign_out"
      headers: {'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')}
    )
    .success (data) ->
      $scope.current_user = null
    .error (data, status) ->
      alert("Error: #{status}.\n#{data}")