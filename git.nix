{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    aliases = {
      st = "status -sb";
      co = "checkout";
      br = "branch";
      cm = "commit";
      ca = "commit -a";
      cam = "commit -am";
      caa = "commit --amend";
      aa = "add -A";
      ad = "add .";

      rb = "rebase";
      rbi = "rebase -i";
      rbc = "rebase --continue";
      rba = "rebase --abort";

      df = "diff";
      dfc = "diff --cached";

      lg = "log --oneline --graph --decorate";
      lga = "log --oneline --graph --decorate --all";

      ss = "stash";
      sp = "stash pop";
      ssu = "stash push -u";
      ssl = "stash list";
      ssd = "stash drop";

      bclean = "!git branch --merged | grep -v main | grep -v master | xargs git branch -d";
      bcleanf = "!git branch --merged | grep -v main | grep -v master | xargs git branch -D";
      bd = "branch -d";
      bD = "branch -D";

      cof = "checkout -f";
      cob = "checkout -b";
      com = "checkout main";
      cos = "checkout --";

      p = "push";
      pf = "push -f";
      pu = "pull";
      pum = "pull origin main";
      pom = "push origin main";
      pt = "push --tags";

      l = "log --oneline";
      ll = "log --stat";
      lh = "log --pretty=format:\"%h %ad %s\" --date=short";
      lr = "log --reverse";
      ls = "log --show-signature";
      bl = "blame -w";

      rs = "reset";
      rsh = "reset --hard";
      rsm = "reset --mixed";
      rsoft = "reset --soft";
      undo = "reset HEAD~";

      cl = "clean -fd";
      cln = "clean -fdx";

      d = "diff";
      dc = "diff --cached";
      dw = "diff --word-diff";
      ds = "diff --stat";

      t = "tag";
      ta = "tag -a";
      tl = "tag -l";

      cp = "cherry-pick";
      cpa = "cherry-pick --abort";
      cpc = "cherry-pick --continue";
      amend = "commit --amend --no-edit";

      rv = "remote -v";
      rma = "remote add";
      rmo = "remote remove";
      rmu = "remote update";
      fetchall = "fetch --all --prune";

      mg = "merge";
      mga = "merge --abort";
      mgc = "merge --continue";

      who = "shortlog -n -s";
      tree = "log --graph --decorate --pretty=oneline --abbrev-commit";
      roots = "rev-list --max-parents=0 HEAD";
      filehist = "!f() { git log --follow -- $1; }; f";

      last = "log -1 HEAD";
      today = "log --since=midnight --pretty=oneline";
      count = "rev-list --count HEAD";
      up = "pull --rebase";

      wtf = "!git status; echo; git log --oneline --decorate -n 3";
      pls = "push --force-with-lease";
      nuke = "!git add -A && git commit -qm WIP && git push -f";
      yolo = "!git commit -am 'temp' && git push -f";
    };
  };
}
