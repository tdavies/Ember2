package com.tomseysdavies.ember.io
{
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.impl.EntityManager;
	
	import mocks.MockComponentA;
	import mocks.MockComponentB;
	
	import org.flexunit.asserts.assertTrue;
	import org.swiftsuspenders.Injector;

	public class EntityEncoderTest
	{	
		private var encoder:EntityEncoder;
		private var system:EntityManager;
		private var injector:Injector;
		
		[Before]
		public function setUp():void
		{
			encoder = new EntityEncoder();
			injector = new Injector();
			system = new EntityManager(injector);
		}
		
		[After]
		public function tearDown():void
		{
			encoder = null;
		}
		
		
		[Test]
		public function test_encode_decode_entity():void
		{
			var entityA:IEntity = system.create();
			var compA:MockComponentA =  new MockComponentA();
			compA.n = 203;
			entityA.add(compA);
			entityA.add(new MockComponentB());
			
			var obj:Object = encoder.encode(entityA);
			
			var entityB:IEntity = encoder.decode(system,obj);
			
			assertTrue(entityB.has(MockComponentA) && entityB.has(MockComponentB) && (entityB.get(MockComponentA).n == 203) );
			
			
			
		}
		
		
	}
}