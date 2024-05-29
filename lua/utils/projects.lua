local M = {}

M.isFrancium = vim.fn.getcwd():find("Code/leadfeeder/francium")
M.isLeadfeeder = vim.fn.getcwd():find("Code/leadfeeder")
M.isDealfront = vim.fn.getcwd():find("Code/dft-main")

return M
