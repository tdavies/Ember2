package com.tomseysdavies.utils
{
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	

	public final class VectorMap
	{
		static private const VECTOR_CLASS_NAME:String = getQualifiedClassName(Vector);
		private var _vector:*;
		private var _map:Dictionary;
		public var vectorClass:Class;
		
		public function VectorMap(type:Class){
			
			vectorClass = getDefinitionByName(VECTOR_CLASS_NAME+".<"+getQualifiedClassName(type)+">") as Class;
			_vector = new vectorClass();
			_map = new Dictionary();
		}

		public function add(item:Object):void{
			_map[item] = _vector.push(item) - 1;
		}
		
		public function remove(item:Object):void{
			var last:Object = _vector.pop();
			if(item != last){
				var pos:int = _map[item];
				_vector[pos] = last;
				delete _map[item];
				_map[last] = pos;
			}else{
				delete _map[item];
			}
		}
		
		public function get length():uint{
			return _vector.length;
		}
		
		public function removeAll():void{
			_vector.length  = 0;
			_map = new Dictionary();
		}
		
		public function hasItem(item:Object):Boolean{
			return _map[item] != null;
		}
	
		public function get vector():*{
			return _vector;
		}
	}
}