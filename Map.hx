/*
* Copyright (C)2005-2013 Haxe Foundation
*
* Permission is hereby granted, free of charge, to any person obtaining a
* copy of this software and associated documentation files (the "Software"),
* to deal in the Software without restriction, including without limitation
* the rights to use, copy, modify, merge, publish, distribute, sublicense,
* and/or sell copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
* DEALINGS IN THE SOFTWARE.
*/

interface IMap<K, V>
{
	function exists(k:K):Bool;
	function get(k:K):Null<V>;
	function iterator():Iterator<V>;
	function keys():Iterator<K>;
	function remove(k:K):Bool;
	function set(k:K, v:V):Void;
	function toString():String;
}

abstract Map<K,V>(IMap<K,V>) {

	public function new() untyped this = {};

	public inline function set(key:K, value:V) return untyped this[key] = value;
	public inline function get(key:K) return untyped this[key];

	@:arrayAccess @:noCompletion public inline function _get(key:K) return untyped this[key];

	@:arrayAccess @:noCompletion public inline function _set(k:K, v:V):V {
		untyped this[k] = v;
		return v;
	}

	public inline function exists(key:K):Bool return untyped this[key] != null;

	public function remove(key:Dynamic):Bool {
		var _has:Bool = exists(key);
		untyped this[key] = null;
		return _has;
	}

	public inline function keys():Iterator<K> {
		return cast "TODO"; // TODO
	}

	public inline function iterator():Iterator<V> {
		return cast "TODO"; // TODO
	}

	public inline function toString():String {
		return ""+this;
	}
}