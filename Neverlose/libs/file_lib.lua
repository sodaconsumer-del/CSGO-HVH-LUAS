local fs = require("neverlose/file_system")
local unzip = require("neverlose/unzip")

local function create(token)
    return {
        exists = function(path)
            return fs.exists(path)
        end,

        download = function(urls, dest)
            if type(urls) == "string" then
                urls = { urls }
            end
            for _, url in ipairs(urls) do
                local ok, data = pcall(http.get, url)
                if ok and data and #data > 0 then
                    files.write(dest, data)
                    return true
                end
            end
            return false
        end,

        extract = function(zip_path, dest_dir)
            local data = files.read(zip_path)
            if data then
                pcall(unzip.extract, data, dest_dir)
            end
        end,

        delete = function(path)
            fs.remove(path)
        end,
    }
end

return setmetatable({}, {
    __call = function(_, token)
        return create(token)
    end
})
