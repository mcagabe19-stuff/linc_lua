package llua;

#if !cpp
#error 'LuaJIT supports only C++ target platforms.'
#end
import hxlua.Types;

@:buildXml('<include name="${haxelib:linc_luajit}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
extern class Lua {
	public static inline var LUA_MULTRET:Int = (-1);
	public static inline var LUA_REGISTRYINDEX:Int = (-10000);
	public static inline var LUA_ENVIRONINDEX:Int = (-10001);
	public static inline var LUA_GLOBALSINDEX:Int = (-10002);
	public static inline var LUA_OK:Int = 0;
	public static inline var LUA_YIELD:Int = 1;
	public static inline var LUA_ERRRUN:Int = 2;
	public static inline var LUA_ERRSYNTAX:Int = 3;
	public static inline var LUA_ERRMEM:Int = 4;
	public static inline var LUA_ERRERR:Int = 5;
	public static inline var LUA_TNONE:Int = (-1);
	public static inline var LUA_TNIL:Int = 0;
	public static inline var LUA_TBOOLEAN:Int = 1;
	public static inline var LUA_TLIGHTUSERDATA:Int = 2;
	public static inline var LUA_TNUMBER:Int = 3;
	public static inline var LUA_TSTRING:Int = 4;
	public static inline var LUA_TTABLE:Int = 5;
	public static inline var LUA_TFUNCTION:Int = 6;
	public static inline var LUA_TUSERDATA:Int = 7;
	public static inline var LUA_TTHREAD:Int = 8;
	public static inline var LUA_MINSTACK:Int = 20;

	@:native('lua_pushnil')
	static function pushnil(L:cpp.RawPointer<Lua_State>):Void;

	@:native('lua_pushnumber')
	static function pushnumber(L:cpp.RawPointer<Lua_State>, n:Lua_Number):Void;

	@:native('lua_pushinteger')
	static function pushinteger(L:cpp.RawPointer<Lua_State>, n:Lua_Integer):Void;

	@:native('lua_pushlstring')
	static function pushlstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar, len:cpp.SizeT):Void;

	@:native('lua_pushstring')
	static function pushstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):Void;

	@:native('lua_pushvfstring')
	static function pushvfstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar, argp:cpp.VarList):Void;

	@:native('lua_pushfstring')
	static function pushfstring(L:cpp.RawPointer<Lua_State>, fmt:cpp.ConstCharStar, args:cpp.Rest<cpp.VarArg>):cpp.ConstCharStar;

	@:native('lua_pushcclosure')
	static function pushcclosure(L:cpp.RawPointer<Lua_State>, fn:Lua_CFunction, n:Int):Void;

	@:native('lua_pushboolean')
	static function pushboolean(L:cpp.RawPointer<Lua_State>, b:Int):Void;

	@:native('lua_pushlightuserdata')
	static function pushlightuserdata(L:cpp.RawPointer<Lua_State>, p:cpp.RawPointer<cpp.Void>):Void;

	@:native('lua_pushthread')
	static function pushthread(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_pop')
	static function pop(L:cpp.RawPointer<Lua_State>, n:Int):Void;

	@:native('lua_type')
	static function type(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_typename')
	static function typename(L:cpp.RawPointer<Lua_State>, tp:Int):cpp.ConstCharStar;

	@:native('lua_setglobal')
	static function setglobal(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):Int;

	@:native('lua_getglobal')
	static function getglobal(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):Int;

	@:native('lua_tostring')
	static function tostring(L:cpp.RawPointer<Lua_State>, i:Int):cpp.ConstCharStar;

	@:native('lua_close')
	static function close(L:cpp.RawPointer<Lua_State>):Void;

	@:native('lua_gettop')
	static function gettop(L:cpp.RawPointer<Lua_State>):Int;

	@:noCompletion
	@:native('lua_isboolean')
	static function _isboolean(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	static inline function isboolean(L:cpp.RawPointer<Lua_State>, idx:Int):Bool {
		return _isboolean(L, idx) != 0;
	}

	@:noCompletion
	@:native('lua_isstring')
	static function _isstring(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	static inline function isstring(L:cpp.RawPointer<Lua_State>, idx:Int):Bool {
		return _isstring(L, idx) != 0;
	}

	@:native('lua_toboolean')
	static function toboolean(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:noCompletion
	@:native('lua_isnumber')
	static function _isnumber(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	static inline function isnumber(L:cpp.RawPointer<Lua_State>, idx:Int):Bool {
		return _isnumber(L, idx) != 0;
	}

	@:native('lua_tonumber')
	static function tonumber(L:cpp.RawPointer<Lua_State>, idx:Int):Lua_Number;

	@:noCompletion
	@:native('lua_isfunction')
	static function _isfunction(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	static inline function isfunction(L:cpp.RawPointer<Lua_State>, idx:Int):Bool {
		return _isfunction(L, idx) != 0;
	}

	@:native('lua_pcall')
	static function pcall(L:cpp.RawPointer<Lua_State>, nargs:Int, nresults:Int, errfunc:Int):Int;

	@:native('lua_tointeger')
	static function tointeger(L:cpp.RawPointer<Lua_State>, idx:Int):Lua_Integer;

	@:native('lua_next')
	static function next(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_createtable')
	static function createtable(L:cpp.RawPointer<Lua_State>, narr:Int, nrec:Int):Void;

	@:native('lua_settable')
	static function settable(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_rawgeti')
	static function rawgeti(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Int;

	static inline function init_callbacks(L:cpp.RawPointer<Lua_State>):Void {
		hxlua.Lua.register(L, "print", cpp.Function.fromStaticFunction(print));
	}

	static inline function print(L:cpp.RawPointer<Lua_State>):Int {
		final nargs:Int = hxlua.Lua.gettop(L);

		for (i in 0...nargs)
			Sys.println(cast(hxlua.Lua.tostring(L, i + 1), String));

		hxlua.Lua.pop(L, nargs);
		return 0;
	}

	static inline function set_callbacks_function(f:cpp.Callable<State->String->Int>):Void {
		@:privateAccess
		Lua_helper.callbacks_function = f;
	}
}

class Lua_helper {
	public static var sendErrorsToLua:Bool = true;
	public static var callbacks:Map<String, Dynamic> = new Map();

	@:noCompletion
	private static var callbacks_function:cpp.Callable<State->String->Int> = null;

	public static function add_callback(L:cpp.RawPointer<Lua_State>, fname:String, f:Dynamic):Bool {
		callbacks.set(fname, f);
		hxlua.Lua.pushstring(L, fname);
		hxlua.Lua.pushcclosure(L, cpp.Callable.fromStaticFunction(callback_handler), 1);
		hxlua.Lua.setglobal(L, fname);
		return true;
	}

	public function remove_callback(L:cpp.RawPointer<Lua_State>, key:String) {
		if (L == null)
			return;

		callbacks.remove(key);

		hxlua.Lua.pushnil(L);
		hxlua.Lua.setglobal(L, key);
	}

	private static function callback_handler(L:cpp.RawPointer<Lua_State>):Int {
		if (callbacks_function != null)
			return callbacks_function(L, hxlua.Lua.tostring(L, hxlua.Lua.upvalueindex(1)));

		try {
			final nargs:Int = hxlua.Lua.gettop(L);

			var args:Array<Dynamic> = [];
			for (i in 0...nargs)
				args[i] = Convert.fromLua(L, i + 1);

			hxlua.Lua.pop(L, nargs);

			final name:String = hxlua.Lua.tostring(L, hxlua.Lua.upvalueindex(1));

			if (callbacks.exists(name)) {
				var ret:Dynamic = Reflect.callMethod(null, callbacks.get(name), args);

				if (ret != null) {
					Convert.toLua(L, ret);
					return 1;
				}
			}
		} catch (e:Dynamic) {
			if (sendErrorsToLua) {
				LuaL.error(L, 'CALLBACK ERROR! ${e.message != null ? e.message : e}');
				return 0;
			}
			trace(e);
			throw(e);
		}

		return 0;
	}
}
