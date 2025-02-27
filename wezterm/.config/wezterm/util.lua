local module = {}

module.build_link_regex = function(protocols)
  local prefix = "(?:"
  for _, proto in pairs(protocols) do
    proto = proto .. "://"
    if proto == "git" then
      proto = proto .. "@"
    end
    prefix = prefix .. proto
  end
  local postfix = ")\\S+"
  return prefix .. postfix
end

return module
