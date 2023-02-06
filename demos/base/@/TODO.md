# Things to cover

- [ ] how to derive `Simulator.java` from the `Main` class
  - [ ] compile when there is no Simulator.java yet to show the error
        message
- [ ] how to use ImList.java (if required)
- [ ] how to use Pair.java
  - [ ] show the toString() method
  - [ ] show the first() and second() method
  - and really, that's all the methods there are
  - often times, devs make classes just to group data together,
    because Java only lets you return 1 thing from a function.
  - so if you want to return multiple things from a function, you now
    know what to do.
- [ ] how to use PQ.java
  - [ ] compile when no generic is provided (supply a dummy
        comparator)
  - [ ] the compiler should show "Recompile with -Xlint:unchecked for details."
  - [ ] run through how to compile Java to show detailed lints.
  - [ ] insert the generic and re-implement the comparator properly
  - [ ] demo the lack of inner order of the queue (just add 1, 2, 3, 4
        in order and print the queue)
  - [ ] demo how to pop off the top
  - [ ] demo an exhaustive pop with a while loop
  - [ ] once the loop is up, change the comparator behaviour
- [ ] Abstract classes
  - Shape, Square, Circle, with getType() and paint()
  - [ ] show a good example of polymorphism
  - [ ] contrast it against a bad example
- [ ] Interfaces
  - [ ] try showing what happens if we replace "abstract class" with
        inteface immedidately
  - [ ] constructors will fail
  - [ ] remind that it can depend on each other
  - [ ] show an example of circular dependency (Java will compile
        this, but CS2030 codecrunch will catch you)
