import express from 'express';
import pool from "../db.js";

const routeQuestion = express.Router()

routeQuestion.get("/:id/questions", async (req, res, next) => {
    try{
        const idCase = Number(req.params.id)

        const {rows} = await pool.query(`
            SELECT questions.id, questions.case_id, suspects.name, suspects.role, suspects.description, suspects.image, questions.question, questions.answer
            FROM questions
            JOIN suspects ON suspects.id = questions.suspect_id 
            WHERE questions.case_id = $1`, [idCase],);

        if (rows.length === 0){
            return res.status(404).json({erreur: "Enquêtes introuvable"})
        }

        res.json(rows[0])
    } catch(err){
        next(err)
    }
});

export default routeQuestion