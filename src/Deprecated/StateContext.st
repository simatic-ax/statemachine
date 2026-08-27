USING System.Timer;

NAMESPACE Simatic.Ax.StatePattern
    // Legacy controller from the deprecated state pattern implementation.
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

            // The initial state is only applied once unless reset is requested explicitly.
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
            
            // Before switching states, the current state receives OnExit.
            IF (_state <> NULL) THEN
                _state.OnExit(context := REF(THIS));
            END_IF;

            IF (newState <> NULL) THEN
                _state := newState;
                _status.isRunning := TRUE;
                
                // The new state is entered once immediately after activation.
                _state.onEntry(context := REF(THIS));
                
                // A positive timeout arms the legacy TON instance.
                IF (timeout > T#0ms) THEN
                    _ton.duration := timeout;
                    _ton.signal := TRUE;
                END_IF;
                _state.Execute(context := REF(THIS));
                
            END_IF;
        END_METHOD
    

        METHOD PUBLIC FINAL Execute
            // No execution happens until an initial state has been configured.
            IF (_state = NULL) THEN
                RETURN;
            END_IF;
            _count := _count + 1;
            _ton();

            // Timeout handling is evaluated before the regular Execute call.
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