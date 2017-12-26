# ディレクトリ関連
# Do not print the directory stack after pushd or popd.
#setopt pushd_silent
# Replace 'cd -' with 'cd +'
setopt pushd_minus
setopt auto_pushd
setopt auto_cd
# Ignore duplicates to add to pushd
setopt pushd_ignore_dups
# pushd no arg == pushd $HOME
setopt pushd_to_home

# correction settings
# correct_all で引数も訂正してくれるようになる
setopt correct
setopt correct_all
# .dotfile を修正候補にしない。git log とかで反応されてもうざいので。
export CORRECT_IGNORE_FILE='.*'
export CORRECT_IGNORE='_*'


# Prohibit overwrite by redirection(> & >>) (Use >! and >>! to bypass.)
# 間違ってファイルを上書きすると大変なので。
# この設定が原因でシェルスクリプトがエラーになる可能性あり
setopt no_clobber

# Deploy {a-c} -> a b c
# {} で1文字ずつ展開できるようになる
setopt brace_ccl

# Enable 8bit
# これをセットしないと日本語が文字化けする場合がある
setopt print_eight_bit

# sh_word_split
# 単語分割を bash 方式にする
# https://qiita.com/uasi/items/82b7708d5da213ba7c31
setopt sh_word_split

# Change
# ~$ echo 'hoge' \' 'fuga'
# to
# ~$ echo 'hoge '' fuga'
# シングルクオート中の文字列内で、'' を ' と認識する
setopt rc_quotes

# Case of multi redirection and pipe,
# use 'tee' and 'cat', if needed
# ~$ < file1  # cat
# ~$ < file1 < file2        # cat 2 files
# ~$ < file1 > file3        # copy file1 to file3
# ~$ < file1 > file3 | cat  # copy and put to stdout
# ~$ cat file1 > file3 > /dev/stdin  # tee
setopt multios

# Automatically delete slash complemented by supplemented by inserting a space.
# 補完でついた / を自動的に削除
setopt auto_remove_slash

# No Beep
setopt no_beep
setopt no_list_beep
setopt no_hist_beep

# Expand '=command' as path of command
# e.g.) '=ls' -> '/bin/ls'
# echo =command で which command と同等になる
setopt equals

# Do not use Ctrl-s/Ctrl-q as flow control
# TODO: flow control について調べる
#setopt no_flow_control

# Look for a sub-directory in $PATH when the slash is included in the command
# /usr/local/bin が PATH にあるとき、/usr/local/bin/X11/xinit が X11/xinit で認識可能
setopt path_dirs

# Show exit status if it's except zero.
setopt print_exit_value

# Show expaning and executing in what way
# うざったいから切るかもしれない
# TODO: 挙動を詳しく調べる
#setopt xtrace

# Confirm when executing 'rm *'
setopt rm_star_wait

# Let me know immediately when terminating job
# Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt notify

# Show process ID
# List jobs in the long format by default.
# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

# Resume when executing the same name command as suspended process name
# Treat single word simple commands without redirection as candidates for resumption of an existing job.
# サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
# TODO: background job について復習
setopt auto_resume

# Disable Ctrl-d (Use 'exit', 'logout')
setopt ignore_eof

# Ignore case when glob
# 「*」などのパス名展開で大文字小文字を区別しない
setopt no_case_glob

# 明確なドットの指定なしで.から始まるファイルをマッチ
setopt globdots

# Use '*, ~, ^' as regular expression
# Match without pattern
#  ex. > rm *~398
#  remove * without a file "398". For test, use "echo *~398"
setopt extended_glob

# If the path is directory, add '/' to path tail when generating path by glob
setopt mark_dirs

# Automaticall escape URL when copy and paste
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Prevent overwrite prompt from output withour cr
setopt no_prompt_cr

# Let me know mail arrival
# TODO: 何のメールが対応してるか調査,Gmail とか
#setopt mail_warning

# Do not record an event that was just recorded again.
setopt hist_ignore_dups

# Delete an old recorded event if a new event is a duplicate.
setopt hist_ignore_all_dups
setopt hist_save_nodups

# Expire a duplicate event first when trimming history.
setopt hist_expire_dups_first

# Do not display a previously found event.
setopt hist_find_no_dups

# Share history
# 各ターミナルで、個別の history を持ちたいので無効
# setopt share_history

# Pack extra blank
setopt hist_reduce_blanks

# Write to the history file immediately, not when the shell exits.
setopt inc_append_history

# Remove comannd of 'history' or 'fc -l' from history list
setopt hist_no_store

# Remove functions from history list
setopt hist_no_functions

# Record start and end time to history file
setopt extended_history

# Ignore the beginning space command to history file
setopt hist_ignore_space

# Append to history file
# history を置換(上書き)ではなく、追加方式にする
setopt append_history

# Edit history file during call history before executing
# Whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
setopt hist_verify

# Enable history system like a Bash
# !を使ったヒストリ展開を行う
setopt bang_hist

# 無駄なスクロールを避ける
# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt

# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu

# カッコの対応などを自動的に補完
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# 語の途中でもカーソル位置で補完
setopt complete_in_word

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_types

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
