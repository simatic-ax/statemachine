NAMESPACE Simatic.Ax.StateFramework
    // Named values for states
    
    CLASS StateController IMPLEMENTS IStateController

        VAR PUBLIC
            InitialState: IState;
            Logger : ILogger;
        END_VAR

        VAR PRIVATE
            _status : StateControllerStatus;
            _statesActive : INT;
        END_VAR

        VAR PROTECTED
            _activeStateId : INT;
            _activeStateName : String;
            _lastState : INT;
            _activeState : IState;
        END_VAR
        
        METHOD PUBLIC FINAL Execute
            VAR_TEMP
                states : INT;
            END_VAR

            IF (InitialState = NULL) THEN
                _status := StateControllerStatus#STATUS_NO_INITIALSTATE;
                RETURN;
            END_IF;
            
            // dont execute if any error is active --> NULL Pointer execption
            IF (THIS.HasError()) THEN
                RETURN;
            END_IF;
            
            IF (_activeState = NULL) THEN
                THIS.ActivateState(InitialState);
            END_IF;
            
            _statesActive := 1;
            THIS.ExecuteState(_activeState);

        END_METHOD

        /// Terminates state
        /// Call the Action method of the actual state
        /// Call the OnExit method of the actual state
        /// Reset all guards
        METHOD PRIVATE TerminateState
            VAR_INPUT
                state : IState;
            END_VAR
            state.Action();
            state.OnExit();
            _lastState := state.GetStateId();

            // Reset all other guards
            THIS.ResetGuards();

        END_METHOD

        /// Terminates the actual state and start with the InitialState
        METHOD PUBLIC Restart : IState
            IF (_activeState <> NULL) THEN
                THIS.TerminateState(_activeState);
            END_IF;
            IF (InitialState <> NULL) THEN
                THIS.ActivateState(InitialState);
                Restart := InitialState;
            ELSE
                Restart := NULL;
            END_IF;
            
        END_METHOD

        METHOD PRIVATE ActivateState
            VAR_INPUT
                state : IState;
            END_VAR
            _activeState := state;
            _status := StateControllerStatus#STATUS_STATE_CHANGED;
            _activeStateId := _activeState.GetStateId();
            _activeStateName := _activeState.GetStateName();           
            // Call OnEntry method of new state
            _activeState.OnEntry();     
        END_METHOD

        METHOD PRIVATE ExecuteState
            VAR_INPUT
                activeState : IState;
            END_VAR
            VAR_TEMP
                transition : UINT;
                actualTransition : ITransition;
            END_VAR

            IF (_activeState.TransitionCount() > UINT#0) THEN 
                FOR transition := UINT#0 TO _activeState.TransitionCount() - UINT#1 DO
                    actualTransition := _activeState.GetTransition(pos := transition);
                    
                    IF (actualTransition = NULL) THEN
                        CONTINUE;
                    END_IF;
                    
                    IF (actualTransition.GetGuard().Check()) THEN

                        // switchover state
                        THIS.TerminateState(_activeState);
                        // TODO write new state into list
                        _activeState := actualTransition.GetNextState();

                        // If no next state available, RETURN and set status to Error-Code --> state machine will not be executed
                        IF (_activeState = NULL) THEN
                            _status := StateControllerStatus#STATUS_NO_NEXTSTATE;
                            RETURN;
                        END_IF;

                        // Activate State
                        THIS.ActivateState(_activeState);

                        // store active state (simple state logging)
                        EXIT; 
                    END_IF;                
                END_FOR;
            END_IF;
            _status := StateControllerStatus#STATUS_IS_RUNNING;
            // TODO action will be called after OnExit --> has to be changed
            _activeState.Action();
        END_METHOD

        // Reset all Guards when one of the guards has Chack() = TRUE
        METHOD PRIVATE ResetGuards
            VAR_TEMP
                actualTransition : UINT;
            END_VAR
            IF (_activeState.TransitionCount() > UINT#0) THEN 
                FOR actualTransition := UINT#0 TO _activeState.TransitionCount() - UINT#1 DO
                    _activeState.GetTransition(pos := actualTransition).GetGuard().Reset();
                END_FOR;
            END_IF;
        END_METHOD

        METHOD PRIVATE HasError : BOOL
            IF (_status > WORD#16#8000) THEN
                HasError := TRUE;
            ELSE
                HasError := FALSE;
            END_IF;
        END_METHOD

        METHOD PUBLIC GetState : StateControllerStatus
            GetState := _status;
            ;
        END_METHOD

        METHOD PUBLIC GetActiveStateName : String
            GetActiveStateName := _activeStateName;
        END_METHOD

        METHOD PRIVATE LogMessage
            VAR_INPUT
                msg : String;
            END_VAR
            IF (Logger <> NULL) THEN
                Logger.WriteLog(msg);
            END_IF;
        END_METHOD

    END_CLASS
END_NAMESPACE