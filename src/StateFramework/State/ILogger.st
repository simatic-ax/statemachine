NAMESPACE Simatic.Ax.StateFramework
    INTERFACE ILogger

        METHOD WriteLog
            VAR_INPUT
                message : String;
            END_VAR
        END_METHOD
    END_INTERFACE
END_NAMESPACE