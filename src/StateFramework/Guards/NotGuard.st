NAMESPACE Simatic.Ax.StateFramework    
    CLASS NotGuard IMPLEMENTS IGuard
        VAR PUBLIC
            lhs : IGuard;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            Check := NOT(lhs.Check());
        END_METHOD

        METHOD PUBLIC Reset
            lhs.Reset();
        END_METHOD

    END_CLASS
END_NAMESPACE