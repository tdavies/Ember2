package mocks
{
	import com.tomseysdavies.ember.entitySystem.api.ISystem;

	public class MockSystem implements ISystem
	{
		public var wasRegistered:Boolean;
		public var wasRemoved:Boolean;

		public function initialize():void
		{
			wasRegistered = true;
		}

		public function destroy():void
		{
			wasRemoved = true;
		}
	}
}
