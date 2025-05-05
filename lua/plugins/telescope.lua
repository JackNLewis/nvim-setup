return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find Live Grep" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
  },
}
