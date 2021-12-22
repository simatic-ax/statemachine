NAMESPACE Simatic.Ax.StateFramework    
    CLASS BoolGuard IMPLEMENTS IGuard
        VAR PUBLIC
            value : REF_TO BOOL;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            Check := value^;
        END_METHOD

        METHOD PUBLIC Reset
            ;
        END_METHOD

    END_CLASS
END_NAMESPACE