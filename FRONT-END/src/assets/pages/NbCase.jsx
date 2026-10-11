// import { useNavigate } from "react-router-dom";
// import { useEffect, useState } from "react"; 
// import { useParams, Link } from "react-router-dom";



// export default function NbCase() {
//     const navigate = useNavigate()
//     const [nbcase, setNbcase] = useState([])
//     const api = "http://localhost:4000"
//     const {id} = useParams();
    
    

//     useEffect(()=> {
//     async function loadNbCases () {
//         try {
//         const response = await fetch(`${api}/cases/${id}`);
//         const data = await response.json();
//         setNbcase(data)
//         } catch(err){
//             console.error(err) 
//         }
//     } loadNbCases();
//     },[id])

//     return(
//         <>
//         {nbcase.map((el) => (
//         <div className="page-cases">            
//             <h1 key={el.id}>Bienvenue sur l'enquête {el.title}!</h1>
//             <aside>
//                     <span> {el.difficulty}</span>
//                     <p>{el.description}</p>
//             </aside>
//             <section>
//                 <button onClick={() => navigate(`/${el.id}/characters`)}> voir les personnages </button>

//             </section>
//             <Link to="/commissariat">
//                 <button>COMMENCER À INVESTIGUER</button>
//             </Link>

//         </div>
//                 ))}
            
        
//         </>
//     );
// }



import { useEffect, useState } from "react";
import { useNavigate, useParams, Link } from "react-router-dom";
import './NbCase.css'

export default function NbCase() {
  const navigate = useNavigate();
  const { id } = useParams();
  const [enquete, setEnquete] = useState(null);
  const api = "http://localhost:4000";

  useEffect(() => {
    async function loadNbCases() {
      try {
        const response = await fetch(`${api}/cases/${id}`);
        if (!response.ok) return;                         // affaire introuvable
        const data = await response.json();
        setEnquete(Array.isArray(data) ? data[0] : data); // tableau ou objet
      } catch (err) {
        console.error(err);
      }
    }
    loadNbCases();
  }, [id]);

  if (!enquete) return <div className="page-enquete" />;   // pendant le chargement

  return (
    <div className="page-enquete">
      <div className="dossier">
        <h1>Bienvenue sur l'enquête {enquete.title} !</h1>

        <span className={`niveau niveau-${enquete.difficulty.toLowerCase()}`}>
          {enquete.difficulty}
        </span>

        <p>{enquete.description}</p>

        <div className="actions">
          <button className="btn-voir" onClick={() => navigate(`/${enquete.id}/characters`)}>
            Voir les personnages
          </button>

          <Link className="btn-commencer" to="/commissariat">
            COMMENCER À INVESTIGUER
          </Link>
        </div>
      </div>
    </div>
  );
}