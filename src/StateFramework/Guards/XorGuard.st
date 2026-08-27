NAMESPACE Simatic.Ax.StateFramework    
    CLASS XorGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Lhs : IGuard;
            Rhs : IGuard;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            IF (Lhs = NULL) AND (Rhs = NULL) THEN
                Check := FALSE;
            ELSIF (Lhs = NULL) THEN
                Check := Rhs.Check();
            ELSIF (Rhs = NULL) THEN
                Check := Lhs.Check();
            ELSE
                Check := Lhs.Check() XOR Rhs.Check();
            END_IF;
        END_METHOD

        METHOD PUBLIC Reset
            IF (Lhs <> NULL) THEN
                Lhs.Reset();
            END_IF;
            IF (Rhs <> NULL) THEN
                Rhs.Reset();
            END_IF;
        END_METHOD

    END_CLASS
END_NAMESPACE