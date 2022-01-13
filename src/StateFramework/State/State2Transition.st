USING Simatic.Ax.Stateframework;

NAMESPACE Simatic.Ax.StateFramework

    CLASS State2Transition EXTENDS AbstractState

        VAR PUBLIC
            Transition2 : ITransition;
        END_VAR

        METHOD PUBLIC OVERRIDE OnEntry
            ;
        END_METHOD

        METHOD PUBLIC OVERRIDE OnExit
            ;
        END_METHOD

        METHOD PUBLIC OVERRIDE Action
            ;
        END_METHOD

        METHOD PUBLIC FINAL OVERRIDE GetTransition : ITransition
            VAR_INPUT 
                pos : UINT := UINT#0;
            END_VAR
            VAR_TEMP
                cnt : UINT;
            END_VAR;

            cnt := THIS.TransitionCount();
                       
            IF (pos >= cnt) THEN 
                GetTransition := NULL;
                RETURN;
            END_IF;

            // If just one Transition configured
            IF (cnt = UINT#1) THEN
                IF (transition1 <> NULL) THEN
                    GetTransition := transition1;
                ELSE
                    GetTransition := transition2;
                END_IF;
            ELSE
                CASE pos OF
                    UINT#0: GetTransition := transition1;
                    UINT#1: GetTransition := transition2;
                ELSE
                    GetTransition := NULL;
                END_CASE;                
            END_IF;
           
            
        END_METHOD

        METHOD PUBLIC FINAL OVERRIDE TransitionCount : UINT
            IF (transition1 = NULL AND transition2 = NULL) THEN
                TransitionCount := UINT#0;
            ELSIF (transition1 <> NULL AND transition2 <> NULL) THEN
                TransitionCount := UINT#2;                    
            ELSE
                TransitionCount := UINT#1;
            END_IF;
        END_METHOD
    END_CLASS 
    
    
END_NAMESPACE