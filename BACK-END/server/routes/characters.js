import express from "express";
import pool from "../db.js";

const routeCharacter = express.Router();

routeCharacter.get("/:id/characters", async (req, res, next)=> {
    try {
    const idCase = Number(req.params.id)

    const {rows} = await pool.query(`SELECT * from characters WHERE case_id = $1`, [idCase],);

    if (rows.length === 0) {
            return res.status(404).json({ erreur: "Enquête introuvable" });
        }

    res.json(rows)
    }catch(err){
        next(err)
    }
});

export default routeCharacter