const express = require('express');
const mysql = require('mysql');

const app = express();
const port = 8080;

const db = mysql.createConnection({
  host: process.env.DATABASE_HOST, 
  user: 'root', 
  password: 'password', 
  database: 'recipesAppDatabase' 
});

db.connect((err) => {
  if (err) throw err;
  console.log('Connected to the database.');
});

app.get('/', (req, res) => {
  res.send('Hello, world!'); // Change this to send a different response
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
