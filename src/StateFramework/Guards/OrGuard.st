NAMESPACE Simatic.Ax.StateFramework    
    CLASS OrGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Lhs : IGuard;
            Rhs : IGuard;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            // OR tolerates one missing side and evaluates the remaining guard.
            IF (Lhs = NULL) AND (Rhs = NULL) THEN
                Check := FALSE;
            ELSIF (Lhs = NULL) THEN
                Check := Rhs.Check();
            ELSIF (Rhs = NULL) THEN
                Check := Lhs.Check();
            ELSE
                Check := Lhs.Check() OR Rhs.Check();
            END_IF;
        END_METHOD

        METHOD PUBLIC Reset
            // Reset is forwarded to all configured child guards.
            IF (Lhs <> NULL) THEN
                Lhs.Reset();
            END_IF;
            IF (Rhs <> NULL) THEN
                Rhs.Reset();
            END_IF;
        END_METHOD

    END_CLASS
END_NAMESPACE