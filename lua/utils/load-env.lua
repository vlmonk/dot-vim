local function load_vim_env()
    -- Expand the path to the .vim.env file
    local env_file_path = vim.fn.expand('~/.vim.env')
    
    -- Check if the file exists
    if vim.fn.filereadable(env_file_path) == 1 then
        -- Read the file line by line
        for line in io.lines(env_file_path) do
            -- Skip empty lines and comments
            if line:match('^%s*[^#]') then
                -- Split the line into key and value
                local key, value = line:match('^%s*([^=]+)%s*=%s*(.+)%s*$')
                
                if key and value then
                    -- Remove quotes if present
                    value = value:gsub('^[\'"]', ''):gsub('[\'"]$', '')
                    
                    -- Set the environment variable
                    vim.env[key] = value
                end
            end
        end
        
        print('Environment variables loaded from ' .. env_file_path)
    else
        print('No .vim.env file found at ' .. env_file_path)
    end
end

load_vim_env()  
