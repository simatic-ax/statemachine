USING AxUnit.ResultFunctions;
USING System.Strings;

NAMESPACE AxUnit.Assert
    FUNCTION PUBLIC Equal
        VAR_INPUT
            actual : String;
            expected: String;
            {CallerFilePath}
            file : WSTRING[1024];
            {CallerLineNumber}
            line : INT;
        END_VAR

        IF actual = expected THEN
            axunit_Succeed();
        ELSE
            axunit_Fail(Concat('Expected ', expected, ', but found ', actual), file, line);
        END_IF;

    END_FUNCTION
END_NAMESPACE