import './Commissariat.css'
import { useState} from 'react'
import { Link } from 'react-router-dom'

export default function Commissariat () {

    const [open, setOpen] = useState(false)
    const [step, setStep] = useState(1)
    const [end, setEnd] = useState(false)



    return (
        <>
        <div className='page-commi'>
            <button onClick={() => setOpen(true)}><img className="officer" src="/images/personnages/09_commissaire_duval.png" alt="Commissaire Duval" /></button>
            {open && <div>
                <button className="modal-fermer" onClick={() => setOpen(false)}>X</button>
                <h1>commissaire Duval</h1>
                {step === 1 && (
                <p>Détective Carrel, merci d'être venu si vite. Asseyez-vous.
                </p>  
                )}
                {step === 2 && (
                <p>Marcel Vidal, 62 ans, propriétaire de la Galerie Vidal, a été retrouvé mort dans son bureau vendredi soir. La vitre est brisée, le coffre est ouvert : tout ressemble à un cambriolage.
                </p>  
                )}
                {step === 3 && (
                <p>Mais ça ne me plaît pas. Quatre personnes tournaient autour de lui : un avocat, un livreur, une journaliste et un ancien employé. Je veux savoir lequel.
                </p>  
                )}
                {step === 4 && (
                <p>Mes agents vous aideront. Moreau garde la scène de crime et la rue. Le docteur Diallo vous attend à la morgue. Lopez s'occupe des interrogatoires.
                </p>  
                )}
                {step === 5 && (
                <p>Fouillez les lieux, posez vos questions, comparez ce qu'on vous répond. Les gens mentent. Les preuves, non.
                </p>  
                )}
                {step === 6 && (
                <p>Une chose : je ne peux pas vous ouvrir toutes les portes. Il faudra d'abord réunir au moins cinq indices pour convaincre un juge.
                </p>  
                )}
                {step === 7 && (
                <p>Quand vous serez sûr de vous, accusez. Un nom et trois preuves. Vous avez trois tentatives, pas une de plus.
                </p>  
                )}
                {step === 8 && (
                <p>Bonne chance, détective. Ne me ramenez pas un innocent.
                </p>  
                )}
                {step < 8 && (
                <button className="btn-suivant" onClick={() => setStep(step + 1)}>
                Suivant
                </button>
                )}
                {step === 8 && (
                <button className="btn-suivant" onClick={() => {
                    setOpen(false);
                    setEnd(true);
                }}>
                Finir
                </button>
                )}
                {step > 1 && (
                <button className="btn-precedent" onClick={() => setStep(step - 1)}>
                Précédent
                </button>
                )}

     
            </div>}
        {end && !open && (
                    <Link className="btn-scene" to="/scene-de-crime">
                        Allons sur la scène de crime
                    </Link>
                    )}

        </div>
        </>
    )
}
