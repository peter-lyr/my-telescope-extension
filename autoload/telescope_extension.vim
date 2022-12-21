" 和my-nvim\start\my-telescope-extensions\lua\telescope\_extensions\my_telescope_extension.lua
" 一样不要改了

fu! telescope_extension#callback(value)
endfu

fu! telescope_extension#callbacknone(value)
endfu

fu! telescope_extension#sel(prompt_title, list, callback='telescope_extension#callbacknone')
endfu

lua << EOF
local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local status, vim_bookmarks = pcall(telescope.load_extension, "my_telescope_extension")
if not status then
  return
end
EOF

fu! telescope_extension#callback(value)
  call g:MyTelescopeExtensionsCallback(a:value)
endfu

fu! telescope_extension#sel(prompt_title, list, callback='telescope_extension#callbacknone')
  let g:my_telescope_extension_prompt_title = a:prompt_title
  let g:my_telescope_extension_input_list = a:list
  let g:MyTelescopeExtensionsCallback = funcref(a:callback)
  try
    call windowScale#i()
  catch
  endtry
  Telescope my_telescope_extension
endfu
