USING Simatic.Ax.Stateframework;
USING AxUnit.Assert;

NAMESPACE Simatic.Ax.StateFramework.Test
    {TestFixture}
    CLASS TestTransition3
        VAR
            state3 : State3Transition;
            state3StateLess : State3Transition;
            trans1 : Transition;
            trans2 : Transition;
            trans3 : Transition;
        END_VAR

        {TestSetup}
        METHOD PUBLIC MyTestSetup
            // Will be called before each test
            state3 := state3StateLess;
        END_METHOD

        {Test}
        METHOD PUBLIC  Set_no_trans_And_Expect_0
            Equal(expected := UINT#0, actual := state3.TransitionCount());            
        END_METHOD

        
        {Test}
        METHOD PUBLIC  Set_just_trans1_And_Expect_1
            state3.Transition1 := trans1;
            Equal(expected := UINT#1, actual := state3.TransitionCount());            
            Equal(expected := trans1, actual := state3.GetTransition(UINT#0));
        END_METHOD
        
        {Test}
        METHOD PUBLIC  Set_just_trans2_And_Expect_1
            state3.transition2 := trans1;
            Equal(expected := UINT#1, actual := state3.TransitionCount());    
            Equal(expected := trans1, actual := state3.GetTransition(UINT#0));        
        END_METHOD
        {Test}
        METHOD PUBLIC  Set_just_trans3_And_Expect_1
            state3.transition3 := trans1;
            Equal(expected := UINT#1, actual := state3.TransitionCount());            
            Equal(expected := trans1, actual := state3.GetTransition(UINT#0));
        END_METHOD
        
        {Test}
        METHOD PUBLIC  Set_2_of_3_transitions_And_Expect_2a
            state3.Transition1 := trans1;
            state3.transition2 := trans2;
            state3.transition3 := NULL;
            Equal(expected := UINT#2, actual := state3.TransitionCount()); 
            Equal(expected := trans1, actual := state3.GetTransition(UINT#0));
            Equal(expected := trans2, actual := state3.GetTransition(UINT#1));           
        END_METHOD

        METHOD PUBLIC  Set_2_of_3_transitions_And_Expect_2b
            state3.Transition1 := trans1;
            state3.transition2 := NULL;
            state3.transition3 := trans3;
            Equal(expected := UINT#2, actual := state3.TransitionCount());            
            Equal(expected := trans1, actual := state3.GetTransition(UINT#0));
            Equal(expected := trans3, actual := state3.GetTransition(UINT#1));           
        END_METHOD

        METHOD PUBLIC  Set_2_of_3_transitions_And_Expect_2c
            state3.Transition1 := NULL;
            state3.transition2 := trans2;
            state3.transition3 := trans3;
            Equal(expected := UINT#2, actual := state3.TransitionCount());            
            Equal(expected := trans2, actual := state3.GetTransition(UINT#0));
            Equal(expected := trans3, actual := state3.GetTransition(UINT#1));           

        END_METHOD



        {Test}
        METHOD PUBLIC StateID_Expect_5
            state3.StateID := 5;
            Equal(expected := 5, actual := state3.GetStateID());            
        END_METHOD

        {Test}
        METHOD PUBLIC Get_Transition_0_and_1_and_get_correct_Transition
            state3.Transition1 := trans1;
            state3.Transition2 := trans2;
            Equal(expected := trans1, actual := state3.GetTransition(UINT#0));                      
            Equal(expected := trans2, actual := state3.GetTransition(UINT#1));      
            Equal(expected := NULL, actual := state3.GetTransition(UINT#2));      
                            
        END_METHOD

        {Test}
        METHOD PUBLIC Get_Transition_0_and_get_correct_Transition
            state3.Transition1 := trans1;
            Equal(expected := trans1, actual := state3.GetTransition(UINT#0));                      
            Equal(expected := NULL, actual := state3.GetTransition(UINT#1));      
                            
        END_METHOD
        {Test}
        
        METHOD PUBLIC Get_Transition_0_and_get_correct_Transition2
            state3.transition2 := trans1;
            Equal(expected := trans1, actual := state3.GetTransition(UINT#0));                      
            Equal(expected := NULL, actual := state3.GetTransition(UINT#1));      
                            
        END_METHOD
    END_CLASS
END_NAMESPACE