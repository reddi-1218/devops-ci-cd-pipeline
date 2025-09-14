const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.json({ message: 'Hello from DevOps sample app!', env: process.env.NODE_ENV || 'dev' });
});

app.get('/health', (req, res) => {
  res.send('OK');
});

app.listen(port, () => console.log(`App listening on port ${port}`));
