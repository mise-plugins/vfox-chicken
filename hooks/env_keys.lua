--- Returns environment variables to set for CHICKEN
--- Sets PATH to include the bin directory

function PLUGIN:EnvKeys(ctx)
    local file = require("file")
    local main_path = ctx.path

    return {
        {
            key = "PATH",
            value = file.join_path(main_path, "bin"),
        },
        {
            key = "CHICKEN_HOME",
            value = main_path,
        },
    }
end
