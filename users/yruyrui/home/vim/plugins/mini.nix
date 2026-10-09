{
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      modules.icons = {
        style = "glyph";
      };
      mockDevIcons = true;
    };
    mini-diff = {
      enable = true;
      settings = {
        view = {
          style = "sign";
          signs = {
            add = "▎";
            change = "▎";
            delete = "";
          };
        };
      };
    };
  };
}
