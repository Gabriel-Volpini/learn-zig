const std = @import("std");
const builtin = @import("builtin");
const dvui = @import("dvui");

pub const dvui_app: dvui.App = .{
    .config = .{
        .options = .{
            .transparent = false,
            .size = .{ .w = 800.0, .h = 600.0 },
            .title = "",
            .window_init_options = .{
                .theme = dvui.Theme.builtin.adwaita_dark,
            },
        },
    },
    .frameFn = appFrame,
    .initFn = appInit,
    .deinitFn = appDeinit,
};
pub const main = dvui.App.main;
pub const panic = dvui.App.panic;
pub const std_options: std.Options = .{
    .logFn = dvui.App.logFn,
};

var gpa_instance = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = gpa_instance.allocator();

pub fn appInit(win: *dvui.Window) !void {
    _ = win;
}

pub fn appDeinit() void {}

const items = [_][]const u8{
    "Chrome",
    "Firefox",
    "Neovim",
    "WezTerm",
    "Spotify",
    "Discord",
    "Obsidian",
};
// var buffer = std.mem.zeroes([2]u8);
var backing: []u8 = undefined;

pub fn appFrame() !dvui.App.Result {
    var hbox = dvui.box(@src(), .{ .dir = .horizontal }, .{});
    defer hbox.deinit();

    dvui.label(@src(), "Singleline", .{}, .{ .gravity_y = 0.5 });

    var te = dvui.textEntry(@src(), .{ .text = .{ .buffer_dynamic = .{ .allocator = gpa, .backing = &backing, .limit = 10 } } }, .{});
    te.deinit();

    const w: []u8 = &.{"Jorge"};
    te.text = w;

    // dvui.label(@src(), "(backign {any})", .{te.wd.}, .{ .gravity_y = 0.5 });

    if (dvui.button(@src(), "Large Doc", .{}, .{ .gravity_x = 1.0 })) {}

    return .ok;
}
