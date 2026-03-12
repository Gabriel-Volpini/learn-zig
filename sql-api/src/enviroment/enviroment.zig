const std = @import("std");

const Tunnel = struct {
    host: []const u8,
    port: []const u8,
    user: []const u8,
    privateKeyPath: []const u8,
};

const Database = struct {
    host: []const u8,
    database: []const u8,
    user: []const u8,
    password: []const u8,
    port: u16,
    tunnel: Tunnel,
};

const Enviroment = struct {
    name: []const u8,
    database: Database,
};

pub fn init(allocator: std.mem.Allocator, envName: []u8) !void {
    const data = try std.fs.cwd().readFileAlloc(allocator, "./src/data.json", 4096);
    defer allocator.free(data);

    const parsed = try std.json.parseFromSlice([]Enviroment, allocator, data, .{});
    defer parsed.deinit();

    const currentEnv = try getCurrentEnv(parsed.value, envName);
    try startTunnel(allocator, currentEnv);
}

fn getCurrentEnv(envs: []Enviroment, currentEnvName: []u8) !Enviroment {
    for (envs) |e| {
        if (std.mem.eql(u8, e.name, currentEnvName)) return e;
    } else {
        return error.EnvNotFound;
    }
}

fn startTunnel(allocator: std.mem.Allocator, env: Enviroment) !void {
    var child = std.process.Child.init(&.{
        "ssh",
        "-i",
        env.database.tunnel.privateKeyPath,
        "-L",
        try std.fmt.allocPrint(allocator, "{d}:localhost:{d}", .{
            env.database.port,
            env.database.port,
        }),
        try std.fmt.allocPrint(allocator, "{s}@{s}", .{
            env.database.tunnel.user,
            env.database.tunnel.host,
        }),
    }, allocator);

    //NOTE:
    // child.stdout_behavior = .Inherit;
    // child.stderr_behavior = .Inherit;
    // child.stdin_behavior = .Inherit;

    try child.spawn();
    _ = try child.wait();
}
