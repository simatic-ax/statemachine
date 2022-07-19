NAMESPACE Simatic.Ax.StateFramework
    INTERFACE IState

        METHOD OnEntry
        END_METHOD

        METHOD OnExit
        END_METHOD

        METHOD Action
        END_METHOD

        METHOD GetTransition : ITransition
            VAR_INPUT 
                pos : UINT;
            END_VAR
        END_METHOD
        
        METHOD TransitionCount : UINT
        END_METHOD    

        METHOD GetStateID : INT
        END_METHOD

        METHOD GetStateName : STRING
        END_METHOD


    END_INTERFACE
END_NAMESPACE


