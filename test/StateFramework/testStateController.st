USING AxUnit.Assert;
USING Simatic.Ax.Stateframework;
USING AxUnit.Assert;

NAMESPACE Simatic.Ax.StateFramework.TestStateController
    {TestFixture}
    CLASS StateControllerTest
        VAR
            sc : StateController;
            scStateLess : StateController;
            is : InitialState;
            ns : NextState1;
            ls : LastState;
            isStateLess : InitialState := (StateName := 'Initial State');
            nsStateLess : NextState1 := (StateName := 'Next State');
            lsStateLess : LastState := (StateName := 'Last State');
            t1 : Transition;
            t2 : Transition;
            t3 : Transition;
            t1StateLess : Transition;
            t2StateLess : Transition;
            t3StateLess : Transition;
            g1 : BoolGuard;
            b : BOOL;
        END_VAR
        
        {TestSetup}
        METHOD PUBLIC MyTestSetup
            // Will be called before each test
            sc := scStateLess;
            is := isStateLess; 
            ns := nsStateLess; 
            ls := lsStateLess;
            t1 := t1StateLess;
            t2 := t2StateLess;
            t3 := t3StateLess;

            b := FALSE;
            g1.Value := REF(b);
            
            is.Transition1 := t1;
            t1.Guard := g1;
            t1.NextState := ns;

            ns.Transition1 := t2;
            t2.NextState := ls;
            t2.Guard := g1;
            sc.InitialState := is;

            // ls.Transition1 := t3;

        END_METHOD

        {Test}
        METHOD PUBLIC Test_Sc_Activate_State_1
            sc.Execute();
            Equal(expected := 'Initial State', actual := sc.GetActiveStateName());
            Equal(expected := 1, actual := is.OnEntryCount);
            Equal(expected := 0, actual := is.OnExitCount);
            Equal(expected := 1, actual := is.ActionCount);
            Equal(expected := 0, actual := ns.OnEntryCount1);
            Equal(expected := 0, actual := ns.OnExitCount1);
            Equal(expected := 0, actual := ns.ActionCount1);
            ; // AxUnit.Assert.Equal(y, x)
            // // Expect Action call
            sc.Execute();
            Equal(expected := 1, actual := is.OnEntryCount);
            Equal(expected := 0, actual := is.OnExitCount);
            Equal(expected := 2, actual := is.ActionCount);
            Equal(expected := 0, actual := ns.OnEntryCount1);
            Equal(expected := 0, actual := ns.OnExitCount1);
            Equal(expected := 0, actual := ns.ActionCount1);
            b := TRUE;

            // // Expect Action and Onexit call
            sc.Execute();
            Equal(expected := 1, actual := is.OnEntryCount);
            Equal(expected := 1, actual := is.OnExitCount);
            Equal(expected := 3, actual := is.ActionCount);
            Equal(expected := 1, actual := ns.OnEntryCount1);
            Equal(expected := 0, actual := ns.OnExitCount1);
            Equal(expected := 1, actual := ns.ActionCount1);
            ;
        END_METHOD
        
           
        METHOD SetupStatemachine3States        
            g1.Value := REF(b);
            
            // configure initial state
            is.Transition1 := t1;
            t1.NextState := ns;
            t1.Guard := g1;
            
            // configure next state
            ns.Transition1 := t2;
            t2.NextState := ls;
            t2.Guard := g1;

            // configure last state
            ls.Transition1 := t3;
            t3.NextState := NULL;
            t3.Guard := g1;
            
            sc.InitialState := is;
        END_METHOD    
        {Test}
        METHOD PUBLIC TestExecute_ExpectStatusRunning
            sc.Execute();
            Equal2(expected := StateControllerStatus#STATUS_IS_RUNNING, actual := sc.GetState());
        END_METHOD

        {Test}
        METHOD PUBLIC TestExecute_ChangeStateTransition_True
            b := TRUE;
            sc.Execute();
            Equal2(expected := StateControllerStatus#STATUS_IS_RUNNING, actual := sc.GetState());
        END_METHOD
   

        {Test}
        METHOD PUBLIC TestExecute_ExpectStatus_No_NextStateRunning
            b := TRUE;
            sc.Execute();  // finalize first state
            sc.Execute();  // finalize next state (switchover fails, because next state has no own next state)
            Equal2(expected := StateControllerStatus#STATUS_IS_RUNNING, actual := sc.GetState());
            sc.Execute();
            Equal2(expected := StateControllerStatus#STATUS_NO_TRANSITION, actual := sc.GetState());
        END_METHOD        

        {Test}
        METHOD PUBLIC Restart_starts_with_the_InitialState
            // 1. Cycle
            b := TRUE; // Transition to nextState = TRUE
            sc.Execute();  // finalize first state
            // 2. Cycle
            b := FALSE;
            sc.Restart();
            sc.Execute();  // finalize next state (switchover fails, because next state has no own next state)
            Equal(expected := StateControllerStatus#STATUS_IS_RUNNING, actual := sc.GetState());
            Equal(expected := 'Initial State', actual := sc.GetActiveStateName());
        END_METHOD                

        {Test}
        METHOD PUBLIC States_where_all_transitions_are_true_passed_in_two_cycles
            // 1. Cycle
            b := TRUE; // Transition to nextState = TRUE
            sc.Execute();  
            sc.Execute();  
            Equal(expected := StateControllerStatus#STATUS_IS_RUNNING, actual := sc.GetState());
            Equal(expected := 'Last State', actual := sc.GetActiveStateName());
            Equal(expected := TRUE, actual := ls.GetStatus() = StateStatus#Active);
        END_METHOD    

    END_CLASS

    CLASS InitialState EXTENDS AbstractState
        VAR PUBLIC
            OnEntryCount : INT;
            OnExitCount : INT;
            ActionCount : INT;
            ActionBeforeOnEntry : BOOL;
        END_VAR
        VAR PROTECTED
            
        END_VAR
        
        METHOD PUBLIC MyMethod
            ;
        END_METHOD
    
        METHOD PUBLIC OVERRIDE OnEntry
            ActionBeforeOnEntry := (OnEntryCount = 0) AND (ActionCount > 0);
            OnEntryCount := OnEntryCount + 1;
        END_METHOD

        METHOD PUBLIC OVERRIDE OnExit
            OnExitCount := OnExitCount + 1;
        END_METHOD

        METHOD PUBLIC OVERRIDE Action
            ActionCount := ActionCount + 1;
        END_METHOD
    END_CLASS

    CLASS NextState1 EXTENDS AbstractState
        VAR PUBLIC
            OnEntryCount1 : INT;
            OnExitCount1 : INT;
            ActionCount1 : INT;
        END_VAR
        VAR PROTECTED
            
        END_VAR
        
        METHOD PUBLIC MyMethod
            ;
        END_METHOD
    
        METHOD PUBLIC OVERRIDE OnEntry
            OnEntryCount1 := OnEntryCount1 + 1;
            
        END_METHOD

        METHOD PUBLIC OVERRIDE OnExit
            OnExitCount1 := OnExitCount1 + 1;
        END_METHOD

        METHOD PUBLIC OVERRIDE Action
            ActionCount1 := ActionCount1 + 1;
        END_METHOD
    END_CLASS

    CLASS LastState EXTENDS AbstractState
        VAR PUBLIC
            OnEntryCount99 : INT;
            OnExitCount99 : INT;
            ActionCount99 : INT;
        END_VAR
        VAR PROTECTED
            
        END_VAR
        
        METHOD PUBLIC MyMethod
            ;
        END_METHOD
    
        METHOD PUBLIC OVERRIDE OnEntry
            OnEntryCount99 := OnEntryCount99 + 1;
            
        END_METHOD

        METHOD PUBLIC OVERRIDE OnExit
            OnExitCount99 := OnExitCount99 + 1;
        END_METHOD

        METHOD PUBLIC OVERRIDE Action
            ActionCount99 := ActionCount99 + 1;
        END_METHOD
    END_CLASS

END_NAMESPACE