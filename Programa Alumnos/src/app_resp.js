const { auth } = require('express-openid-connect');

const config = {
  authRequired: false,
  auth0Logout: true,
  secret: 'xn3RvmEn719ucoRVA48B7Brut9KZkw',
  baseURL: 'http://localhost:5000',
  clientID: 'JSQrJyoefIl2nMwgwXwIhwYgic7N8NUR',
  issuerBaseURL: 'https://horizon-software.us.auth0.com'
};

// auth router attaches /login, /logout, and /callback routes to the baseURL
app.use(auth(config));

// req.isAuthenticated is provided from the auth router
app.get('/', (req, res) => {
  res.send(req.oidc.isAuthenticated() ? 'Logged in' : 'Logged out');
});