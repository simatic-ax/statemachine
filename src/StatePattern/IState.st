NAMESPACE Simatic.Ax.StatePattern
    INTERFACE IState 
        METHOD Execute
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
        END_METHOD

        METHOD OnEntry
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
        END_METHOD
        
        METHOD OnExit
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
        END_METHOD
        
        METHOD OnTimeout
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
        END_METHOD

    END_INTERFACE
END_NAMESPACE