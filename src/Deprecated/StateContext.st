USING System.Timer;

NAMESPACE Simatic.Ax.StatePattern
    CLASS PUBLIC StateContext
        VAR PUBLIC

        END_VAR
        VAR
            _count : INT;
            _state : IState;
            _ton : OnDelay;
            _first : BOOL;
            _status : StateStatus;
        END_VAR

        METHOD PUBLIC InitialState : BOOL
            VAR_INPUT
                newState : IState;
                timeout : TIME;
                reset : BOOL;
            END_VAR

            IF (newState <> NULL) THEN
                IF (NOT _first OR reset) THEN
                    THIS.setState(newState := newState, timeout := timeout);
                    _first := TRUE;
                END_IF;
                InitialState := TRUE;
            ELSE
                InitialState := FALSE;
            END_IF;
            
        END_METHOD

        METHOD PUBLIC FINAL SetState
            VAR_INPUT
                newState : IState;
                timeout : TIME;
            END_VAR
            
            // before change state, call the on Entry method
            IF (_state <> NULL) THEN
                _state.OnExit(context := REF(THIS));
            END_IF;

            IF (newState <> NULL) THEN
                _state := newState;
                _status.isRunning := TRUE;
                
                // call the OnEntry method once
                _state.onEntry(context := REF(THIS));
                
                // run the Timeout if configured
                IF (timeout > T#0ms) THEN
                    _ton.duration := timeout;
                    _ton.signal := TRUE;
                END_IF;
                _state.Execute(context := REF(THIS));
                
            END_IF;
        END_METHOD
    

        METHOD PUBLIC FINAL Execute
            IF (_state = NULL) THEN
                RETURN;
            END_IF;
            _count := _count + 1;
            _ton();

            IF (_ton.output) THEN
                _ton.signal := FALSE;
                _ton();
                _status.remainingTime := _ton.elapsedTime;
                _state.OnTimeout(context := REF(THIS));
            END_IF;

            _state.Execute(context := REF(THIS));
        END_METHOD


    END_CLASS
END_NAMESPACE