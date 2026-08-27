USING Simatic.Ax.StatePattern;
NAMESPACE Simatic.Ax.StatePattern
    // Legacy base state from the deprecated state pattern implementation.
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
            // Stores the normal and timeout successor states.
            _nextState := nextState;
            _nextStateTimeout := nextStateTimeout;
        END_METHOD


        METHOD PUBLIC OnTimeout
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR    
            // Deprecated default implementation intentionally does nothing.
            ;
        END_METHOD


        METHOD PUBLIC Execute
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR
            // Deprecated default implementation intentionally does nothing.
            ;
        END_METHOD

        METHOD PUBLIC OnEntry
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR;
            // Deprecated default implementation intentionally does nothing.
        END_METHOD
        
        METHOD PUBLIC OnExit
            VAR_INPUT
                context : REF_TO StateContext;
            END_VAR;
            // Deprecated default implementation intentionally does nothing.
        END_METHOD

    END_CLASS
END_NAMESPACE