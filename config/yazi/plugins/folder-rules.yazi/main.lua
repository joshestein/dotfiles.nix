local function setup()
	ps.sub("cd", function()
		local cwd = cx.active.current.cwd

		if cwd:name() == "/home/josh" then
			-- TODO: this is not working!
			-- Don't show hidden folders in root
			ya.manager_emit("show_hidden", { show_hidden = false })
		else
			ya.manager_emit("show_hidden", { show_hidden = true })
		end

		if cwd:ends_with("Downloads") then
			ya.manager_emit("sort", { "modified", reverse = true, dir_first = false })
		else
			ya.manager_emit("sort", { "alphabetical", reverse = false, dir_first = true })
		end
	end)
end

return { setup = setup }
