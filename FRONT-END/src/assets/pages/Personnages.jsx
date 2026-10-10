import { useEffect, useState } from "react";
import { useParams } from 'react-router';
import './Personnages.css'

const api = "http://localhost:4000"

export default function Perso(){
    const[characters,setCharacters] = useState([]);
    const { id } = useParams();

    useEffect(()=> {
        async function loadCharacters(){
            try {
                const response = await fetch(`${api}/${id}/characters`)
                const data = await response.json();
                setCharacters(data);
            }catch(err){
               console.error(err) 
            }
        }
        loadCharacters();
    }, [id]);



    return(
        <>
<div className="page">
  <h1>Les personnages</h1>
  <div className="container">
    {characters.map((c) => (
      <section className="carte" key={c.id}>
        <img src={c.image} alt={c.name} />
        {c.suspect_id && <span className="badge">SUSPECT</span>}
        <h2>{c.name}</h2>
        <p className="role">{c.role}</p>
        <p className="desc">{c.description}</p>
      </section>
    ))}
  </div>
</div>
        </>
    )
}