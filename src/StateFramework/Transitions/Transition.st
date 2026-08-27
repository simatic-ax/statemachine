NAMESPACE Simatic.Ax.StateFramework
    CLASS Transition IMPLEMENTS ITransition, IMutableTransition

        VAR PUBLIC 
            Guard : IGuard;
            NextState : IState;
        END_VAR

        METHOD PUBLIC GetGuard : IGuard
            GetGuard := Guard;
        END_METHOD

        METHOD PUBLIC GetNextState : IState
            GetNextState := NextState; 
        END_METHOD

        METHOD PUBLIC Config 
            VAR_INPUT
                g : IGuard;
                ns : IState;
            END_VAR
            // Config wires a guard and its target state in one call.
            Guard := g;
            NextState := ns;
        END_METHOD

    
    END_CLASS
END_NAMESPACE