USING Simatic.Ax.StateFramework;
USING AxUnit.ResultFunctions;
USING System.Strings;

NAMESPACE AxUnit.Assert
    FUNCTION PUBLIC Equal2
        VAR_INPUT
            expected : StateControllerStatus;
            actual : StateControllerStatus;
            {CallerFilePath}
            file : WSTRING[1024];
            {CallerLineNumber}
            line : INT;
        END_VAR

        IF actual = expected THEN
            axunit_Succeed();
        ELSE
            ;
            axunit_Fail(Concat('Expected ', ToString(expected), ', but found ', ToString(actual)), file, line);
        END_IF;

    END_FUNCTION

    FUNCTION INTERNAL ToString : STRING
        VAR_INPUT
            actual : StateControllerStatus;
        END_VAR
        IF (actual = StateControllerStatus#STATUS_NO_ERR) THEN
            ToString := 'STATUS_NO_ERR';
        ELSIF (actual = StateControllerStatus#STATUS_IS_RUNNING) THEN
            ToString := 'STATUS_IS_RUNNING';
        ELSIF (actual = StateControllerStatus#STATUS_STATE_CHANGED) THEN
            ToString := 'STATUS_STATE_CHANGED';
        ELSIF (actual = StateControllerStatus#STATUS_NO_INITIALSTATE) THEN
            ToString := 'STATUS_NO_INITIALSTATE';
        ELSIF (actual = StateControllerStatus#STATUS_NO_NEXTSTATE) THEN
            ToString := 'STATUS_NO_NEXTSTATE';
        END_IF;
        ;
    END_FUNCTION
END_NAMESPACE