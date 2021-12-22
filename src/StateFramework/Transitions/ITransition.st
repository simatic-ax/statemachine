NAMESPACE Simatic.Ax.StateFramework
    INTERFACE ITransition 

        METHOD GetGuard : IGuard
        END_METHOD

        METHOD GetNextState : IState
        END_METHOD
    
    END_INTERFACE

    INTERFACE IMutableTransition

        METHOD Config
            VAR_INPUT
                g : IGuard;
                ns : IState;
            END_VAR
        END_METHOD
    
    END_INTERFACE
END_NAMESPACE

