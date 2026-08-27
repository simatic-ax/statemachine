USING Simatic.Ax.StateFramework;
USING AxUnit.ResultFunctions;
USING System.Strings;

NAMESPACE AxUnit.Assert
    // Helper overload for readable assertions on StateControllerStatus values.
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
            // The custom message prints symbolic status names instead of raw WORD values.
            axunit_Fail(Concat('Expected ', ToString(expected), ', but found ', ToString(actual)), file, line);
        END_IF;

    END_FUNCTION

    FUNCTION INTERNAL ToString : STRING
        VAR_INPUT
            actual : StateControllerStatus;
        END_VAR
        // Converts controller status values into readable assertion output.
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