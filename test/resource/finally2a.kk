// Test finally
effect state {
  fun inc() : int
}

effect exc {
  fun raise( s : string ) : a
}

fun bar() {
  println("action: " + inc().show )
  raise("ouch")
  42
}

fun foo() : _ int
{
  handle(bar) (i : int = 42) {
    return x -> { 
      println("return, local: " + i.show )
      x
    }
    finally  -> {
      println("finally, local: " + i.show)
    }
    inc() -> resume(i,i+1)
  }
}

fun main() {
  handle(foo) {
    return x -> println( "result: " + (x:int).show )
    raise(msg) -> println("raised: " + msg)
    finally -> println("exc finalize")  
  }
}