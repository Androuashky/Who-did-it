import express from 'express';
import pool from '../db.js'

const routeCase = express.Router()


routeCase.get("/", async (req, res, next)=> {
    try{
        const {rows} = await pool.query(`SELECT * FROM cases`);
            res.json(rows)
    } catch(err) {
        next(err)
    }
});

routeCase.get("/:id", async (req, res, next) => {

    try{
        const idCase = Number(req.params.id);
        const {rows} = await pool.query(`SELECT * FROM cases WHERE cases.id = $1`, 
        [idCase],
        ); 

        if (rows.length === 0) {
            return res.status(404).json({ erreur: "Enquête introuvable"});
        }
        
        res.json(rows[0])

    } catch(err) {
        next(err)
    }
    
});


export default routeCase;