import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import './Cases.css'



export default function Cases() {
    const navigate = useNavigate()
    const [investigate, setInvestigate] = useState([])
    const api = "http://localhost:4000"
    
    

    useEffect(()=> {
    async function loadCases () {
        try {
        const response = await fetch(`${api}/cases`);
        const data = await response.json();
        setInvestigate(data)
        } catch(err){
            console.error(err) 
        }
    } loadCases();
    },[])

    return(
        <>
        <div className="page-cases">
            <h1>Choisis une enquête</h1>
            <div className="liste-cases">
                {investigate.map((el) => (
                <section className="carte-case" key={el.id}>
                    <h2>{el.title}</h2>
                    <span className={`badge-difficulte difficulte-${el.difficulty.toLowerCase()}`}>
                    {el.difficulty}
                    </span>
                    <p>{el.description}</p>
                    <button className="btn-enqueter" onClick={() => navigate(`/cases/${el.id}`)}>
                    Je vais enquêter
                    </button>
                </section>
                ))}
            </div>
        </div>
        </>
    );
}