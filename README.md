# CS2030 labs

- [How to test code locally](#how-to-test-code-locally)

## How to test code locally

Here's the general file structure:

```
.
├── 1.in
├── 1.expected
└── Main.java
```

Contents of `1.in`, the input file:

```
2
hello
there
```

Contents of `1.expected`, the expected output file:

```
hello-world
there-world
```

The goal of this task is clearly to append "-world" to every line of
the input, and then print it back.

An example `Main.java` will then be:

```java
import java.util.Scanner;

class Main {
    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        int lines = sc.nextInt();
        for (int i = 0; i < lines; i++) {
            System.out.printf("%s+world\n", sc.next());
            // the '+' here should be a '-', but this is to
            // purposefully create a wrong output to demo the
            // output test.
        }
        sc.close();
    }
}
```

To only **run** this locally, you can head over to a shell and do:

```sh
$ javac Main.java
$ java Main < 1.in
hello+world
there+world
```

Here's how I would **test** it.

First send the output to `1.received`:

```sh
$ javac Main.java
$ java Main < 1.in > 1.received
```

Then find the difference between the files:

```
$ diff 1.received 1.expected
1,2c1,2
< hello-world
< there-world
---
> hello+world
> there+world
```

`<` means that line appears in the left file in the `diff 1.received
1.expected` command, and `>` means that it appears in the right file.
