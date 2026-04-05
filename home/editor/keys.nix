{
  programs.nixvim.keymaps = [
    {
      action = "<Esc>";
      key = "jj";
      mode = "i";
    }
    {
      action = "<C-\\><C-n>";
      key = "<Esc><Esc>";
      mode = "t";
    }
    {
      action = "<cmd>echo 'Use h to move!!'<CR>";
      key = "<left>";
      mode = "n";
    }
    {
      action = "<cmd>echo 'Use j to move!!'<CR>";
      key = "<down>";
      mode = "n";
    }
    {
      action = "<cmd>echo 'Use k to move!!'<CR>";
      key = "<up>";
      mode = "n";
    }
    {
      action = "<cmd>echo 'Use l to move!!'<CR>";
      key = "<right>";
      mode = "n";
    }
    # Make windows naigation easier
    {
      action = "<C-w><C-h>";
      key = "<C-h>";
      mode = "n";
    }
    {
      action = "<C-w><C-j>";
      key = "<C-j>";
      mode = "n";
    }
    {
      action = "<C-w><C-k>";
      key = "<C-k>";
      mode = "n";
    }
    {
      action = "<C-w><C-l>";
      key = "<C-l>";
      mode = "n";
    }
    # Buffer bindings
    {
      action = ":bprev<CR>";
      key = "<S-h>";
      mode = "n";
    }
    {
      action = ":bnext<CR>";
      key = "<S-l>";
      mode = "n";
    }
    {
      action = ":bd<CR>";
      key = "<S-q>";
      mode = "n";
    }
    {
      action = ":LazyGit<CR>";
      key = "<leader>gg";
      mode = "n";
    }
  ];
}
