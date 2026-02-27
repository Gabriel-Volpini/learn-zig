# Learn Zig

A personal repository for learning the Zig programming language.

## What is Zig?

Zig is a general-purpose programming language designed for robustness, optimality, and clarity. It aims to be a better C—offering modern features, better safety, and improved developer experience while maintaining direct access to low-level resources.

## Why a Low-Level Language?

Low-level languages like C and Zig give you direct control over system resources like memory, CPU registers, and hardware. This makes them ideal for:

- **Systems programming** - Operating systems, drivers, embedded systems
- **Performance-critical applications** - Games, compilers, databases
- **Resource efficiency** - Minimal runtime, small binary sizes

However, C has several pain points: manual memory management leads to bugs, lack of modern features slows development, and undefined behaviors can cause subtle issues.

## How Zig Differs from C

Zig was designed to fix C's shortcomings while keeping its core philosophy of "no hidden control flow, no hidden memory allocation":

| Feature           | C                      | Zig                                       |
| ----------------- | ---------------------- | ----------------------------------------- |
| Memory management | Manual (malloc/free)   | Manual but safer, with optional allocator |
| Error handling    | Error codes / errno    | Error unions and try/catch                |
| Generics          | Macros / void pointers | Compile-time functions (comptime)         |
| Null safety       | NULL pointers          | Optional types (?T)                       |
| Build system      | Makefile / CMake       | Built-in Zig build system                 |
| Cross-compilation | Complex setup          | Simple out-of-the-box support             |
| Debugging         | Manual debugging       | Integrated testing and debugging          |

Zig also removes the preprocessor, includes a modern standard library, and provides better safety guarantees without garbage collection.

## Learning Resources

- [Zig Official Documentation](https://ziglang.org/documentation/master/)
- [Zig Learn](https://ziglearn.org/)
- [Zig Wiki](https://github.com/ziglang/zig/wiki)
- [Awesome Zig](https://github.com/cartelope/awesome-zig)

## Project Structure

Each folder contains a different learning resource or project:

- [ziglings](./ziglings/) - A series of tiny broken programs to fix
- [](#) - Coming soon...

TODO:

- Zig invaders
- codecraft build your own shell-
- build your own X - zig CLI
- [Zig by Example](https://zigbyexample.org/)

## Contents

### Ziglings

A collection of small exercises that teach Zig syntax through practice. Each exercise is a tiny broken program that you need to fix to learn the fundamentals.

For more details, see the [Ziglings README](./ziglings/).

## License

MIT
