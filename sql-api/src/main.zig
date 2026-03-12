const std = @import("std");
const enviroment = @import("enviroment/enviroment.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    // var buf: [256]u8 = undefined;
    // var stdin_reader_wrapper = std.fs.File.stdin().reader(&buf);
    // const stdin = &stdin_reader_wrapper.interface;

    // const input = try stdin.takeDelimiter('\n');
    const input: []u8 = @constCast("Dev");
    try enviroment.init(allocator, input);

    std.process.exit(0);
}
