import express from "express";
import pool from "../db.js";

const routeIndice = express.Router();

routeIndice.get("/:id/indices", async (req, res, next)=> {
    try {
    const idCase = Number(req.params.id)

    const {rows} = await pool.query(`SELECT * from clues WHERE case_id = $1`, [idCase],);

    if (rows.length === 0) {
            return res.status(404).json({ erreur: "Enquête introuvable" });
        }

    res.json(rows)
    }catch(err){
        next(err)
    }
});

export default routeIndice