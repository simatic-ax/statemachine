USING System.Timer;
USING Simatic.Ax.StateFramework;
USING AxUnit.Assert;

NAMESPACE Simatic.Ax.StateFramework.Test

    {TestFixture}

    CLASS TimeoutGuardTest
        VAR
            _guard : TimeoutGuard;
        END_VAR
        
        {Test}    
        METHOD PUBLIC Call_Check_andexpect_False
            Equal(actual := _guard.Check(), expected := FALSE);
        END_METHOD

        {Test}    
        METHOD PUBLIC Call_Check_andexpect_True
            AxUnit.Mocking.Mock('System.Timer.OnDelay', 'Simatic.Ax.StateFramework.Test.OnDelayMock_true');  
            Equal(actual := _guard.Check(), expected := TRUE);        
        END_METHOD

        {Test}
        METHOD PUBLIC CheckReset
            AxUnit.Mocking.Mock('System.Timer.OnDelay', 'Simatic.Ax.StateFramework.Test.OnDelayMock_true');  
            Equal(actual := _guard.Check(), expected := TRUE); 
            AxUnit.Mocking.Mock('System.Timer.OnDelay', 'Simatic.Ax.StateFramework.Test.OnDelayMock_false');  
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := FALSE);
        END_METHOD

        {Test}
        METHOD PUBLIC TestConfig
            _guard.Config(T#5s);
            Equal(actual := _guard.Timeout, expected := T#5s);
        END_METHOD

    END_CLASS   

    FUNCTION_BLOCK OnDelayMock_true
        VAR
            iecTimer : ARRAY[0..27] of BYTE;
        END_VAR
        VAR_INPUT
            duration : LTIME;
            signal : BOOL;
        END_VAR
        VAR_OUTPUT
            output : BOOL;
            elapsedTime : LTIME;
        END_VAR
        output := TRUE;
    END_FUNCTION_BLOCK

    FUNCTION_BLOCK OnDelayMock_false
        VAR
            iecTimer : ARRAY[0..27] of BYTE;
        END_VAR
        VAR_INPUT
            duration : LTIME;
            signal : BOOL;
        END_VAR
        VAR_OUTPUT
            output : BOOL;
            elapsedTime : LTIME;
        END_VAR
        output := FALSE;
    END_FUNCTION_BLOCK


END_NAMESPACE

    NAMESPACE AxUnit.Assert
        FUNCTION Equal
            VAR_INPUT
                    expected:  TIME;
                    actual:  TIME;
            END_VAR
            AxUnit.Assert.Equal(expected := TRUE, actual := expected = actual);
            ;
        END_FUNCTION 
    END_NAMESPACE
