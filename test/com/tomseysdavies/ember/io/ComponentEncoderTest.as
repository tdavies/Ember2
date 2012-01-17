package com.tomseysdavies.ember.io
{
	import flexunit.framework.Assert;
	
	import mocks.MockComponentA;
	
	import org.flexunit.asserts.assertTrue;
	
	public class ComponentEncoderTest
	{	
		
		private var encoder:ComponentEncoder;
		private var configFactory:ComponentConfigFactory;
		
		[Before]
		public function setUp():void
		{
			configFactory = new ComponentConfigFactory();
			encoder = new ComponentEncoder(configFactory);
		}
		
		[After]
		public function tearDown():void
		{
			configFactory = null;
			encoder = null;
		}
		

		
		[Test]
		public function test_encode_decode_component():void
		{
			var componentA:MockComponentA = new MockComponentA();
			componentA.n = 102;
			var obj:Object =  encoder.encode(componentA);
			var componentACopy:MockComponentA = encoder.decode(obj) as MockComponentA;
			assertTrue(componentACopy.n == 102);
		}
		

	}
}