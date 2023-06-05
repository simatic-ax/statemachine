NAMESPACE Simatic.Ax.StatePattern

    TYPE StateStatus : 
        STRUCT
            isRunning : Bool;
            activeTime : TIME;
            remainingTime : LTIME;
        END_STRUCT;
    END_TYPE

END_NAMESPACE

