NAMESPACE Simatic.Ax.StateFramework

    CLASS TrueGuard IMPLEMENTS IGuard
        METHOD PUBLIC Check : BOOL
            // This guard is always open.
            Check := TRUE;
        END_METHOD

        METHOD PUBLIC Reset
            // TrueGuard has no internal state to reset.
            ;
        END_METHOD
    
    END_CLASS
END_NAMESPACE