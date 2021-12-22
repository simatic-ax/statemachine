NAMESPACE Simatic.Ax.StateFramework

    CLASS TrueGuard IMPLEMENTS IGuard
        METHOD PUBLIC Check : BOOL
            Check := TRUE;
        END_METHOD

        METHOD PUBLIC Reset
            ;
        END_METHOD
    
    END_CLASS
END_NAMESPACE