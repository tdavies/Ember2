package com.tomseysdavies.ember.entitySystem.impl
{
	import flexunit.framework.Assert;
	
	import mocks.MockComponentA;
	
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertStrictlyEquals;
	import org.flexunit.asserts.assertTrue;
	import org.osflash.signals.Signal;
	
	public class EntityTest
	{		
		
		private var entity:Entity;
		private const NAME:String = "testName";
		private const _entityComponentAdded:Signal = new Signal(Entity, Class);
		private const _entityComponentRemoved:Signal = new Signal(Entity, Class);
		
		[Before]
		public function setUp():void
		{
			entity = new Entity(NAME,_entityComponentAdded,_entityComponentRemoved);
		}
		
		[After]
		public function tearDown():void
		{
			entity = null;
		}
		
		
		[Test]
		public function can_add_component_to_entity():void
		{
			entity.add(new MockComponentA());
			assertTrue(entity.has(MockComponentA));
		}
		
		[Test]
		public function can_reference_component_instance_by_class():void
		{
			var component:MockComponentA = new MockComponentA();			
			entity.add(component);
			assertStrictlyEquals(entity.get(MockComponentA),component);
		}
		
		[Test]
		public function can_remove_component_from_entity():void
		{
			entity.add(new MockComponentA());
			entity.remove(MockComponentA);
			assertFalse(entity.has(MockComponentA));
		}
	}
}