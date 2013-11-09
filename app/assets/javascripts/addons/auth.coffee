Whistlr.Auth = Em.Auth.extend
  signInEndPoint: '/auth/sign_in'
  signOutEndPoint: '/auth/sign_out'
  
  request: 'jquery'
  response: 'json'
  strategy: 'token'
  session: 'cookie'

  tokenKey: 'auth_token'
  tokenIdKey: 'user_id'
  tokenLocation: 'param'

  modules: ['emberData', 'rememberable']

  emberData: 
    userModel: 'user'

  rememberable:
    tokenKey: 'remember_token'
    autoRecall: true