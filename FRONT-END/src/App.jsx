import './App.css'
import Perso from "./assets/pages/Personnages.jsx"
import {Routes, Route} from 'react-router-dom'

function App() {
  

  return (
    <>
    <Routes>
      <Route path="/:id/characters" element={<Perso />} />
    </Routes>
    </>
  )
}

export default App
