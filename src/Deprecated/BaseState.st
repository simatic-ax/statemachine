USING Simatic.Ax.StatePattern;
NAMESPACE Simatic.Ax.StatePattern
    CLASS StateBase IMPLEMENTS IState
        VAR
            _nextState : IState;
            _nextStateTimeout : IState;
        END_VAR

        METHOD PUBLIC Config
            VAR_INPUT
                nextState : IState;
                nextStateTimeout : IState;
            END_VAR
            _nextState := nextState;
            _nextStateTimeout := nextStateTimeout;
        END_METHOD


        METHOD PUBLIC OnTimeout
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR    
            ;
        END_METHOD


        METHOD PUBLIC Execute
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
            ;
        END_METHOD

        METHOD PUBLIC OnEntry
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR;
        END_METHOD
        
        METHOD PUBLIC OnExit
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR;
        END_METHOD

    END_CLASS
END_NAMESPACE