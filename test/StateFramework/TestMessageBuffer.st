USING AxUnit.Assert;
USING Simatic.Ax.Stateframework;

NAMESPACE Simatic.Ax.StateFramework.TestMessageBuffer
	{TestFixture}
	CLASS StateLoggerTest
		VAR PRIVATE
			// Fresh logger instance per test.
			_logger : StateLogger;
		END_VAR

		{Test}
		METHOD PUBLIC WriteLog_Stores_Messages_In_Order
			// The logger should append messages sequentially in its ring buffer.
			_logger.WriteLog('Test1');
			_logger.WriteLog('Test2');

			Equal(expected := 'Test1', actual := _logger.MsgBuffer[0].message);
			Equal(expected := 'Test2', actual := _logger.MsgBuffer[1].message);
		END_METHOD

		{Test}
		METHOD PUBLIC WriteLog_Fills_Buffer_Up_To_Last_Slot
			// Writing exactly 100 entries must populate the complete public buffer.
			VAR_TEMP
				index : INT;
			END_VAR

			FOR index := 1 TO 100 DO
				_logger.WriteLog('Fill');
			END_FOR;

			Equal(expected := 'Fill', actual := _logger.MsgBuffer[0].message);
			Equal(expected := 'Fill', actual := _logger.MsgBuffer[99].message);
		END_METHOD
	END_CLASS
END_NAMESPACE