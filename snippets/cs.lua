local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Function to extract namespace from folder structure
local function get_namespace()
  local filepath = vim.fn.expand("%:p")

  -- Find the project root by looking for .csproj file
  local current_dir = vim.fn.expand("%:p:h")
  local project_root = nil
  local project_name = nil

  -- Walk up the directory tree to find the .csproj file
  while current_dir ~= "/" and current_dir ~= "" do
    local csproj_files = vim.fn.glob(current_dir .. "/*.csproj", false, true)
    if #csproj_files > 0 then
      project_root = current_dir
      -- Extract project name from .csproj filename
      local csproj_name = vim.fn.fnamemodify(csproj_files[1], ":t:r")
      project_name = csproj_name
      break
    end
    current_dir = vim.fn.fnamemodify(current_dir, ":h")
  end

  if not project_root or not project_name then
    return "YourNamespace"
  end

  -- Get the relative path from project root to current file
  local rel_path = filepath:sub(#project_root + 2) -- +2 to skip the trailing slash
  rel_path = vim.fn.fnamemodify(rel_path, ":h")

  -- Build namespace: ProjectName.SubFolder.SubFolder
  local namespace = project_name
  if rel_path ~= "." and rel_path ~= "" then
    -- Replace path separators with dots
    local subpath = rel_path:gsub("\\", "."):gsub("/", ".")
    namespace = namespace .. "." .. subpath
  end

  return namespace
end

-- Function to get class name from filename
local function get_classname()
  return vim.fn.expand("%:t:r")
end

return {
  -- Class snippet with automatic namespace
  s("nmspclass", {
    t("namespace "),
    f(get_namespace, {}),
    t({ "", "{", "    " }),
    t("public class "),
    f(get_classname, {}),
    t({ "", "    {", "        " }),
    i(0),
    t({ "", "    }", "}" }),
  }),

  -- Interface snippet with automatic namespace
  s("nmspinterface", {
    t("namespace "),
    f(get_namespace, {}),
    t({ "", "{", "    " }),
    t("public interface "),
    f(get_classname, {}),
    t({ "", "    {", "        " }),
    i(0),
    t({ "", "    }", "}" }),
  }),

  -- Record snippet with automatic namespace
  s("nmsprecord", {
    t("namespace "),
    f(get_namespace, {}),
    t({ "", "{", "    " }),
    t("public record "),
    f(get_classname, {}),
    t("("),
    i(0),
    t(");"),
    t({ "", "}" }),
  }),

  -- Enum snippet with automatic namespace
  s("nmspenum", {
    t("namespace "),
    f(get_namespace, {}),
    t({ "", "{", "    " }),
    t("public enum "),
    f(get_classname, {}),
    t({ "", "    {", "        " }),
    i(0),
    t({ "", "    }", "}" }),
  }),

  -- Abstract class snippet with automatic namespace
  s("nmspabstract", {
    t("namespace "),
    f(get_namespace, {}),
    t({ "", "{", "    " }),
    t("public abstract class "),
    f(get_classname, {}),
    t({ "", "    {", "        " }),
    i(0),
    t({ "", "    }", "}" }),
  }),

  -- Sealed class snippet with automatic namespace
  s("nmspsealed", {
    t("namespace "),
    f(get_namespace, {}),
    t({ "", "{", "    " }),
    t("public sealed class "),
    f(get_classname, {}),
    t({ "", "    {", "        " }),
    i(0),
    t({ "", "    }", "}" }),
  }),

  -- Static class snippet with automatic namespace
  s("nmspstatic", {
    t("namespace "),
    f(get_namespace, {}),
    t({ "", "{", "    " }),
    t("public static class "),
    f(get_classname, {}),
    t({ "", "    {", "        " }),
    i(0),
    t({ "", "    }", "}" }),
  }),
}
