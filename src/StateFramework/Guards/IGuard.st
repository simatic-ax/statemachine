NAMESPACE Simatic.Ax.StateFramework
    INTERFACE IGuard 

        // Evaluates the guard condition for the current cycle.
        METHOD Check : BOOL
        END_METHOD

        // Resets any internal state kept by the guard.
        METHOD Reset
        END_METHOD
        
    END_INTERFACE
END_NAMESPACE

