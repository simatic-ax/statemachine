NAMESPACE Simatic.Ax.StateFramework
    INTERFACE ITransition 

        // Returns the guard that decides whether the transition may fire.
        METHOD GetGuard : IGuard
        END_METHOD

        // Returns the target state that becomes active after the transition.
        METHOD GetNextState : IState
        END_METHOD
    
    END_INTERFACE

    INTERFACE IMutableTransition

        // Configures guard and target state in one call.
        METHOD Config
            VAR_INPUT
                g : IGuard;
                ns : IState;
            END_VAR
        END_METHOD
    
    END_INTERFACE
END_NAMESPACE

