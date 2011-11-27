package com.tomseysdavies.ember.entitySystem.impl
{
	import com.tomseysdavies.ember.entitySystem.api.ISystem;
	import com.tomseysdavies.ember.entitySystem.api.ISystems;
	import com.tomseysdavies.ember.entitySystem.impl.Systems;
	
	import mocks.MockNode;
	import mocks.MockSystem;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.core.throws;
	import org.swiftsuspenders.Injector;

	
	public class SystemsTest
	{
		private var systems:ISystems;
		
		[Before]
		public function before():void
		{
			var injector:Injector = new Injector();
			systems = new Systems(injector);
		}
		
		[After]
		public function after():void
		{
			systems = null;
		}
		
		[Test]
		public function can_add_a_system():void
		{
			assertTrue(systems.add(MockSystem) is MockSystem);
		}
		
		[Test(expects="Error")]
		public function adding_an_inavlid_system__fails():void
		{	
			systems.add(MockNode);
		}
		
		[Test(expects="Error")]
		public function adding_a_system_twice_fails():void
		{
			systems.add(MockSystem);
			systems.add(MockSystem);
		}
		
		[Test]
		public function can_get_an_added_system():void
		{
			systems.add(MockSystem);
			var mock:ISystem = systems.get(MockSystem);
			assertTrue(mock is MockSystem);
		}
		
		[Test]
		public function can_remove_a_system():void
		{
			systems.add(MockSystem);
			systems.remove(MockSystem);
			assertFalse(systems.has(MockSystem));
		}
		
		[Test]
		public function when_a_system_is_added_onRegister_is_called():void
		{
			var mock:MockSystem = systems.add(MockSystem) as MockSystem;
			assertTrue(mock.wasRegistered);
		}
		
		[Test]
		public function when_a_system_is_removed_onRemove_is_called():void
		{
			var mock:MockSystem = systems.add(MockSystem) as MockSystem;
			systems.remove(MockSystem);
			assertTrue(mock.wasRemoved);
		}
		
	}
}

[]
