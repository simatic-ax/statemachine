NAMESPACE Simatic.Ax.StateFramework    
    CLASS BoolGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Value : REF_TO BOOL;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            Check := Value^;
        END_METHOD

        METHOD PUBLIC Reset
            ;
        END_METHOD

    END_CLASS
END_NAMESPACE