NAMESPACE Simatic.Ax.StateFramework

    CLASS CountGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Count : LINT;
        END_VAR
        VAR
            _actCount : LINT;
        END_VAR

        METHOD PUBLIC Config
            VAR_INPUT
                countValue : LINT;
            END_VAR
            Count := countValue;
        END_METHOD

        // ---------------- IMPLEMENT IGuard---------------------------
        METHOD PUBLIC Check : BOOL
            _actCount := _actCount + LINT#1;
            IF (_actCount >= Count) THEN                
                _actCount := LINT#0;
                Check := TRUE;
            ELSE
                Check := FALSE;
            END_IF;
            
        END_METHOD

        METHOD PUBLIC Reset
            ;
        END_METHOD
        // ---------------- END IMPLEMENT IGuard---------------------------

    END_CLASS




END_NAMESPACE