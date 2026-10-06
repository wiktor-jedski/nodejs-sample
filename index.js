const express = require('express');

const app = express();
const port = Number(process.env.PORT) || 3000;

app.get('/', (request, response) => {
  response.type('text/plain').send('Hello, world!\n');
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
