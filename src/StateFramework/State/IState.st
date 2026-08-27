NAMESPACE Simatic.Ax.StateFramework
    INTERFACE IState

        // Called once when the controller activates the state.
        METHOD OnEntry
        END_METHOD

        // Called once before the controller leaves the state.
        METHOD OnExit
        END_METHOD

        // Called in each execution cycle while the state remains active.
        METHOD Action
        END_METHOD

        // Returns the transition at the requested zero-based position.
        METHOD GetTransition : ITransition
            VAR_INPUT 
                pos : UINT;
            END_VAR
        END_METHOD
        
        // Returns how many outgoing transitions are currently configured.
        METHOD TransitionCount : UINT
        END_METHOD    

        // Returns the numeric identifier of the state.
        METHOD GetStateID : INT
        END_METHOD

        // Returns the display name of the state.
        METHOD GetStateName : STRING
        END_METHOD

        // Returns the current runtime status of the state.
        METHOD GetStatus : StateStatus
        END_METHOD

    END_INTERFACE
END_NAMESPACE


