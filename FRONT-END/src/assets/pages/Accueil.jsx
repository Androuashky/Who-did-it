import './Accueil.css';
import { useNavigate } from 'react-router-dom';

export default function Home() {
  const navigate = useNavigate();
  return (
    <div className="accueil">
      <h1><span>Who</span><br />did it ?</h1>
      <p className="sous-titre">Résous des enquêtes<br />Trouve le coupable</p>
      <button className="btn-jouer" onClick={() => navigate('/cases')}>▶ JOUER</button>
      <p className="clignote">UNE AFFAIRE T'ATTEND...</p>
    </div>
  );
}