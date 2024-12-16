{
  loadRecursiveModules = let
  # 自递归函数
  self = dir: 
    let
      # 读取当前目录内容
      dirContents = builtins.readDir dir;
      dirStr = builtins.toString dir;
      # 找到所有 .nix 文件
      nixFiles = builtins.filter
        (fileName:
          let
            fileInfo = builtins.getAttr fileName dirContents;
          in fileInfo == "regular" && builtins.match ".*\\.nix$" fileName != null
        )
        (builtins.attrNames dirContents);


      # 找到所有子目录
      subDirs = builtins.filter
        (fileName:
          let
            fileInfo = builtins.getAttr fileName dirContents;
          in fileInfo == "directory"
        )
        (builtins.attrNames dirContents);

      # 递归处理子目录
      recursiveModules = builtins.concatLists (builtins.map
        (subDir: self (builtins.toPath "${dirStr}/${subDir}")) subDirs);

    in
      # 返回 .nix 文件与递归子模块
      (builtins.map (fileName: "${dir}/${fileName}") nixFiles) ++ recursiveModules;
in
  # 主入口
  self;
}
