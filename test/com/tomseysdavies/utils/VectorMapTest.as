package com.tomseysdavies.utils
{
	import flash.display.Sprite;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.object.isFalse;

	public class VectorMapTest
	{		
		private var vectorMap:VectorMap;
		
		[Before]
		public function setUp():void
		{
			vectorMap = new VectorMap(Sprite);
		}
		
		[After]
		public function tearDown():void
		{
			vectorMap = null;
		}
		
	
		
		[Test]
		public function can_add_item():void{
			var a:Sprite = new Sprite();
			vectorMap.add(a);
			assertThat(vectorMap.vector, hasItem(a));
		}
		
		
		[Test]
		public function can_remove_last_item():void{
			var a:Sprite = new Sprite();
			vectorMap.add(a);
			vectorMap.remove(a);
			assertTrue(vectorMap.length == 0);
		}
		
		[Test]
		public function can_remove_first_item():void{
			var a:Sprite = new Sprite();
			var b:Sprite = new Sprite();
			vectorMap.add(a);
			vectorMap.add(b);
			vectorMap.remove(a);			
			assertTrue(vectorMap.length == 1);
		}
		
		[Test]
		public function can_remove_mutltiple_items():void{
			var a:Sprite = new Sprite();
			var b:Sprite = new Sprite();
			var c:Sprite = new Sprite();
			vectorMap.add(a);
			vectorMap.add(b);
			vectorMap.add(c);
			vectorMap.remove(b);
			vectorMap.remove(a);
			vectorMap.remove(c);			
			assertTrue(vectorMap.length == 0);
		}
		
		[Test]
		public function can_cast_vector():void{
			vectorMap.add(new Sprite());			
			var spriteVector:Vector.<Sprite> = vectorMap.vector as Vector.<Sprite>;
			assertNotNull(spriteVector);
		}
		
		
		
	}
}