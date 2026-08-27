USING System.Timer;

NAMESPACE Simatic.Ax.StateFramework

    CLASS TimeoutGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Timeout : TIME;
        END_VAR
        VAR
            _ton : OnDelay;
        END_VAR

        METHOD PUBLIC Config
            VAR_INPUT
                timeoutValue : TIME;
            END_VAR
            // Timeout defines the TON duration that must elapse before Check returns TRUE.
            Timeout := timeoutValue;
        END_METHOD


        METHOD PUBLIC Check : BOOL
            // The timer is driven continuously until the configured delay has elapsed.
            _ton(signal := TRUE, duration := Timeout);
            IF (_ton.output) THEN
                 Check := TRUE;
            ELSE
                Check := FALSE;
            END_IF;
        END_METHOD

        METHOD PUBLIC Reset
            // Reset drops the TON input so the timeout starts from zero on the next Check.
            _ton(signal:= FALSE);
        END_METHOD

    END_CLASS
END_NAMESPACE