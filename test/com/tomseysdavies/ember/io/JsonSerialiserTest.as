package com.tomseysdavies.ember.io
{
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.impl.EntityManager;
	import com.tomseysdavies.ember.io.serialise.json.JsonSerialiser;
	
	import mocks.MockComponentA;
	
	import org.flexunit.asserts.assertTrue;
	import org.swiftsuspenders.Injector;

	public class JsonSerialiserTest
	{	
		private var jsonSerialiser:JsonSerialiser;
		private var entityManager:EntityManager;
		private var injector:Injector;
		
		[Before]
		public function setUp():void
		{
			injector = new Injector();
			jsonSerialiser = new JsonSerialiser();
			entityManager = new EntityManager(injector);
		}
		
		[After]
		public function tearDown():void
		{
			jsonSerialiser = null;
		}

		[Test]
		public function test_serialisation():void
		{
			var e:IEntity = entityManager.create("test");
			var a:MockComponentA = new MockComponentA();
			a.n = 5;
			e.add(a);
			var data:String = jsonSerialiser.serialise(entityManager);
			
			entityManager.removeAll();
			
			jsonSerialiser.deserialise(data,entityManager);
			
			var e2:IEntity = entityManager.get("test");
			var a2:MockComponentA = e2.get(MockComponentA) as MockComponentA;
			
			assertTrue(a2.n == 5);
		}
		
		
	}
}