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

    _ = try getCurrentEnv(parsed.value, envName);
}

fn getCurrentEnv(envs: []Enviroment, currentEnvName: []u8) !Enviroment {
    for (envs) |e| {
        if (std.mem.eql(u8, e.name, currentEnvName)) return e;
    } else {
        return error.EnvNotFound;
    }
}
