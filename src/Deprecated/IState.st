NAMESPACE Simatic.Ax.StatePattern
    INTERFACE IState 
        // Executes the active state in the deprecated state pattern.
        METHOD Execute
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
        END_METHOD

        // Called when the deprecated context enters the state.
        METHOD OnEntry
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
        END_METHOD
        
        // Called when the deprecated context leaves the state.
        METHOD OnExit
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
        END_METHOD
        
        // Called when the deprecated timeout expires.
        METHOD OnTimeout
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
        END_METHOD

    END_INTERFACE
END_NAMESPACE