import express from "express";
import cors from "cors";
import routeCase from "./routes/cases.js";
import routeIndice from "./routes/indices.js";
import routeQuestion from "./routes/questions.js";
import routeCharacter from "./routes/characters.js";

const app = express()

app.use(cors());

app.use('/cases', routeCase);
app.use('/', routeIndice);
app.use('/', routeQuestion);
app.use('/', routeCharacter);

app.use((req, res) => res.status(404).json({ erreur: "Route inconnue" }));

app.use((err, req, res, next) => {
  console.error(err.message);
  res.status(500).json({ erreur: "Une erreur est survenue" });
});


app.listen(process.env.PORT);


