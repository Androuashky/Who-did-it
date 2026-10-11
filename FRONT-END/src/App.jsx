import './App.css'
import Accueil from './assets/pages/Accueil.jsx'
import Perso from "./assets/pages/Personnages.jsx"
import Cases from './assets/pages/Cases.jsx'
import NbCase from './assets/pages/NbCase.jsx'
import Commissariat from './assets/Case1/Commissariat.jsx';
import {Routes, Route} from 'react-router-dom'

function App() {
  

  return (
    <>
    <Routes>
      <Route path="/" element={<Accueil/>}/>
      <Route path="/cases" element={<Cases/>}/>
      <Route path="/cases/:id" element={<NbCase/>}/>
      <Route path="/commissariat" element={<Commissariat />} />
      <Route path="/:id/characters" element={<Perso />} />
      <Route path="*" element={<Accueil/>}/>
    </Routes>
    </>
  )
}

export default App
