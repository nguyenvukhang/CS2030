# Vim + Java + LSP

Here you can find a ready-made setup that provides (neo)vim with Java
LSP support. This means auto-completion and suggestions as you type in
vim.

To use this there are three key steps:

1. Start the container
2. Attach to the container
3. Stop the container

## Requirements

You need to have docker installed. That's it.

## Usage

For all these commands to work, you have to first be in **this**
directory. Same directory as the files `up`, `down`, and `attach`.

Start the container with `sh up`.

Once it's started, it runs in the background until you stop it
manually using `sh down`.

When it's running, you can attach to it using `sh attach`. This will
send you in to the container into the bash shell.

## Inside the container

Within the container, the most important folder is the `work` folder.
Any files that are saved **inside** of this folder will be saved to
your actual machine. (check out the `work` folder just next to this
README)

So a general workflow will be to

1. Clear the work folder of old files (from previous homework)
2. Start the container
3. Attach to the container
4. Do work inside of the `work` directory inside of the container.
5. Detach from the container (by exiting the shell with `exit`)
6. Stop the container
7. Collect your work from the `work` directory next to this README

## Inside of Vim

Start (neo)vim as usual with `vim` or `nvim`. Here are the key
commands provided by this project:

1. (no keys) autocomplete suggestions
2. `Ctrl+n` next suggestion
3. `Ctrl+p` previous suggestion
4. `Ctrl+l` select suggestion
5. `:Neoformat` format the java code to school-approved format
