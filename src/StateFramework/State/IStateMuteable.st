NAMESPACE Simatic.Ax.StateFramework
    INTERFACE IStateMuteable
    
        // Allows the controller to update the runtime status of a state.
        METHOD SetStatus
            VAR_INPUT
                status : StateStatus;
            END_VAR
        END_METHOD

    END_INTERFACE
END_NAMESPACE


